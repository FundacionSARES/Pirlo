;Inventory Program in assemby lenguage

; Declare variables
PRODUCT_NAME  DB "Product A",0
PRODUCT_QUANTITY  DW 10

; Main program
MAIN:
    MOV AX, @DATA
    MOV DS, AX

    ; Display product name and quantity
    MOV AH, 09H
    LEA DX, PRODUCT_NAME
    INT 21H

    MOV AH, 02H
    MOV DL, ' '
    INT 21H

    MOV AX, PRODUCT_QUANTITY
    CALL DISPLAY_NUM

    ; Exit program
    MOV AH, 4CH
    INT 21H

; Subroutine to display a number
DISPLAY_NUM PROC
    PUSH AX
    PUSH BX
    PUSH CX
    PUSH DX

    XOR CX, CX
    MOV BX, 10

    ; Divide the number by 10 and push the remainder onto the stack
    DIV BX
    PUSH DX

    ; Repeat until the quotient is 0
    WHILE_NOT_ZERO:
        XOR DX, DX
        POP AX
        ADD AL, '0'
        MOV DL, AL
        MOV AH, 02H
        INT 21H

        ; Pop the next remainder from the stack
        POP DX

        ; Check if the stack is empty
        CMP DX, 0
        JNZ WHILE_NOT_ZERO

    POP DX
    POP CX
    POP BX
    POP AX

    RET
DISPLAY_NUM ENDP
