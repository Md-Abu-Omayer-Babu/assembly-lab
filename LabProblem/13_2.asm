.model
.stack 100h
.code
main proc
    mov ah,1
    int 21h
    mov bl,al
    
    int 21h
    mov bh,al
    
    int 21h
    mov cl,al
    
    cmp bl,bh
    jge a
    
    a:
    cmp bl,cl
    jge b
    mov ah,2
    mov dl,cl
    int 21h
    jmp exit
    
    b:
    mov ah,2
    mov dl,bl
    int 21h
    jmp exit
    
    c:
    cmp bh,cl
    jge d
    mov ah,2
    mov dl,cl
    int 21h
    jmp exit
    
    d:
    mov ah,2
    mov dl,bh
    int 21h
    jmp exit
    
    exit:
    mov ah,4ch
    main endp
end main