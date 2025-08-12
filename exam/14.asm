.model small
.code
main proc
    mov al,'X'
    mov bl,'Z'
    
    mov ah,2
    
    cmp al,bl
    jnbe else
    
    mov dl,al
    jmp display
    
    else:
    mov dl,bl
    
    display:
    int 21h
    
    main endp
end main