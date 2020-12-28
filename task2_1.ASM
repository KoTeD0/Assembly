format PE GUI 4.0
include 'include\WIN32AX.INC'
.data
formath db "%01x",0
formatd db "%0d",0
result db 256 dup(?)

x db 2
y db 3
z db 4

.code
start:
XOR AX,AX
XOR dX,dX
MOV AL,4
MUL [x]
MUL [x]
MOV bx,ax
MOV AL,21
MUL [y]
MUL [y]
ADD ax,bx
mov bx,ax
mov AL,9
MUL [z]
MUL [z]
add ax,bx

invoke wsprintf,result,formatd,ax,dx
invoke MessageBox,0,result,"4X^2+21Y^2+9Z^2",MB_OK
invoke ExitProcess,0
.end start