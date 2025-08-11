.model small
.stack 100h
.code
main proc
           mov ah, 1h
           int 21h
           mov bl, al
           mov ah, 1h
           int 21h
           mov bh, al
           cmp bl, bh
           jbe First
           jmp Second
    First: 
           mov ah, 2h
           mov dl, bl
           int 21h
           mov ah, 2h
           mov dl, bh
           int 21h
           jmp exit
    Second:
           mov ah, 2h
           mov dl, bh
           int 21h
           mov ah, 2h
           mov dl, bl
           int 21h
           jmp exit
    exit:  
           mov ah, 4Ch
           int 21h
main endp
end main
