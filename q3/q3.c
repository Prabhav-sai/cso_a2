#include<stdio.h>

// long stack[100];
// long top = 0;

// void push(long a){
//     stack[top]=a;
//     top++;
// }

// long pop(){
//     top--;
//     return stack[top];
// }

void next_high(long n, long* array, long* answer);

// void next_high(long n, long* array, long* answer){
//     for(long i = n-1;i>=0;i--){
//         while(top>0){
//             // printf("%ld %ld\n",i,stack[top-1]);
//             if(array[i]>stack[top-1]) pop();
//             else break;
//         }
//         push(array[i]);
//         if(top==1) answer[i]=-1;
//         else answer[i]=stack[top-2];
//         // printf("%ld %ld\n",i,stack[top-2]);
//     }
//     return;
// }

int main(){
    long n;
    scanf("%ld",&n);
    long array[n];
    for(long i =0;i<n;i++){
        scanf("%ld",&array[i]);
    }
    long answer[n];
    next_high(n,array,answer);
    for(long i = 0;i<n;i++){
        printf("%ld ",answer[i]);
    }

    return 0;
}