.model small
.stack 100h
.data
msg db 'Fibonacci: $'
.code
main:
    mov ax, @data
    mov ds, ax
    lea dx, msg
    mov ah, 09h
    int 21h
    mov ax, 0
    mov bx, 1
    mov cx, 15
print_fib:
    push ax
    call PrintNum
    mov dl, ' '
    mov ah, 02h
    int 21h
    pop ax
    mov dx, ax
    add ax, bx
    mov bx, dx
    loop print_fib
    mov ah, 4ch
    int 21h
PrintNum proc
    push ax
    push bx
    push cx
    push dx
    xor cx, cx
    mov bx, 10
print_loop:
    xor dx, dx
    div bx
    push dx
    inc cx
    test ax, ax
    jnz print_loop
print_digits:
    pop dx
    add dl, '0'
    mov ah, 02h
    int 21h
    loop print_digits
    pop dx
    pop cx
    pop bx
    pop ax
    ret
PrintNum endp
