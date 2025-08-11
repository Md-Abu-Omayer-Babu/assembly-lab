.model small
.stack 100h

.data
msgPrompt db 'Enter marks: $'
msgAplus  db 0ah, 0dh, 'Grade: A+$'
msgA      db 0ah, 0dh, 'Grade: A$'
msgB      db 0ah, 0dh, 'Grade: B$'
msgC      db 0ah, 0dh, 'Grade: C$'

inBuffer  db 4
           db 0
           db 4 dup('$')

marks     db ?       

.code
main:
    mov ax, @data
    mov ds, ax

    lea dx, msgPrompt
    mov ah, 09h
    int 21h

    lea dx, inBuffer
    mov ah, 0Ah
    int 21h

    mov si, offset inBuffer + 2
    xor ax, ax
    mov cx, 10

nextDigit:
    mov bl, [si]
    cmp bl, 0Dh
    je storeMarks
    sub bl, '0'
    mul cx
    add al, bl
    inc si
    jmp nextDigit

storeMarks:
    mov marks, al

    mov al, marks
    cmp al, 80
    jae ap
    cmp al, 70
    jae a
    cmp al, 60
    jae b
    jmp c

ap:
    lea dx, msgAplus
    jmp print
a:
    lea dx, msgA
    jmp print
b:
    lea dx, msgB
    jmp print
c:
    lea dx, msgC

print:
    mov ah, 09h
    int 21h

    mov ah, 4Ch
    int 21h
end main
