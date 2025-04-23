#include<stdio.h>

// long factorial(long n){
//     long fact = 1;
//     for(long i = 1;i<=n;i++){
//         fact *= i;
//     }
//     return fact;
// }

long specialnumber(long n);

// long specialnumber(long n){
//     if(n<=0) return 0;
//     long temp = n;
//     long answer=0;
//     while(temp){
//         answer += factorial(temp%10);
//         temp /= 10;
//     }
//     if(answer == n) return 1;
//     else return 0;
// }

int main(){
    long n;
    scanf("%ld",&n);
    if(specialnumber(n)==1)printf("TRUE");
    else printf("FALSE");
    return 0;
}