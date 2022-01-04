
#include <ap_int.h>
#include <stdio.h>
#include <stdlib.h>

typedef ap_int<5> type1;
typedef ap_int<10> type2;

void mult_matr_func(type1 A[3][3], type1 B[3][3], type2 C[3][3]);

int main()
{
	type1 A[3][3];
	type1 B[3][3];
	type2 C[3][3];
	type2 C_test[3][3];
	srand(0);

	for(int i = 0; i < 3; i++)
	{
			for(int j = 0; j < 3; j++ )
			{
				A[i][j]=(type1)(rand() % 32);
				B[i][j]=(type1)(rand() % 32);
			}
	}

	for(int i = 0; i < 3; i++)
			for(int j = 0; j < 3; j++ )
				C_test[i][j] = A[i][j]*B[i][j];

	mult_matr_func(A, B, C);
	int ret = 0;

	for(int i = 0; i < 3; i++)
	{
				for(int j = 0; j < 3; j++ )
				{
					if(C_test[i][j] != C[i][j])
					{
						ret=-1;
						printf("TEST FAILED!!!");
					}
				}
	}


	for(int i = 0; i < 3; i++)
	{
				for(int j = 0; j < 3; j++ )
				{
					printf("A[%d][%d] = %d \n", i, j, (int)A[i][j]);
					printf("B[%d][%d] = %d \n", i, j, (int)B[i][j]);
					printf("C[%d][%d] = %d \n", i, j, (int)C[i][j]);
					printf("C_test[%d][%d] = %d \n", i, j, (int)C_test[i][j]);
				}
	}

	return ret;

}
