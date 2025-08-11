.model small
.stack 100h
.data
    prompt     db 'Enter a 2 or 3 digit number: $'
    largeDigit db 0
    error      db "please type digits$"
    newline    db 0Dh,0Ah,'$'
.code
main proc
                 mov ax, @data
                 mov ds, ax
                 mov ah, 09h
                 lea dx, prompt
                 int 21h
                 mov ah, 01h
                 int 21h
                 cmp al, '0'
                 jb  invalid
                 cmp al, '9'
                 ja  invalid
                 sub al, '0'
                 mov largeDigit, al
                 mov cx, 1
    read_loop:   
                 cmp cx, 3
                 je  done_reading
                 mov ah, 01h
                 int 21h
                 cmp al, 0Dh
                 je  done_reading
                 cmp al, '0'
                 jb  invalid
                 cmp al, '9'
                 ja  invalid
                 sub al, '0'
                 mov bl, largeDigit
                 cmp al, bl
                 ja  update
                 inc cx
                 jmp read_loop
    update:      
                 mov largeDigit, al
                 inc cx
                 jmp read_loop
    done_reading:
                 mov ah, 09h
                 lea dx, newline
                 int 21h
                 mov dl, largeDigit
                 add dl, '0'
                 mov ah, 02h
                 int 21h
                 mov ah, 4Ch
                 int 21h
    invalid:     
                 mov ah, 09h
                 lea dx, newline
                 int 21h
                 mov ah, 09h
                 lea dx, error
                 int 21h
                 mov ah, 4Ch
                 int 21h
main endp
end main
