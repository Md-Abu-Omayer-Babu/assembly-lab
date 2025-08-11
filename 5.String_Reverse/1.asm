.model small
.stack 100h

.data     
str db 'Enter a string: $'           
buffer db 20, ? , 20 dup('$')        
msg db 13,10,'Reversed: $'           
newline db 0ah, 0dh                  

.code
main:
    mov ax, @data
    mov ds, ax                      

    mov ah, 09h
    lea dx, str
    int 21h

    lea dx, buffer
    mov ah, 0Ah
    int 21h

    lea dx, msg
    mov ah, 09h
    int 21h

    lea si, buffer + 2              
    mov cl, [buffer + 1]            
    mov ch, 0                       
    add si, cx                     
    dec si                         

print_loop:
    mov dl, [si]                   
    mov ah, 02h                    
    int 21h

    dec si                        
    loop print_loop               

    mov ah, 4Ch
    int 21h
end main
