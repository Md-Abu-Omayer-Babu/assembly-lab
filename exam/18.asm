.model small
.code
main proc
    mov ah,1
    int 21h
    mov bl,al
    
    int 21h 
    mov bh,al 
    
    cmp bl,bh
    jbe skip_swap
    
    xchg bl,bh
    
    skip_swap:
    mov ah,2
    
    ;newline
    mov dl,10
    int 21h
    mov dl,13
    int 21h
    
    mov dl,bl
    int 21h
    
    mov dl,bh
    int 21h 
    
    main endp
end main