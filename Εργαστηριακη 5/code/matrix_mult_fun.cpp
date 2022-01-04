#include <ap_int.h>

typedef ap_int<5> type1;
typedef ap_int<10> type2;

void mult_matr_func(type1 A[3][3], type1 B[3][3], type2 C[3][3])
{

#pragma HLS array_partition variable = A block factor = 3 dim = 1
#pragma HLS array_partition variable = B block factor = 3 dim = 1
#pragma HLS array_partition variable = C block factor = 3 dim = 1

	for(int i = 0; i < 3; i++)
#pragma HLS pipeline II = 1
		for(int j = 0; j < 3; j++ )
			C[i][j] = A[i][j]*B[i][j];
}
