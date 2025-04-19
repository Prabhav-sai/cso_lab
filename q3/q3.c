#include<stdio.h>

long ascii_score(char* string);

// long ascii_score(char* string){
//     long score = 0;
//     long temp;
//     for(long i = 1;string[i]!=0; i++){
//         temp = string[i]-string[i-1];
//         if(temp>=0)score += temp;
//         else score -= temp;
//     }
//     return score;
// }

int main(){
    char string[101];
    scanf("%s",string);
    printf("%ld",ascii_score(string));
    return 0;
}