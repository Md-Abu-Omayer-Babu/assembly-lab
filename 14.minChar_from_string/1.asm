.model small
.stack 100h
.data
    minChar db 0
    prompt  db 'Enter string: $'
    newline  db 0Dh, 0Ah, '$'
.code
main proc
                   mov ax, @data
                   mov ds, ax
                   mov ah, 09h
                   lea dx, prompt
                   int 21h
                   mov ah, 01h
                   int 21h
                   mov minChar, al
    read_loop:     
                   cmp al, 0Dh
                   je  done_reading
                   mov bl, minChar
                   cmp al, bl
                   jb  update_min
                   jmp read_next_char
    update_min:    
                   mov minChar, al
    read_next_char:
                   mov ah, 01h
                   int 21h
                   jmp read_loop
    done_reading:  
                   mov ah, 09h
                   lea dx, newline
                   int 21h
                   mov ah, 02h
                   mov dl, minChar
                   int 21h
                   mov ah, 4Ch
                   int 21h
main endp
end main
