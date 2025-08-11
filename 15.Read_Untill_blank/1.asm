.model small
.stack 100h
.code
main proc
    READ:
         mov  ah, 1h
         int  21h
         cmp  al, ' '
         je   EXIT
         loop READ
    EXIT:
         mov  ah, 4Ch
         int  21h
main endp
end main
