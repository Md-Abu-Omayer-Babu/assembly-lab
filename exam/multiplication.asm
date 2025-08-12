.model small
.stack 100h
.data
a db "Enter first number(2digit): $"
b db 10,13,"Enter second number(2digit): $"
r db 10,13,"Result: $"
.code
main proc
    mov ax,@data
    mov ds,ax
    
    mov ah,9
    lea dx,a
    int 21h
    mov ah,1
    int 21h
    sub al,'0'
    mov bl,al
    
    
    mov ah,1
    int 21h
    sub al,'0'
    mov bh,al
    
    mov ah,0
    mov al,bl
    
    mov cl,10
    mul cl
    
    add al,bh
    
    mov bl,al
    
    mov ah,9
    lea dx,b
    int 21h
    
    mov ah,1
    int 21h
    sub al,'0'
    mov dl,al
    
    mov ah,1
    int 21h
    sub al,'0'
    mov dh,al
    
    mov ah,0
    mov al,dl
    
    mov cl,10
    mul cl
    
    add al,dh
    
    mov bh,al
    
    
    mov al,bl
    mul bh
    
    AAM
    
    mov cl,al
    add cl,'0'
    mov ch,ah
    ;add ch,'0'
    
    mov ah,9
    lea dx,r
    int 21h
    
    mov al,ch
    mov bh,10
    mov ah,0
    div bh
    
    mov bl,al
    add bl,'0'
    mov bh,ah 
    add bh,'0'
    
    mov ah,2
    mov dl,bl
    int 21h
    
    mov ah,2
    mov dl,bh
    int 21h  
    
    mov ah,2
    mov dl,cl
    int 21h
    

           
    main endp
end main
    