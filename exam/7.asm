.model small
.stack 100h
.data
    msg db "Fibonacci Series: $" 

.code
main proc
    mov ax, @data
    mov ds, ax

    ; Print message
    mov ah, 9
    lea dx, msg
    int 21h

    ; Initialize first two terms
    mov bh, 0            ; first term
    mov bl, 1            ; second term

    
    mov ah,2
    mov dl,bh
    add dl,'0'
    int 21h
    
    mov cx, 6         ; counter for number of terms          

print_loop:
 
    ; Print space
    mov dl, ' '
    mov ah, 2
    int 21h
    
    ; Calculate next term
    mov dh, bl           
    add bl, bh           
    mov bh, dh
    
    mov ah,2
    mov dl,dh
    add dl,'0'
    int 21h         

               
    loop print_loop       

    ; Exit
    mov ah, 4Ch
    int 21h
main endp
end main