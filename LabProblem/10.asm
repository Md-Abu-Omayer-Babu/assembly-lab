.model small
.stack 100h
.data
g db 'Enter the number: $'
a db 'The grade is: A+ $'
b db 'The grade is: A $ '
c db 'The grade is: B $'
d db 'The grade is: C $'
e db 'The grade is: D $'
f db 'The grade is: F $'
.code
main proc
    mov ax,@data
    mov ds,ax
    
    mov ah,9
    lea dx,g
    int 21h
        
    mov ah,1
    int 21h
    sub al,'0'
    mov bl,al
    
    mov ah,1
    int 21h
    sub al,'0'
    mov bh,al
    
    mov al,bl
    mul cl
    add al,48    
    
    mov ah, 2
    mov dl, 10
    int 21h
    mov dl, 13
    int 21h
    
    cmp al, 80
    jge A1
    
    cmp al, 70
    jge B1
    
    cmp al, 60
    jge C1
    
    cmp al, 50
    jge D1
    
    cmp al, 33
    jge E1
    
    jl F1
    
A1:
    mov ah,9
    lea dx,a
    int 21h
    jmp exit
    
B1:
    mov ah,9
    lea dx,b
    int 21h
    jmp exit
    
C1:
    mov ah,9
    lea dx,c
    int 21h
    jmp exit
    
D1:
    mov ah,9
    lea dx,d
    int 21h
    jmp exit
    
E1:
    mov ah,9
    lea dx,e
    int 21h
    jmp exit
    
F1:
    mov ah,9
    lea dx,f
    int 21h
    jmp exit
    
exit:
    mov ah,4ch
    int 21h
main endp
end main
