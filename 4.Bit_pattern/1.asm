.model small
.stack 100h
.data
input_byte db 10011101B
reverse_byte db ?
newline db 0Dh,0Ah,'$'
.code
main proc
    mov ax, @data
    mov ds, ax
    mov al, input_byte
    mov bl, 0
    mov cx, 8
reverse_loop:
    shl al, 1
    rcr bl, 1
    loop reverse_loop
    mov reverse_byte, bl
    lea dx, newline
    mov ah, 09h
    int 21h
    mov al, reverse_byte
    call PrintByteBinary
    mov ah, 4Ch
    int 21h
main endp
PrintByteBinary proc
    push ax
    mov bl, al
    mov cx, 8
print_bit_loop:
    mov ah, 02h
    test bl, 10000000b
    jz print_zero
    mov dl, '1'
    jmp print_char
print_zero:
    mov dl, '0'
print_char:
    int 21h
    shl bl, 1
    loop print_bit_loop
    pop ax
    ret
PrintByteBinary endp
end main
