.model small

.stack 100h

.data
    String db 'Sasha', 19, 11, '$' 
    Length = 5
    Color db 6e
    
.code
start:
    mov ax, @data
    mov ds, ax
    mov ah, 02h
    add ah, 19
    mov bh, 0
    mov dh, 19
    mov dl, 11
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