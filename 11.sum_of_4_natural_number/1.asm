.model small
.stack 100h
.data
    a       db 'Enter 1st number: $'
    b       db 'Enter 2nd number: $'
    c       db 'Enter 3rd number: $'
    d       db 'Enter 4th number: $'
    str     db 0ah,0dh,'Result is: $'
    output  db 10 dup('$')
    buffer  db 255, ?, 255 dup('$')
    newline db 0ah, 0dh, '$'
    num1    dw ?
    num2    dw ?
    num3    dw ?
    num4    dw ?
    sum     dw ?
.code
main proc
               mov  ax, @data
               mov  ds, ax
               lea  dx, a
               mov  ah, 09h
               int  21h
               call take_input
               call str_int
               mov  num1, ax
               lea  dx, b
               mov  ah, 09h
               int  21h
               call take_input
               call str_int
               mov  num2, ax
               lea  dx, c
               mov  ah, 09h
               int  21h
               call take_input
               call str_int
               mov  num3, ax
               lea  dx, d
               mov  ah, 09h
               int  21h
               call take_input
               call str_int
               mov  num4, ax
               mov  ax, num1
               add  ax, num2
               add  ax, num3
               add  ax, num4
               mov  sum, ax
               mov  ax, sum
               call int_string
               lea  dx, str
               mov  ah, 09h
               int  21h
               lea  dx, output
               mov  ah, 09h
               int  21h
               mov  ax, 4c00h
               int  21h
main endp
    take_input:
               lea  dx, buffer
               mov  ah, 0ah
               int  21h
               lea  dx, newline
               mov  ah, 09h
               int  21h
               ret
    str_int:   
               mov  si, offset buffer + 2
               xor  ax, ax
               mov  cx, 10
    next:      
               mov  bl, [si]
               cmp  bl, 0dh
               je   done
               mul  cx
               sub  bl, '0'
               add  ax, bx
               inc  si
               jmp  next
    done:      
               ret
    int_string:
               lea  si, output
               mov  bx, 10
               xor  cx, cx
               xor  dx, dx
               cmp  ax, 0
               jnz  div_loop
               mov  [si], '0'
               ret
    div_loop:  
               div  bx
               add  dl, '0'
               push dx
               inc  cx
               xor  dx, dx
               cmp  ax, 0
               jnz  div_loop
    reversing: 
               pop  dx
               mov  [si], dl
               inc  si
               loop reversing
               ret
end main
