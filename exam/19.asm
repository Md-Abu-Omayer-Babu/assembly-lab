.model small
.stack 100h
.code
    mov ah,1
    int 21h
    mov bl,al
    
    cmp bl,'y'
    je print
    
    cmp bl,'Y'
    je print
    
    jmp terminate
    
    print:
    mov ah,2
    mov dl,bl
    int 21h
    main endp
end main   