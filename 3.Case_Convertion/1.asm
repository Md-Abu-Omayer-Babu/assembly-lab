.model small
.stack 100h
.data
    prompt  db "Enter a Character : $"
    newline db 0ah, 0dh, "result : $"

.code
main proc
              mov ax, @data
              mov ds, ax
              mov ah, 09h
              lea dx, prompt
              int 21h
              mov ah, 01h
              int 21h
              cmp al, 'A'
              jl  NOT_UPPER
              cmp al, 'Z'
              jg  NOT_UPPER
              add al, 20h
              jmp DISPLAY
    NOT_UPPER:
              cmp al, 'a'
              jl  DISPLAY
              cmp al, 'z'
              jg  DISPLAY
              sub al, 20h
    DISPLAY:  
              mov ah, 02h
              mov dl, al
              int 21h
              mov ah, 4Ch
              int 21h
main endp
end main