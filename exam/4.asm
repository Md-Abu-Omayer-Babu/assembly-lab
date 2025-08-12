.model small
.stack 100h
.data
    num db 10110010b    
    rev db 0            
.code
main:
    mov ax, @data
    mov ds, ax

    mov al, num         
    mov cl, 8           
    mov bl, 0           

reverse_loop:
    rcr al, 1           ; Shift AL right, bit goes into CF
    rcl bl, 1           ; Shift BL left, CF bit goes into BL
    dec cl
    jnz reverse_loop

    mov rev, bl         

    mov ah, 4Ch
    int 21h
end main