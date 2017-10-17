# include <cstdio>

// void dgemm(int n, double *A, double *B, double *C){
// 	for (int i = 0; i < n; i++){
// 		for (int j = 0; j < n; j++){
// 			double cij = C[i+j*n];  // C[i][j]
// 			for (int k = 0; k < n; k++){
// 				cij += A[i+k*n] * B[k+j*n]; // A[i][k] * B[k][j]
// 			}
// 			C[i+j*n] = cij;
// 		}
// 	}
// }

#include <x86intrin.h>
// 编译的时候要带上-mavx参数
void dgemm(int n, double* A, double* B, double *C){
	for (int i = 0; i < n; i+=4){
		for (int j = 0; j < n; j++){
			__m256d c0= _mm256_load_pd(C+i+j*n); /* c0 = C[i][j] */
			for (int k = 0; k < n; k++)
				c0 = _mm256_add_pd(c0, /* c0 += A[i][k] *B[k][j] */
				_mm256_mul_pd (_mm256_load_pd(A+i+k*n),
				_mm256_broadcast_sd(B+k+j*n)));
			_mm256_store_pd(C+i+j*n, c0); /* C[i][j] =c0*/
		}
	}
}

int main(){
	return 0;
}