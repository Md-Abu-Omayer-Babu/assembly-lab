.model small
.stack 100h
.data
a db 'Enter any Character: $'
b db 10,13, 'The charcter is: $'
.code
main proc
    mov ax,@data
    mov ds,ax
    
    mov ah,9
    lea dx,a
    int 21h
    
    mov ah,1
    int 21h
    mov bl,al
    
    cmp bl,'Y'
    je l1
    jne l2
    
    l1:
    mov ah,9
    lea dx,b
    int 21h
    
    mov ah,2
    mov dl,'Y'
    int 21h
    jmp exit
    
    l2:
    cmp bl,'y'
    je l3
    jne exit
    
    l3:
    mov ah,9
    lea dx,b
    int 21h 
    
    mov ah,2
    mov dl,'y'
    int 21h
    jmp exit
    
    
    exit:
    mov ah,4ch
    int 21h
    main endp
end main