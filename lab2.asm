.model small

.stack 100h

.data
    String db 'Rejep Bovvlet', 13, 46, '$' 
    Length = 13
    Color db 09
    
.code
start:
    mov ax, @data
    mov ds, ax
    mov ah, 02h
    add ah, 5
    mov bh, 0
    mov dh, 5
    mov dl, 46
    int 10h
    mov ax, ds
    mov es, ax
    lea bp, [String]
    xor cx, cx
    mov cl, [Length]
    mov bl, [Color]
    mov ax, 1300h
    int 10h
end start