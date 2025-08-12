.model small
.stack 100h
.data
.code

main proc

mov ah, 2          ; DOS function to display character
mov cx, 256        ; Number of characters to print (128 to 255)
mov dl, 0        ; Start from ASCII 128

PRINT_LOOP: 
    INT 21H 
    INC DL
    DEC CX

    jnz PRINT_LOOP

mov ah, 4ch
int 21h
main endp
end main



