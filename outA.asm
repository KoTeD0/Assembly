.model tiny
.code 
ORG 100h
start:mov AH, 02h
      mov DL,41h
      int 21h
      end start
     