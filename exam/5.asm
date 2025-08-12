.model small
.stack 100h
.data
a db "Enter the string: $"
b db 10,13,"Reversed string: $"
arr db 5 dup('?')
.code
main proc
    mov ax,@data
    mov ds,ax
    mov si,offset arr 
    
    mov ah,9
    lea dx,a
    int 21h
    
    
    mov cx,6 
    mov ah,1 
    loop1:
    int 21h
    mov [si],al
    mov bx,[si]
    push bx
    inc si
    loop loop1
    
    mov ah,9
    lea dx,b
    int 21h 
    
    mov cx,6
    loop2:
    pop dx
    mov ah,2
    int 21h
    loop loop2
    
    main endp
end main
    