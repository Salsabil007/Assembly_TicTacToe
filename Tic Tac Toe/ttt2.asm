.Model Small
.Stack 100h

.DATA
TTT DB "TIC TAC TOE$"
PLAY DB "Press 1 for New Game$"
EXIT DB "Press 2 for Exit$"
FORPRESS DB 'PRESS(1-9):$'
INPUT DB ?
PRESS DB ?
TURN DB ?
.Code
main Proc
    MOV AX,@DATA
    MOV DS,AX
; set graphics mode 4
    MOV AH,0h
    MOV AL,4h
    INT 10h
; set bgd color to cyan
    MOV AH, 0BH
    MOV BH, 00h
    MOV BL, 3
    INT 10h
; select palette 0
    MOV BH, 1
    MOV BL, 17
    INT 10h
    
;FOR TIC TAC TOE
; move cursor to page 0, row 5, col 13
        MOV AH, 02
        MOV BH, 0
        MOV DH, 5
        MOV DL, 13
        INT 10h
; write char        
       ; MOV AH, 9
       ; MOV AL, 'X
        MOV BL,2 ; color value from palette
        MOV CX, 1
        INT 10h
        
        mov dx,offset TTT
        mov ah,9
        int 21h
       
;FOR PLAY


; move cursor to page 0, row 10, col 10
        MOV AH, 02
        MOV BH, 0
        MOV DH, 10
        MOV DL, 10
        INT 10h
; write char        

        MOV BL,2 ; color value from palette
        MOV CX, 1
        INT 10h
        
        mov dx,offset PLAY
       mov ah,9
       int 21h
       
;FOR EXIT
; move cursor to page 0, row 13, col 12
        MOV AH, 02
        MOV BH, 0
        MOV DH, 13
        MOV DL, 12
        INT 10h
; write char        

        MOV BL,2 ; color value from palette
        MOV CX, 1
        INT 10h
        
        mov dx,offset EXIT
       mov ah,9
       int 21h
       
       MOV AH,2
       MOV DL,0DH
       MOV DL,0AH
       INT 21H
       
       
;INPUT

        
        MOV AH,1
        INT 21H
        MOV INPUT,AL
        CMP AL,'2'
        JE EXITGAME
        CMP AL,'1'
        JE NEWGAME

        
        
        EXITGAME:
        mov ax,0003h ;CLEAR SCREEN
        int 10h      ;CLEAR SCREEN
        MOV AH,4CH
        INT 21H
        
NEWGAME:

    MOV AX,0003H    ;CLEAR SCREEN MODE
    ;INT 10H
;background colour
    ;MOV AH, 0h    
    MOV AL, 4     
    ;MOV AH,0BH
    MOV BH,00H
    MOV BL,30
    INT 10H  

; draw line pixel by pixel
    MOV AH, 0CH
    MOV AL, 1
    MOV BH,30h
    INT 10h
    
    ;ROW1
    MOV CX, 70 ; beginning col
    MOV DX, 40 ; beginning row
    
    L1: 
    INT 10h
        INC CX
        CMP CX, 250
        JLE L1
   
   ;ROW2     
   MOV CX,70
   MOV DX,80
   L2:
        INT 10h
        INC CX
        CMP CX, 250
        JLE L2
   
   ;ROW3     
   MOV CX,70
   MOV DX,120
   L3:
        INT 10h
        INC CX
        CMP CX, 250
        JLE L3
        
   ;ROW4     
   MOV CX,70
   MOV DX,160
   L4:
        INT 10h
        INC CX
        CMP CX, 250
        JLE L4
        
   ;COLUMN1
    MOV CX,70
    MOV DX,40
        
        C1:
        INT 10h
        INC DX
        CMP DX,160
        JNE C1
        
    ;COLUMN2
     MOV CX,130
     MOV DX,40
        
        C2:
        INT 10h
        INC DX
        CMP DX,160
        JNE C2
        
    ;COLUMN3
     MOV CX,190
     MOV DX,40
        
        C3:
        INT 10h
        INC DX
        CMP DX,160
        JNE C3
        
     ;COLUMN4
     MOV CX,250
     MOV DX,40
        
        C4:
        INT 10h
        INC DX
        CMP DX,160
        JNE C4
        
        ;AFTER DRAWING THE GRID 
        ;TAKE INPUT
        mov dx,offset FORPRESS
        mov ah,9
        int 21h
        
        MOV AH,1
        INT 21H
        MOV PRESS,AL
        
        CMP AL,'1'
        JE ROOM1
        JMP CMP2
        
        ROOM1:
; move cursor to page 0, row 12, col 19
        MOV AH, 02
        MOV BH, 0
        MOV DH, 7
        MOV DL, 12
        INT 10h
; write char        
        MOV AH, 9
        MOV AL, 'X'
        MOV BL, 2 ; color value from palette
        MOV CX, 1
        INT 10h
        
        CMP2:
        CMP AL,'2'
        JE ROOM2
        JMP CMP3
        
        ROOM2:
; move cursor to page 0, row 12, col 19
        MOV AH, 02
        MOV BH, 0
        MOV DH, 7
        MOV DL, 20
        INT 10h
; write char        
        MOV AH, 9
        MOV AL, 'X'
        MOV BL, 2 ; color value from palette
        MOV CX, 1
        INT 10h
        
        CMP3:
        CMP AL,'3'
        JE ROOM3  
        JMP CMP4
        
        ROOM3:
; move cursor to page 0, row 12, col 19
        MOV AH, 02
        MOV BH, 0
        MOV DH, 7
        MOV DL, 27
        INT 10h
; write char        
        MOV AH, 9
        MOV AL, 'X'
        MOV BL, 2 ; color value from palette
        MOV CX, 1
        INT 10h
        
        CMP4:
        CMP AL,'4'
        JE ROOM4
        JMP CMP5
        
        ROOM4:
; move cursor to page 0, row 12, col 19
        MOV AH, 02
        MOV BH, 0
        MOV DH, 12
        MOV DL, 12
        INT 10h
; write char        
        MOV AH, 9
        MOV AL, 'X'
        MOV BL, 2 ; color value from palette
        MOV CX, 1
        INT 10h        
        
        CMP5:
        CMP AL,'5'
        JE ROOM5
        JMP CMP6
        
        ROOM5:
; move cursor to page 0, row 12, col 19
        MOV AH, 02
        MOV BH, 0
        MOV DH, 12
        MOV DL, 20
        INT 10h
; write char        
        MOV AH, 9
        MOV AL, 'X'
        MOV BL, 2 ; color value from palette
        MOV CX, 1
        INT 10h
        
        CMP6:
        CMP AL,'6'
        JE ROOM6
        JMP CMP7
        
        ROOM6:
; move cursor to page 0, row 12, col 19
        MOV AH, 02
        MOV BH, 0
        MOV DH, 12
        MOV DL, 27
        INT 10h
; write char        
        MOV AH, 9
        MOV AL, 'X'
        MOV BL, 2 ; color value from palette
        MOV CX, 1
        INT 10h

        CMP7:
        CMP AL,'7'
        JE ROOM7
        JMP CMP8
        
        ROOM7:
; move cursor to page 0, row 12, col 19
        MOV AH, 02
        MOV BH, 0
        MOV DH, 17
        MOV DL, 12
        INT 10h
; write char        
        MOV AH, 9
        MOV AL, 'X'
        MOV BL, 2 ; color value from palette
        MOV CX, 1
        INT 10h
        
        CMP8:
        CMP AL,'8'
        JE ROOM8
        JMP CMP9
        
        ROOM8:
; move cursor to page 0, row 12, col 19
        MOV AH, 02
        MOV BH, 0
        MOV DH, 17
        MOV DL, 20
        INT 10h
; write char        
        MOV AH, 9
        MOV AL, 'X'
        MOV BL, 2 ; color value from palette
        MOV CX, 1
        INT 10h
        
        CMP9:
        CMP AL,'9'
        JE ROOM9  
        JMP YO
        
        ROOM9:
; move cursor to page 0, row 12, col 19
        MOV AH, 02
        MOV BH, 0
        MOV DH, 17
        MOV DL, 27
        INT 10h
; write char        
        MOV AH, 9
        MOV AL, 'X'
        MOV BL, 2 ; color value from palette
        MOV CX, 1
        INT 10h

        
        YO:
        ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        ;print mouse
        
        
        MOV AH, 0
        INT 16h
        MOV AX, 3
        INT 10h
    
; getch     
        MOV AH, 0
        INT 16h
; return to text mode
        MOV AX, 3
        INT 10h
        
; return to dos
        MOV AH, 4CH
        INT 21h
main EndP
     End main

