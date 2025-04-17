#include<stdio.h>

void twosevenmultiple(long n, long* array);

// void twosevenmultiple(long n, long* array){
//     for(long i =1;i<=n;i++){
//         array[i-1] = i;
//         if((i)%2==0){
//             if((i)%7==0) array[i-1]=-3;
//             else array[i-1] = -1;
//         }
//         else if((i)%7==0) array[i-1]=-2;
//     }
//     return;
// }

int main(){
    long n ;
    scanf("%ld",&n);
    long array[n];
    twosevenmultiple(n,array);
    for(long i = 0; i<n ; i++){
        printf("%ld ",array[i]);
    }
    return 0;
}