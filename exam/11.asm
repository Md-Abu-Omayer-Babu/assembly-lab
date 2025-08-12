.model small
.stack 100h
.data
startingNum db 6   ; starting number (change to any value)
msg db "Sum: $"
.code
main proc
    mov ax,@data
    mov ds,ax
    
    mov cx,3
    mov al,startingNum     ;sum of 4 natural number from 1
    mov bl,al
    
    loop1:
    inc al
    add bl,al
    loop loop1
    
    ;Print message
    mov ah, 9
    lea dx, msg
    int 21h


    mov al, bl 
    mov ah, 0
    mov cl, 10
    div cl
    
    mov cl,al
    mov ch,ah        

    ; Print tens digit
    add cl, '0'
    mov dl, cl
    mov ah, 2
    int 21h

    ; Print ones digit
    mov al, ch
    add al, '0'
    mov dl, al
    mov ah, 2
    int 21h

    ; Exit program
    mov ah, 4Ch
    int 21h
    
    
    
                      
    
    main endp
end main