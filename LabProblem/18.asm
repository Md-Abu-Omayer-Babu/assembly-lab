.model small
.stack 100h
.data
a db 10,13,'The order is: $'
b db 'Enter Two Capital Letters: $'
.code
main proc
    mov ax,@data
    mov ds,ax
    
    mov ah,9
    lea dx,b
    int 21h
    
    mov ah,1
    int 21h
    mov bl,al
    
    int 21h
    mov bh,al
    
    mov ah,9
    lea dx,a 
    int 21h
    
    cmp bl,bh
    jl l1
    
    mov ah,2
    mov dl,bh
    int 21h
    
    l1:
    mov ah,2
    mov dl,bl
    int 21h
    
    
    exit:
    mov ah,4ch
    main endp
end main