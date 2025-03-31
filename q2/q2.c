#include<stdio.h>

long recursion(long n, long r);

// long recursion(long n, long r){
//     if(r==0) return 1;
//     return recursion(n,r-1)*(n-r+1)/r;
// }

int main(){
    long n,r;
    scanf("%ld %ld",&n,&r);
    printf("%ld",recursion(n,r));
    return 0;
}