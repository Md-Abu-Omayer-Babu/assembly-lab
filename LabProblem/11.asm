.model small
.stack 100h
.code
main proc
    mov al,0
    add al,1
    add al,2
    add al,3
    add al,4
    
    mov ah,0
    mov bl,10
    div bl
    
    mov cl,ah
    
    
    mov ah,2
    mov dl,al
    add dl,48
    int 21h
    mov dl,cl
    add dl,48
    int 21h
    
    exit:
    mov ah,4ch
    int 21h
    main endp
end main