format PE GUI 4.0
include 'include\WIN32AX.INC'

.data
formath db "%01x",0
formatd db "%0d",0

result db 256 dup(?)

;3*x + x*z - 17*y*z + 30 
;x=3, y=9, z=27

x db 3
y db 9
z db 27

.code
start:
xor AX, AX
xor dX, dX

MOV AL,3
MUL [x]
mov bx,ax

MOV AL,[x]
MUL [z]
add bx,ax

MOV AL,17
MUL [y]
MUL [z]
sub bx,ax

add bx,30
cmp BX,0
jg PLUSS
CMP BX,0
jl MINS
PLUSS:

     invoke wsprintf,result, "%0d",bx,dx
     JMP PRINTNUM

MINS :
     CMP BX,-256
     JLE HIGHBYTE
     CMP BX,-256
     JG LOWBYTE

LOWBYTE:
     MOV AL,255
     SUB AL,BL
     XOR AH,AH
     INC AL
     invoke wsprintf,result, "-%0d",AX,dx
     JMP PRINTNUM

HIGHBYTE:
     MOV AX,65535
     SUB AX,BX
     INC AX
     invoke wsprintf,result, "-%0d",AX,dx
     JMP PRINTNUM

PRINTNUM:
     invoke MessageBox,0,result,"ANSWER:",MB_OK ;Auaia
     invoke ExitProcess,0
.end start