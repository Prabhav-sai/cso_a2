#include<stdio.h>

long subarray(long n, long * array);

// long subarray(long n, long * array){
//     long answer = 0;
//     long sum = 0;
//     for(long i =0;i<n;i++){
//         for(long j=i;j<n;j++){
//             sum += array[j];
//             if(sum == 0) answer++;
//         }
//         sum = 0;
//     }
//     return answer;
// }

int main(){
    long n;
    scanf("%ld",&n);
    long array[n];
    for(long i =0;i<n;i++){
        scanf("%ld",&array[i]);
    }
    printf("%ld",subarray(n,array));
    return 0;
}