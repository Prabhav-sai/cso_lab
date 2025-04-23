#include<stdio.h>

long balance(long n,char* array);

// long balance(long n,long* array){
//     for(long i = 0;i<n;i++){
//          if(top == 0) push() top++;
//          
//         if(stack[top]=='('){
//             if(array[i]==')') pop();
//             else push();
//         }
//         if(stack[top]=='{'){
//             if(array[i]=='}') pop();
//             else push();
//         }
//         if(stack[top]=='['){
//             if(array[i]==']') pop();
//             else push();
//         }
//         if(top == 0) return 1;
//         else return 0;
//     }
// }

int main(){
    // char s = ']';
    // printf("%ld",s);
    long n;
    scanf("%ld",&n);
    char input[n];
    scanf("%s",&input);
    if(balance(n,input)==1)printf("BALANCED");
    else printf("NOT BALANCED");

    return 0;
}