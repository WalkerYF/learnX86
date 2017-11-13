TITLE Integer Summation Program		      (Sum2.asm)

; Programmer:	John A. Doe
; Date:         MOnth/Day/Year
; Description:
;This program accepts 4 numbers.
;for this project, we will assume that
;these are the last four digits of a
;student ID number

INCLUDE Irvine32.inc

IntegerCount = 4			; array size

.data
display1 BYTE  "Enter one number of your student ID and press enter : ",0
display2 BYTE  "The sum of the four last digits of your ID is : ",0
array   BYTE  IntegerCount DUP(?)

.code
main PROC
	call Clrscr
	mov  esi,OFFSET array
	mov  ecx,IntegerCount
	call PromptForIntegers
	call ArraySum
	call DisplaySum
	exit
main ENDP

;-----------------------------------------------------
PromptForIntegers PROC
;
;fills the array with the user input
;four numbers representing the last four
;digits of a student's ID number
;Returns:  nothing
;-----------------------------------------------------
	pushad		; save all registers

	mov  edx,OFFSET display1		; address of the prompt
	cmp  ecx,0		; array size <= 0?
	jle  L2		; yes: quit

L1:
	call WriteString		; display string
	call ReadInt		; read integer into EAX
	call Crlf		; go to next output line
	mov  [esi],eax		; store in array
	add  esi,4		; next integer
	loop L1

L2:
	popad		; restore all registers
	ret
PromptForIntegers ENDP

;-----------------------------------------------------
ArraySum PROC
;
; Calculates the sum of an array of 32-bit integers.
; Receives: ESI points to the array, ECX = array size
; Returns:  EAX = sum of the array elements
;-----------------------------------------------------
	push  esi		; save ESI, ECX
	push  ecx
	mov   eax,0		; set the sum to zero

L1:
	add   eax,[esi]		; add each integer to sum
	add   esi,4		; point to next integer
	loop  L1		; repeat for array size

L2:
	pop   ecx		; restore ECX, ESI
	pop   esi
	ret		; sum is in EAX
ArraySum ENDP

;-----------------------------------------------------
DisplaySum PROC
;
; Displays the sum on the screen
; Recevies: EAX = the sum
; Returns:  nothing
;-----------------------------------------------------
	push edx
	mov  edx,OFFSET display2		; display message
	call WriteString
	call WriteInt		; display EAX
	call Crlf
	pop  edx
	ret
DisplaySum ENDP
END main
