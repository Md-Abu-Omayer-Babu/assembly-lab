.model small
.stack 100h
.data      
prompt      db 'Enter a number: $'
even_msg    db 0ah, 0dh, 'Result is: Even$'
odd_msg     db 0ah, 0dh, 'Result is: Odd$'
buffer      db 255, ?, 255 dup('$')
newline     db 0ah, 0dh, '$'
num         dw ?

.code
main:
    mov ax, @data
    mov ds, ax
    lea dx, prompt
    mov ah, 09h
    int 21h
    call take_input
    call str_to_int
    mov num, ax
    test ax, 1
    jz even_case
odd_case:
    lea dx, odd_msg
    jmp print_result

even_case:
    lea dx, even_msg
print_result:
    mov ah, 09h
    int 21h
    mov ax, 4c00h
    int 21h

take_input:
    lea dx, buffer
    mov ah, 0ah
    int 21h
    lea dx, newline
    mov ah, 09h
    int 21h
    ret

str_to_int:
    mov si, offset buffer + 2
    xor ax, ax
    mov cx, 10
next_digit:
    mov bl, [si]
    cmp bl, 0dh
    je done_conv
    mul cx
    sub bl, '0'
    add ax, bx
    inc si
    jmp next_digit

done_conv:
    ret

end main
