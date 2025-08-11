.model small
.stack 100h
.code
main proc
         mov  cx, 80
    Star:
         mov  ah, 02h
         mov  dl, 42
         int  21h
         loop Star
         mov  ah, 4Ch
         int  21h
main endp
end main
