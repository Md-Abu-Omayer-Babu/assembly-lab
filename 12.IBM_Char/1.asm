.model small
.stack 100h
.code
main proc
               mov  cx, 256
               mov  bl, 0
    print_loop:
               mov  ah, 02h
               mov  dl, bl
               int  21h
               inc  bl
               loop print_loop
               mov  ah, 4Ch
               int  21h
main endp
end main
