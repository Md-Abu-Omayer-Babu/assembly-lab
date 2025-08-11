.model small
.stack 100h
.data
    prompt1 db 'Enter character 1: $'
    prompt2 db 0Dh,0Ah,'Enter character 2: $'
    prompt3 db 0Dh,0Ah,'Enter character 3: $'
    newline db 0Dh,0Ah,'$'
.code
main proc
               mov  ax, @data
               mov  ds, ax
               lea  dx, prompt1
               mov  ah, 09h
               int  21h
               mov  ah, 01h
               int  21h
               push ax
               lea  dx, prompt2
               mov  ah, 09h
               int  21h
               mov  ah, 01h
               int  21h
               push ax
               lea  dx, prompt3
               mov  ah, 09h
               int  21h
               mov  ah, 01h
               int  21h
               push ax
               mov  cx, 3
    print_loop:
               mov  ah, 09h
               lea  dx, newline
               int  21h
               pop  ax
               mov  dl, al
               mov  ah, 02h
               int  21h
               loop print_loop
               mov  ah, 4Ch
               int  21h
main endp
end main
