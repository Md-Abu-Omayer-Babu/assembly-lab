.model small
.stack 100h
.data
.code
main proc
    mov ax,@data
    mov ds,ax
    
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
    
    add bl,bh
    
    mov al,bl
    mov bh,10
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
    main endp
end main