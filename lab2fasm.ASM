format PE GUI 4.0
include  'include\WIN32AX.INC'

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

invoke wsprintf,result,formatd,bx,dx
invoke MessageBox,0,result,"3*x+x*z-17*y*z+30=",MB_OK

invoke ExitProcess,0
.end start