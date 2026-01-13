#include <iostream>
#include <cstdlib>
#include <ap_int.h>

typedef ap_uint<5>  type1;
typedef ap_uint<10> type2;

//void matrix_mult_fun_A2(type1 A[3][3], type1 B[3][3], type2 C[3][3]);
void matrix_mult_fun_A3(type1 A[3][3], type1 B[3][3], type2 C[3][3]);

int main() {
    type1 A[3][3], B[3][3];
    type2 C[3][3];

    // γέμισμα με 0..31
    for(int i=0;i<3;i++){
        for(int j=0;j<3;j++){
            A[i][j] = (type1)(rand() % 32);
            B[i][j] = (type1)(rand() % 32);
        }
    }

    //matrix_mult_fun_A2(A,B,C);
    matrix_mult_fun_A3(A,B,C);

    // golden check
    for(int i=0;i<3;i++){
        for(int j=0;j<3;j++){
            unsigned int golden = (unsigned int)A[i][j] * (unsigned int)B[i][j];
            if(C[i][j] != (type2)golden){
                std::cout << "Mismatch at ["<<i<<"]["<<j<<"] "
                          << "A="<<(unsigned)A[i][j]
                          << " B="<<(unsigned)B[i][j]
                          << " got="<<(unsigned)C[i][j]
                          << " exp="<<golden << "\n";
                return 1;
            }
        }
    }

    std::cout << "PASS\n";
    return 0;
}
