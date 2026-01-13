// matrix_mul_B_tb.cpp
#include <ap_int.h>
#include <cstdio>
#include <cstdlib>

typedef ap_uint<12> type1;
typedef ap_uint<26> type2;

void OGmult_matr_func(type1 A[3][3], type1 B[3][3], type2 C[3][3]);

int main() {
    type1 A[3][3], B[3][3];
    type2 C[3][3], C_ref[3][3];

    srand(0);

    // random inputs 0..4095
    for(int i=0;i<3;i++){
        for(int j=0;j<3;j++){
            A[i][j] = (type1)(rand() & 0xFFF);
            B[i][j] = (type1)(rand() & 0xFFF);
        }
    }

    // golden
    for(int i=0;i<3;i++){
        for(int j=0;j<3;j++){
            type2 acc = 0;
            for(int k=0;k<3;k++){
                acc += (type2)A[i][k] * (type2)B[k][j];
            }
            C_ref[i][j] = acc;
        }
    }

    OGmult_matr_func(A,B,C);

    int ret = 0;
    for(int i=0;i<3;i++){
        for(int j=0;j<3;j++){
            if(C[i][j] != C_ref[i][j]){
                std::printf("Mismatch at [%d][%d]: got=%u exp=%u\n",
                            i, j, (unsigned)C[i][j], (unsigned)C_ref[i][j]);
                ret = -1;
            }
        }
    }

    if(ret==0) std::printf("PASS\n");
    else       std::printf("FAIL\n");

    return ret;
}
