.model small
.stack 100h
.data
a db 'Enter a Sequence: $'
b db 10,13, 'The first character is: $'
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
    
    read_char:
    int 21h
    
    cmp al,32
    je done
    jmp read_char
    
    done:
    mov ah,9
    lea dx,b
    int 21h
    
    mov ah,2
    mov dl,bl
    int 21h
    jmp exit
    
    exit:
    mov ah,4ch
    int 21h
    main endp
end main