.model small
.stack 100h
.code
main proc
    mov ah,1
    
    repeat:
    int 21h
     
    cmp al,' '
    jne repeat 
    
    main endp
end main