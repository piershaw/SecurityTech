%include "io.inc"

section .data
cursor db '>',10,0;
input db '',10,0;

section .text
extern printf
extern scanf
global CMAIN
CMAIN:
    ;write your code here
    xor eax, eax
    mov ebp, esp; instruction pointer
    push dword cursor
    call printf
    pop ebp; instruction pointer
    mov ebp, esp;
    push input
    call scanf
    mov ebp, esp;
    call printf
    pop ebp
    ;call getchar, eax
    ;call printf, eax
    ret
    	   	