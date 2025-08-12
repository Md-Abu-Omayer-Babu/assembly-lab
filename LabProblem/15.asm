.model small
.stack 100h
.data
a db 'Read character: $'
.code
main proc
    mov ax,@data
    mov ds,ax
    
    mov ah,9
    lea dx,a
    int 21h
    
    read_loop:
    mov ah,1
    int 21h
    mov dl,al
    
    cmp dl,32
    je exit
    
    loop read_loop
    
    exit:
    mov ah,4ch
    int 21h
    main endp
end main