
#include <ap_int.h>

typedef ap_int<12> type1;
typedef ap_int<24> type2;

void OGmult_matr_func(type1 A[4][4], type1 B[4][4], type2 C[4][4])
{

#pragma HLS array_partition variable = A complete
#pragma HLS array_partition variable = B complete
#pragma HLS array_partition variable = C complete


	for(int i = 0; i < 4; i++)
	{
#pragma HLS unroll factor = 4
			for(int j = 0; j < 4; j++ )
			{
#pragma HLS unroll factor = 4
				C[i][j] = 0;
				for(int k = 0; k < 4; k++ )
				{
#pragma HLS unroll factor = 4
					C[i][j] += A[i][k]*B[k][j];
				}
			}
	}
}