#include <ap_int.h>

typedef ap_uint<5>  type1;
typedef ap_uint<10> type2;

void matrix_mult_fun_A2(type1 A[3][3], type1 B[3][3], type2 C[3][3]) {
    for(int i=0;i<3;i++){
        for(int j=0;j<3;j++){
            C[i][j] = A[i][j] * B[i][j];   // element-wise
        }
    }
}
