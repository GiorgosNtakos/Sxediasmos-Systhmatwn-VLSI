// matrix_mul_B_pragmas.cpp
#include <ap_int.h>

typedef ap_uint<12> type1;
typedef ap_uint<26> type2;

void OGmult_matr_func(type1 A[3][3], type1 B[3][3], type2 C[3][3]) {
#pragma HLS ARRAY_PARTITION variable=A complete dim=0
#pragma HLS ARRAY_PARTITION variable=B complete dim=0
#pragma HLS ARRAY_PARTITION variable=C complete dim=0

    for (int i = 0; i < 3; i++) {
#pragma HLS UNROLL
        for (int j = 0; j < 3; j++) {
#pragma HLS UNROLL
            type2 acc = 0;
#pragma HLS PIPELINE II=1
            for (int k = 0; k < 3; k++) {
#pragma HLS UNROLL
                acc += (type2)A[i][k] * (type2)B[k][j];
            }
            C[i][j] = acc;
        }
    }
}
