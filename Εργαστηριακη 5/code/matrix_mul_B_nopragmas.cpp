// matrix_mul_B_nopragmas.cpp
#include <ap_int.h>

typedef ap_uint<12> type1;   // 0..4095
typedef ap_uint<26> type2;   // αρκετό για sum of 3 products

void OGmult_matr_func(type1 A[3][3], type1 B[3][3], type2 C[3][3]) {
    for (int i = 0; i < 3; i++) {
        for (int j = 0; j < 3; j++) {
            type2 acc = 0;
            for (int k = 0; k < 3; k++) {
                acc += (type2)A[i][k] * (type2)B[k][j];
            }
            C[i][j] = acc;
        }
    }
}
