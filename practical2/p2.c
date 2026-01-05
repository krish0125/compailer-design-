#include <stdio.h>
#include <ctype.h>
#include <string.h>

int main() {
    char str[100];
    int digits = 0, vowels = 0, symbols = 0;
    
    printf("Enter a string: ");
    fgets(str, sizeof(str), stdin);
    
    for (int i = 0; str[i] != '\0'; i++) {
        char ch = str[i];
        
        if (isdigit(ch)) {
            digits++;
        } 
        else if (isalpha(ch)) {
            ch = tolower(ch);
            if (ch == 'a' || ch == 'e' || ch == 'i' || ch == 'o' || ch == 'u') {
                vowels++;
            }
        } 
        else if (!isspace(ch)) {
            symbols++;
        }
    }
    
    printf("Digits: %d\n", digits);
    printf("Vowels: %d\n", vowels);
    printf("Symbols: %d\n", symbols);
    
    return 0;
}