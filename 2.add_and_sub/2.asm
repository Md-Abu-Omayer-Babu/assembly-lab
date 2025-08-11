.MODEL SMALL
.STACK 100H

.DATA
    prompt1   DB 'Enter first number (up to 3 digits): $'
    prompt2   DB 13,10,'Enter second number (up to 3 digits): $'
    sum_msg   DB 13,10,'Result of Addition: $'
    diff_msg  DB 13,10,'Result of Difference: $'

    num1      DW 0
    num2      DW 0
    result    DW 0

    inBuffer1 DB 4,0,4 DUP('$')
    inBuffer2 DB 4,0,4 DUP('$')

.CODE
MAIN PROC
                MOV  AX, @DATA
                MOV  DS, AX

                LEA  DX, prompt1
                MOV  AH, 09H
                INT  21H

                LEA  DX, inBuffer1
                MOV  AH, 0AH
                INT  21H
                CALL StrToNum
                MOV  num1, AX

                LEA  DX, prompt2
                MOV  AH, 09H
                INT  21H

                LEA  DX, inBuffer2
                MOV  AH, 0AH
                INT  21H
                CALL StrToNum
                MOV  num2, AX

                MOV  AX, num1
                ADD  AX, num2
                MOV  result, AX

                LEA  DX, sum_msg
                MOV  AH, 09H
                INT  21H
                CALL PrintNum

                MOV  AX, num1
                SUB  AX, num2
                MOV  result, AX

                TEST AX, AX
                JNS  PrintDiff

                NEG  AX
                MOV  result, AX
                MOV  AH, 02H
                MOV  DL, '-'
                INT  21H

    PrintDiff:  
                LEA  DX, diff_msg
                MOV  AH, 09H
                INT  21H
                CALL PrintNum

                MOV  AH, 4CH
                INT  21H
MAIN ENDP

StrToNum PROC
                PUSH BX
                PUSH CX
                PUSH DX
                PUSH SI

                MOV  SI, DX
                ADD  SI, 2
                XOR  AX, AX
                MOV  CX, 10

    NextDigit:  
                MOV  BL, [SI]
                CMP  BL, 0DH
                JE   ConvDone

                SUB  BL, '0'
                MUL  CX
                ADD  AL, BL
                INC  SI
                JMP  NextDigit

    ConvDone:   
                POP  SI
                POP  DX
                POP  CX
                POP  BX
                RET
StrToNum ENDP

PrintNum PROC
                PUSH AX
                PUSH BX
                PUSH CX
                PUSH DX

                MOV  AX, result
                XOR  CX, CX
                MOV  BX, 10

    ConvertLoop:
                XOR  DX, DX
                DIV  BX
                ADD  DL, '0'
                PUSH DX
                INC  CX
                TEST AX, AX
                JNZ  ConvertLoop

                CMP  CX, 3
                JGE  PrintLoop

    PadLoop:    
                PUSH '0'
                INC  CX
                CMP  CX, 3
                JL   PadLoop

    PrintLoop:  
                POP  DX
                MOV  AH, 02H
                INT  21H
                LOOP PrintLoop

                POP  DX
                POP  CX
                POP  BX
                POP  AX
                RET
PrintNum ENDP

END MAIN
