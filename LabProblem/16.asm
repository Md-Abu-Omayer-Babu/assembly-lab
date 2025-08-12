.model small
.stack 100h
.code
main proc
    mov cx,80
    
    print_star:
    mov ah,2
    mov dl,'*'
    int 21h
    
    dec dl
    loop print_star
    
    exit:
    mov ah,4ch
    int 21h
    main endp
end main