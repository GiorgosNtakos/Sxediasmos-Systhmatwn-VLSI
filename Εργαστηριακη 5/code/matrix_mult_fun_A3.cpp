#include <ap_int.h>

typedef ap_uint<5>  type1;
typedef ap_uint<10> type2;

void matrix_mult_fun_A3(type1 A[3][3], type1 B[3][3], type2 C[3][3]) {
#pragma HLS ARRAY_PARTITION variable=A complete dim=0
#pragma HLS ARRAY_PARTITION variable=B complete dim=0
#pragma HLS ARRAY_PARTITION variable=C complete dim=0

    for(int i=0;i<3;i++){
#pragma HLS UNROLL
        for(int j=0;j<3;j++){
#pragma HLS UNROLL
            C[i][j] = A[i][j] * B[i][j];
        }
    }
}
