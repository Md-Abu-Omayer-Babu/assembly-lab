.model small
.stack 100h
.data
r db 10,13,"largest digit is: $"
.code
main proc
    mov ax, @data
    mov ds, ax

    ; Read first char
    mov ah, 1
    int 21h
    mov bl, al

    ; Read second char
    mov ah, 1
    int 21h
    mov bh, al

    ; Read third char
    mov ah, 1
    int 21h
    mov cl, al

    ; Print message
    mov ah, 9
    lea dx, r
    int 21h

    cmp bl, bh
    jge a

    b:
    cmp bh, cl
    jge c
    mov ah, 2       
    mov dl, cl
    int 21h
    jmp exit

    c:
    mov ah, 2
    mov dl, bh
    int 21h
    jmp exit

    a:
    cmp bl, cl
    jge d
    mov ah, 2
    mov dl, cl
    int 21h
    jmp exit

    d:
    mov ah, 2
    mov dl, bl
    int 21h

exit:
    mov ah, 4Ch
    int 21h

main endp
end main
