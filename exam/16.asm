.model small
.stack 100h
.code
main proc
    mov cx,80
    mov ah,2
    mov dl,'*'
    
    top:
    int 21h
    loop top
    
    main endp
end main