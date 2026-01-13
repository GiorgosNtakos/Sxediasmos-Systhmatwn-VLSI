library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Xilinx 7-series primitives
library UNISIM;
use UNISIM.VComponents.ALL;

-- 32 x 8 RAM using one RAMB18E1 in TDP mode (Artix-7).
-- We implement SDP behavior:
--   Port A: READ-only
--   Port B: WRITE-only
--
-- Reason: In RAMB18E1 "SDP mode" one port must be x32 or x36 (UG473 Table 1-12),
-- so x9 (byte) is not a legal SDP configuration. TDP supports x9 and matches the required RAM.

entity ram32x8_bram_sdp is
  port (
    clk  : in  std_logic;                       -- common clock
    wr   : in  std_logic;                       -- 1=write, 0=read (B1-like interface)
    addr : in  std_logic_vector(4 downto 0);     -- 32 addresses
    din  : in  std_logic_vector(7 downto 0);
    dout : out std_logic_vector(7 downto 0)
  );
end entity;

architecture rtl of ram32x8_bram_sdp is
  -- Enables
  signal rden  : std_logic;
  signal wren  : std_logic;

  -- RAMB18E1 address buses (14-bit)
  signal addra : std_logic_vector(13 downto 0);
  signal addrb : std_logic_vector(13 downto 0);

  -- Data buses (Port A output, Port B input)
  signal do_a  : std_logic_vector(15 downto 0);
  signal di_b  : std_logic_vector(15 downto 0);

  -- Parity buses (unused)
  signal dop_a : std_logic_vector(1 downto 0);
  signal dip_b : std_logic_vector(1 downto 0);

  -- Byte write enable bus for Port B
  signal webwe : std_logic_vector(3 downto 0);
begin
  ---------------------------------------------------------------------------
  -- Interface adaptation (B1-like)
  ---------------------------------------------------------------------------
  wren <= wr;
  rden <= not wr;

  ---------------------------------------------------------------------------
  -- Address mapping for x9 (byte) mode in RAMB18E1
  -- For x9, the BRAM uses address bits [13:3] as the word address.
  -- We have 32 words => 5 bits, mapped into [7:3]. Bits [2:0] are 0.
  ---------------------------------------------------------------------------
  addra <= "000000000" & addr;

  addrb <= "000000000" & addr;

  ---------------------------------------------------------------------------
  -- Data mapping
  ---------------------------------------------------------------------------
  di_b <= (15 downto 8 => '0') & din;


  dip_b <= (others => '0');  -- parity unused
  dout  <= do_a(7 downto 0);

  ---------------------------------------------------------------------------
  -- Write enable mapping
  -- In x9 mode, WEBWE(0) is sufficient. Others kept 0.
  ---------------------------------------------------------------------------
  webwe <= "0001" when wren = '1' else "0000";

  ---------------------------------------------------------------------------
  -- RAM primitive
  ---------------------------------------------------------------------------
  U_BRAM : RAMB18E1
    generic map (
      -- Use TDP; enforce SDP behavior by disabling write on A and read usage on B
      RAM_MODE => "SDP",

      -- Use x9 (8 data + 1 parity) on both ports (consistent configuration)
      READ_WIDTH_A  => 9,
      WRITE_WIDTH_B => 9,

      -- Read-during-write behavior (only relevant if same address collisions happen)
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",

      -- No output registers
      DOA_REG => 0,
      DOB_REG => 0,

      SIM_COLLISION_CHECK => "ALL"
    )
    port map (
      -----------------------------------------------------------------------
      -- Port A (READ-only)
      -----------------------------------------------------------------------
      CLKARDCLK     => clk,
      ENARDEN       => rden,              -- enable reads when wr=0
      ADDRARDADDR   => addra,
      DOADO         => do_a,
      DOPADOP       => dop_a,

      -- Disable writes on Port A
      DIADI         => (others => '0'),
      DIPADIP       => (others => '0'),
      WEA           => (others => '0'),

      -- Output reg control / resets (unused)
      REGCEAREGCE   => '1',
      RSTRAMARSTRAM => '0',
      RSTREGARSTREG => '0',

      -----------------------------------------------------------------------
      -- Port B (WRITE-only)
      -----------------------------------------------------------------------
      CLKBWRCLK     => clk,
      ENBWREN       => wren,              -- enable writes when wr=1
      ADDRBWRADDR   => addrb,
      DIBDI         => di_b,
      DIPBDIP       => dip_b,
      WEBWE         => webwe,

      -- We don't use Port B outputs
      DOBDO         => open,
      DOPBDOP       => open,

      -- Output reg control / resets (unused)
      REGCEB        => '1',
      RSTRAMB       => '0',
      RSTREGB       => '0'
    );

end architecture;
