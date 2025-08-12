.model small
.stack 100h
.data
a db 10,13,'Lower Form: $'
b db 10,13, 'Upper Form: $'
c db 'Enter Upper Form: $'
d db 'Enter Lower Form: $'
.code
main proc
    mov ax,@data
    mov ds,ax
    
    mov ah,9
    lea dx,c
    int 21h
    
    mov ah,1
    int 21h
    mov bl,al
    
    add bl,32
    
    mov ah,9
    lea dx,a
    int 21h
    
    mov ah,2
    mov dl,bl
    int 21h
    
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
    
    mov ah,9
    lea dx,d
    int 21h
    
    mov ah,1
    int 21h
    mov bh,al
    
    sub bh,32
    
    mov ah,9
    lea dx,b
    int 21h
    
    mov ah,2
    mov dl,bh
    int 21h
    
    exit:
    mov ah,4ch
    
    exit:
    mov ah, 4ch
    int 21h
    main endp
end main