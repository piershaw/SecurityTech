;
;By pier shaw
;
%include "io.inc"
; for me to read SASM uses this lib at the to nothing will work for system calls but theses on this IDE
;Macro name
;Description
;PRINT_UDEC size, data

;PRINT_DEC size, data
;Print number data in decimal representation. size – number, giving size of data in bytes - 1, 2, 4 or 8 (x64). data must be number or symbol constant, name of variable, register or address expression without size qualifier (byte[], etc.). PRINT_UDEC print number as unsigned, PRINT_DEC — as signed.
;PRINT_HEX size, data
;Similarly previous, but data is printed in hexadecimal representation.
;PRINT_CHAR ch
;Print symbol ch. ch - number or symbol constant, name of variable, register or address expression without size qualifier (byte[], etc.).
;PRINT_STRING data
;Print null-terminated text string. data - string constant, name of variable or address expression without size qualifier (byte[], etc.).
;NEWLINE
;Print newline ('\n').
;GET_UDEC size, data
;
;GET_DEC size, data
;Input number data in decimal representation from stdin. size – number, giving size of data in bytes - 1, 2, 4 or 8 (x64). data must be name of variable or register or address expression without size qualifier (byte[], etc.). GET_UDEC input number as unsigned, GET_DEC — as signed. It is not allowed to use esp register.
;GET_HEX size, data
;Similarly previous, but data is entered in hexadecimal representation with 0x prefix.
;GET_CHAR data
;Similarly previous, but macro reads one symbol only.
;GET_STRING data, maxsz
;Input string with length less than maxsz. Reading stop on EOF or newline and "\n" writes in buffer. In the end of string 0 character is added to the end. data - name of variable or address expression without size qualifier (byte[], etc.). maxsz - register or number constant.



section .data
GameTittle:            db '#### SecurityTech Services Text Adventure Game #### by Pier Shaw',10,0;
ANEWDAY:               db 'The Start of A New Day well graveyard shift anyways. You are staring out to the distance through a dirty car window most people clean their windows but you like them dirty so nobody can see inside well waiting for your relief if he shows up this time. You wait for 15 minutes if he is not here you have to call the supervisor and work his shift and you hate hate!! Graveyard shift',10,0;
Employee_Parking_Lot:  db 'You are in a car grinding your teeth and need to use the restroom there is a pile of trash there is something moving in the trash you always wondered what it was you thought you would clean it out when you paid it off 18 months left buddy',10,0;
msgs:                  db '>',10,0 ;10 is new line
player:                db 'My name is pier',10,0
computer:              db 'What is your name' ,10,0
formatin:              db ''
SPrompt:               db 'Enter string data, followed by Enter: ',0
IPrompt:               db 'Enter an integer value, followed by Enter: ',0
IFormat:               db '%d',0
SShow:                 db 'The string you entered was: %s',10,0
IShow:                 db 'The integer value you entered was: %5d',10,0
msg:                   db '',10,0


line1: db "The Start of A New Day, Well graveyard shift anyways.",0
line2: db "Youre staring out to the distance through a dirty car window",0
line3: db "most people clean their windows but you like them dirty",0
line4: db "so nobody can see inside well waiting for your relief if he shows up this time.",0
line5: db "You wait for 15 minutes if hes not here you have to call the supervisor",0
line6: db "and work his shift and you hate hate!! Graveyard shift",0
line7: db "Employee Parking Lot Youre in a car grinding your teeth and need to use the restroom",0
playerLength:          equ $-player
computerLength:        equ $-computer
        
section .bss 
    playerV:            resb 255
    IntVal: resd 1 ; Reserve an uninitialized double word
    InString: resb 128 ; Reserve 128 bytes for string entry buffer
section .text
    extern out_string
    extern in_string
    extern prompt_and_read
    extern scanf 
    extern printf
    extern stdin ; Standard file variable for input
    extern fgets
    global CMAIN; in c++ land calls this 1st
    
CMAIN:
    mov ebp, esp; for correct debugging
    ;mov ebp, esp; for correct debugging
    ;mov ebp, esp; for correct debugging
    ;mov	ebx,1		; file descriptor (stdout)
    ;mov	eax,4		; system call number (sys_write)
    ;mov	ecx,computer		; message to write
    ;mov	edx,computerLength		; message length
    ;push computer
    ;call printf
    ;pop ebp
    ;push formatin
    ;call scanf
    ;add esp, 8
    ;pop ebp
    ;mov ah, 01h
    ;int 21h
    ;mov dl, al
    ;push formatin
    ;mov	edx,4 ; size
    ;call scanf
    ;mov ebx, eax            ;ebx holds input
    ;push ebx
    ;call printf
    ;pop eax
    ;pop ecx
    ;mov     eax, 1                  ; system call 1 is write
    ;mov     edi, 1                  ; file handle 1 is stdout
    ;mov     esi, player            ; address of string to output
   ; mov     edx, playerLength                 ; number of bytes


    ;SASM systm calls
    GET_DEC 4,eax ; invoke operating system to do the read the same as int 80h or syscall or scanf
    PRINT_DEC 4,eax ; invoke operating system to do the write
   
  
    ;push ebx ; Program must preserve ebp, ebx, esi, & edi
    ;push esi
    ;push edi
    
    ;;; Everything before this is boilerplate; use it for all ordinary apps!
    ; First, an example of safely limited string input using fgets:
    ;push computer ; Push address of the prompt string
    ;call printf ; Display it
    ;add esp,4 ; Stack cleanup for 1 parm
    ;push DWORD [ebx] ; Push file handle for standard input
   
   PRINT_STRING GameTittle
   NEWLINE
   NEWLINE
   GET_CHAR msg ; Standard file variable for input
   ;push msg
   ;call msg
   PRINT_STRING msg
    ;int	0x80		; call kernel
    ret
main:
    mov ebp, esp; for correct debugging
    PRINT_STRING GameTittle
    NEWLINE
    NEWLINE
    ;PRINT_STRING ANEWDAY
    ;NEWLINE
   
    mov ebx, 10
    mov ecx ,eax
    ;call while
    ;push dword GameTittle
    ;call printf
    
    jmp show
    leave
    ret
show:
    enter 0,0
    PRINT_STRING Employee_Parking_Lot
    cmp eax,esp
    jne exit
    xor eax, eax
    leave
    ret
    
exit:
    PRINT_STRING msgs
    NEWLINE
    xor eax, eax
    leave
    ret
    
while: ; my while loop works good
    add ecx, 1
    PRINT_STRING msgs
    NEWLINE
    cmp ecx,ebx
    je show
    
    jmp while
    
;later for my functions this is print out to console
;print:
  