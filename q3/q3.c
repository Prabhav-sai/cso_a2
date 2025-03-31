#include<stdio.h>

long subarray(long n, long * input){
    long answer = 0;
    long sum = 0;
    for(long i =0;i<n;i++){
        for(long j=i;j<n;j++){
            sum += input[j];
            if(sum == 0) answer++;
        }
        sum = 0;
    }
    return answer;
}

int main(){
    long n;
    scanf("%ld",&n);
    long array[n];
    for(long i =0;i<n;i++){
        scanf("%ld",&input[i]);
    }
    subarray(n,input);
    return 0;
}