
.ORIG x3000


;PRINTS STARTING MSG
startmsg    .STRINGZ "\nSTARTING PRIVACY MODULE\n"
LEA     R0  startmsg
PUTS
START
    ;CLAERS ALL REGISTERS
    AND R0  R0  #0
    AND R1  R1  #0
    AND R2  R2  #0
    AND R3  R3  #0
    AND R4  R4  #0
    AND R5  R5  #0
    AND R6  R6  #0
    AND R7  R7  #0
    ;start of program. print out 
    LEA     R0  query       ;prints choices
    PUTS
    GETC
;fills for char
eUp     .FILL   x45
eLow    .FILL   x65
dUp     .FILL   x44
dLow    .FILL   x64
xUp     .FILL   x58
xLow    .FILL   x78

CHECKeUp
    LD  R4  eUp             ;saves e for later
    LD  R6  eUp             ;LOADS ASCII FOR E
    NOT R1  R6              ;GETS COMPLIMENT
    ADD R1  R1  #1  
    ADD R6  R0  R1          ;ADDS THEM TOGETHER
    BRnp    CHECKeLow       ;IF NOT ZERO GO TO CHECKeLow
    ;TODO IF E

    JSR ENTERKEY

    

CHECKeLow
    LD  R6  eLow            ;LOADS ASCII FOR LOW E
    NOT R1  R6              ;COMLIMENTS
    ADD R1  R1  #1
    ADD R6  R0  R1          ;ADDS IMPUT AND COMLIMENT
    BRnp    CHECKdUp;       ;IF NOT ZERO GO TO CHECKeLow
    ;TODO IF E

    JSR ENTERKEY
           

CHECKdUp
    LD  R4  dUp             ;saves d for later
    LD  R6  dUp             ;LOADS ASCII FOR D
    NOT R1  R6              ;GETS COMPLIMENT
    ADD R1  R1  #1  
    ADD R6  R0  R1          ;ADDS THEM TOGETHER
    BRnp    CHECKdLow       ;IF NOT ZERO or positive GO TO CHECKdLow
    ;TODO IF D

    JSR ENTERKEY


CHECKdLow
    LD  R6  dLow             ;LOADS ASCII FOR D
    NOT R1  R6              ;GETS COMPLIMENT
    ADD R1  R1  #1  
    ADD R6  R0  R1          ;ADDS THEM TOGETHER
    BRnp    CHECKxUp        ;IF NOT ZERO or positive GO TO CHECKxUp
    ;TODO IF D
    JSR ENTERKEY

CHECKxUp
    LD  R6  xUp             ;LOADS ASCII FOR X
    NOT R1  R6              ;GETS COMPLIMENT
    ADD R1  R1  #1  
    ADD R6  R0  R1          ;ADDS THEM TOGETHER
    BRnp    CHECKxLow       ;IF NOT ZERO or positive GO TO CHECKxLow
    ;TODO IF X
    JSR DELETE              ;jumps to delete to delete messgae and halt


CHECKxLow
    LD  R6  xLow            ;LOADS ASCII FOR X
    NOT R1  R6              ;GETS COMPLIMENT
    ADD R1  R1  #1  
    ADD R6  R0  R1          ;ADDS THEM TOGETHER
    BRnp    NOTSTART        ;IF ZERO INVALID INPUT
    ;TODO IF X
    JSR DELETE
query       .STRINGZ "\nENTER E OR D OR X\n"    
invalid     .STRINGZ "\nINVALID INPUT\n"

NOTSTART                    ;PRINTS INVALID AND BACK TO START
    LEA R0  invalid
    PUTS
    BRnzp   START           ;goes back to start
HALT

NOTKEY
    ;clears
    AND R0  R0  #0
    AND R1  R1  #0
    AND R2  R2  #0
    AND R3  R3  #0
    AND R4  R4  #0
    AND R5  R5  #0
    AND R6  R6  #0

    LEA R0  invalid
    PUTS
    BRnzp   ENTERKEY        ;goes back to asing to enter key

ENTERKEY

    LEA R0  keymsg          ;ENTER KEY
    AND R5  R5  #0          ;SETS OFFSET TO 0
    PUTS
    LD  R6  ARR             ;LOADS ARR
    ADD R6  R6  #0          ;ADDS THE OFFSET TO GET ARR[0]
    GETC
    STR R0  R6  #0          ;STORES IN R6(ARR[0])
    JSR ENTERKEY2             ;X LESS THAN 8

CHECKX

    
    LD  R6  ARR             ;LOAD ARRAY
    ADD R6  R6  #0          ;ADDRESS 0
    LDR R1  R6  #0          ;GETVALUE AT THE ADDRESS
    LD  R2  zero
    LD  R3  seven
    ADD R2  R1  R2        ;CHECKS IF NUMBER IS GREATER THAN ZERO
    BRn NOTKEY
    ADD R3  R1  R3        ;CHECKS IF NUMBER IS LESS THAN EIGHT
    BRp NOTKEY
    ADD R5  R5  #1          ;ITERATES OFFSET
    JSR CHECKY
    
ENTERKEY2
    LD  R6  ARR             ;LOADS ARR
    ADD R6  R6  #1          ;ADDS THE OFFSET TO GET ARR[1]
    GETC
    STR R0  R6  #0
    JSR ENTERKEY3
    
CHECKY
    
    LD  R6  ARR             ;LOAD ARRAY
    ADD R6  R6  #1          ;ADDRESS 0
    LDR R1  R6  #0          ;GETVALUE AT THE ADDRESS
    LD  R2  zero
    LD  R3  nine
    ADD R2  R1  R2        ;CHECKS IF NUMBER IS GREATER THAN ZERO
    BRnz CHECKZ1             ;if negative or 0 that means its good
    ADD R3  R1  R3        ;CHECKS IF NUMBER IS LESS THAN EIGHT
    BRp CHECKZ1           ;if positive then good
    JSR NOTKEY

ENTERKEY3
    LD  R6  ARR
    ADD R6  R6  #2
    GETC
    STR R0  R6  #0
    JSR ENTERKEY4

CHECKZ1

    
    LD  R6  ARR             ;LOAD ARRAY
    ADD R6  R6  #2          ;ADDRESS 0
    LDR R1  R6  #0
    LD  R2  zero
    LD  R3  one
    ADD R2  R1  R2
    BRz CHECKZ20            ;less than 0
    ADD R3  R1  R3
    BRz CHECKZ21             ;greater than 1
    JSR NOTKEY
    
ENTERKEY4
    LD  R6  ARR
    ADD R6  R6  #3
    GETC
    STR R0  R6  #0
    JSR ENTERKEY5
    
CHECKZ20
    
    LD  R6  ARR             ;LOAD ARRAY
    ADD R6  R6  #3          ;ADDRESS 0
    LDR R1  R6  #0          ;GETVALUE AT THE ADDRESS
    LD  R2  zero
    LD  R3  nine
    ADD R2  R1  R2        ;CHECKS IF NUMBER IS GREATER THAN ZERO
    BRn NOTKEY
    ADD R3  R1  R3        ;CHECKS IF NUMBER IS LESS THAN EIGHT
    BRp NOTKEY
    ADD R5  R5  #1          ;ITERATES OFFSET
    JSR CHECKZ30    


CHECKZ21
    
    LD  R6  ARR             ;LOAD ARRAY
    ADD R6  R6  #3          ;ADDRESS 0
    LDR R1  R6  #0 
    LD  R2  zero
    LD  R3  two
    ADD R2  R1  R2
    BRn NOTKEY              ;when zero
    ADD R3  R1  R3
    BRp NOTKEY
    JSR CHECKZ31

ENTERKEY5
    LD  R6  ARR
    ADD R6  R6  #4
    GETC
    STR R0  R6  #0
    JSR CHECKX

CHECKZ30
    
    LD  R6  ARR             ;LOAD ARRAY
    ADD R6  R6  #4          ;ADDRESS 0
    LDR R1  R6  #0          ;GETVALUE AT THE ADDRESS
    LD  R2  zero
    LD  R3  nine
    ADD R2  R1  R2        ;CHECKS IF NUMBER IS GREATER THAN ZERO
    BRn NOTKEY
    ADD R3  R1  R3        ;CHECKS IF NUMBER IS LESS THAN EIGHT
    BRp NOTKEY
    JSR EorD

CHECKZ31
    
    LD  R6  ARR             ;LOAD ARRAY
    ADD R6  R6  #4          ;ADDRESS 0
    LDR R1  R6  #0
    LD  R2  zero
    LD  R3  seven
    ADD R2  R1  R2
    BRn NOTKEY              ;when zero
    ADD R3  R1  R3
    BRp NOTKEY
    JSR EorD

nothing     .FILL   #0
minusten    .FILL   #-10
DELETE
    LD  R1  nothing         ;counter
    LD  R2  minusten        ;also counter so once we hit 10 we stop
    LD  R0  MESSAGE
    JSR DELOOP
DELOOP                      ;this deletes message
    ADD R4  R0  R1
    LDR R3  R4  #0
    AND R5  R5  #0
    STR R5  R4  #0
    ADD R1  R1  #1
    ADD R2  R2  #1
    BRz ENDDELETE
    JSR DELOOP
    
DELETEKEY                   ;this deletes the contents where we store the key
    LD  R1  nothing
    LD  R2  minusten
    LD  R0  ARR
    JSR KEYLOOP
    
KEYLOOP
    ADD R4  R0  R1
    LDR R3  R4  #0
    AND R5  R5  #0
    STR R5  R4  #0
    ADD R1  R1  #1
    ADD R2  R2  #1
    BRz ENDDELETE
    JSR KEYLOOP
    
ENDDELETE
    HALT
    
EorD                    ;to see if we chose E or D
    LD  R1  NOTE
    ADD R4  R4  R1        ;0 IF E
    BRz isENCRYPT
    LD  R2  NOTD    
    ADD R4  R4  R1        ;0 IF D
    JSR isDECRYPT
    
isENCRYPT
    ;clear
    AND R0  R0  #0
    AND R1  R1  #0
    AND R2  R2  #0
    AND R3  R3  #0
    AND R4  R4  #0
    AND R5  R5  #0
    
    LEA R0  promptmsg           ;loads msg
    PUTS
    LD  R4  MESSAGE
    LD  R5  stringcount             ;string counter
    STR R4  R0  #0
    JSR getStr
    LD  R5  VEcount              ;?????
    LD  R4  MESSAGE             ;loads message address
    JSR    VE                   ;jumpt to VE which just loads the message
    
    
;todoooo
isDECRYPT
    HALT


getStr
    ADD R5  R5  #1  ;ADDS 1
    BRz doneS
    GETC
    STR R0  R4  #0
    ADD R4  R4  #1
    JSR getStr
    
VE  
    LD  R4  MESSAGE
    JSR VELOOP
VELOOP
    BRz doneS       ;encypt is done when 0
    LDR R0  R4  #0  ;loads msg
    LD  R3  ARR
    LDR R1  R3  #1
    STI R4  nowStringCount       ;????
    STI R5  scounter
    ;clearing 
    AND R0  R0  #0
    AND R1  R1  #0
    AND R2  R2  #0
    AND R3  R3  #0
    AND R4  R4  #0
    AND R5  R5  #0
    AND R6  R6  #0
    ;!(!A AND B) AND !(!B AND A)
    NOT R2  R0;
    NOT R4  R1;
    AND R5  R2  R1
    NOT R5  R5
    AND R6  R4  R0
    NOT R6  R6
    AND R3  R5  R6
    NOT R3  R3
    
    LDI R5  nowStringCount
    LDI R4  scounter
    STR R2  R4  #0
    ADD R4  R4  #1
    ADD R5  R5  #1
    JSR VELOOP

VEcount          .FILL   #-10
stringcount     .FILL   #-11 
nowStringCount   .FILL   x3900
scounter        .FILL   x3901
    
doneS
    JSR START
;OFFSET  .FILL   #0
COUNTER .FILL   #5
ARR     .FILL   x5500
MESSAGE .FILL   x4000

NOTE    .FILL   x-45
NOTD    .FILL   x-44
two     .FILL   x-32
one     .FILL   x-31
nine    .FILL   x-39
seven   .FILL   x-37
zero    .FILL   x-30



keymsg      .STRINGZ "\nENTER KEY\n"
promptmsg   .STRINGZ "\nENTER MESSAGE\n"




.end
