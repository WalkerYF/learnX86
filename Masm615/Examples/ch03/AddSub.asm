TITLE Add and Subtract              (AddSub.asm)

; This program adds and subtracts 32-bit integers.
; Last update: 2/1/02

INCLUDE Irvine32.inc

.code
main PROC

	mov eax,30000h		; EAX = 10000h
	add eax,80000h		; EAX = 50000h
	sub eax,20000h		; EAX = 30000h
	call DumpRegs

	exit
main ENDP
END main