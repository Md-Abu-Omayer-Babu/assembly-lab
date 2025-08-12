.model small
.stack 100h
.code

main proc
    mov ax,'A'
    push ax

    mov ax,0
    
    pop ax

    mov ah,2
    mov dx,ax
    int 21h

    mov ah,4ch
    int 21h
    main endp
end main