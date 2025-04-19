#include<stdio.h>

long palindrome(long n);

// long palindrome(long n){
//     long temp = n;
//     long reverse = 0;
//     while(temp){
//         reverse = reverse*10 + temp%10;
//         temp = temp / 10;
//     }
//     if(reverse==n) return 1;
//     else return 0;
// }

int main(){
    long n;
    scanf("%ld", &n);
    if(palindrome(n)) printf("TRUE");
    else printf("FALSE");
    return 0;
}