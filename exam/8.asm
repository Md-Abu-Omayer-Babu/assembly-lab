.model small
.stack 100h
.data
msgEven db 'Number is EVEN.$'
msgOdd  db 'Number is ODD.$'
.code
main proc
    mov ax, @data
    mov ds, ax

    mov al, 109       ; decimal 14 (0Eh hex)

    test al, 1       ; check least significant bit
    jz print_even

    ; Odd number
    lea dx, msgOdd
    mov ah, 09h
    int 21h
    jmp done

print_even:
    lea dx, msgEven
    mov ah, 09h
    int 21h

done:
    mov ah, 4Ch
    int 21h
main endp
end main
