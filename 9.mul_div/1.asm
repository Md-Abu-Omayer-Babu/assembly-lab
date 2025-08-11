.model small
.stack 100h
.data
    prompt1 db 'Enter first number: $'
    prompt2 db 0ah, 0dh, 'Enter second number: $'
    mul_msg db 0ah, 0dh, 'Multiplication result: $'
    div_msg db 0ah, 0dh, 'Division result: $'
    newline db 0ah, 0dh, '$'

    buffer  db 255, ?, 255 dup('$')
    output  db 10 dup('$')

    num1    dw ?
    num2    dw ?
    result  dw ?

.code
    main:       
                mov  ax, @data
                mov  ds, ax

                lea  dx, prompt1
                mov  ah, 09h
                int  21h

                call take_input
                call str_to_int
                mov  num1, ax

                lea  dx, prompt2
                mov  ah, 09h
                int  21h

                call take_input
                call str_to_int
                mov  num2, ax

                mov  ax, num1
                mov  bx, num2
                mul  bx
                mov  result, ax

                lea  dx, mul_msg
                mov  ah, 09h
                int  21h

                mov  ax, result
                call int_to_str
                lea  dx, output
                mov  ah, 09h
                int  21h

                mov  ax, num1
                mov  bx, num2
                xor  dx, dx
                div  bx
                mov  result, ax

                lea  dx, div_msg
                mov  ah, 09h
                int  21h

                mov  ax, result
                call int_to_str
                lea  dx, output
                mov  ah, 09h
                int  21h

                mov  ax, 4c00h
                int  21h

    take_input: 
                lea  dx, buffer
                mov  ah, 0ah
                int  21h
                lea  dx, newline
                mov  ah, 09h
                int  21h
                ret

    str_to_int: 
                mov  si, offset buffer + 2
                xor  ax, ax
                mov  cx, 10

    next_digit: 
                mov  bl, [si]
                cmp  bl, 0dh
                je   done_conv
                mul  cx
                sub  bl, '0'
                add  ax, bx
                inc  si
                jmp  next_digit

    done_conv:  
                ret

    int_to_str: 
                lea  si, output
                mov  bx, 10
                xor  cx, cx
                xor  dx, dx

                cmp  ax, 0
                jne  div_loop

                mov  [si], '0'
                mov  byte ptr [si+1], '$'
                ret

    div_loop:   
                div  bx
                add  dl, '0'
                push dx
                inc  cx
                xor  dx, dx
                cmp  ax, 0
                jne  div_loop

    reverse_out:
                pop  dx
                mov  [si], dl
                inc  si
                loop reverse_out

                mov  byte ptr [si], '$'
                ret

end main
