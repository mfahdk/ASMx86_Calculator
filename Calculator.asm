section .text
	global _start
	extern printf
	extern scanf

_start:
	; Initialize counter to 0
	mov dword[counter],0

loop:
	
	; Display opening message
	push OpenMsg
	call printf
	add esp, 4

	; Prompt user to enter the first number
	push FirstMsg
	call printf
	add esp, 4

	; Read input1
	push input1
	push fmt
	call scanf
	add esp, 8

	; Check if scanf returns 0, indicating input error
	cmp eax, 0
	je int_error

	; Check if input1 equals -666, indicating program exit
	cmp dword[input1],-666
	je exit

	; Prompt user to enter the second number
	push FirstMsg
	call printf
	add esp, 4

	; Read input2
	push input2
	push fmt
	call scanf
	add esp, 8

	; Check if scanf returns 0, indicating input error
	cmp eax, 0
	je int_error

	; Check if input2 equals -666, indicating program exit
	cmp dword[input2],-666
	je exit

	; Prompt user to enter the operation choice
	push operationMsg
	call printf
	add esp, 4

	; Prompt user to enter the operation choice
	push FirstMsg
	call printf
	add esp, 4

	; Read input3
	push input3
	push fmt
	call scanf
	add esp,8

	; Perform corresponding operation based on user choice
	cmp dword[input3],1
	je addition
	cmp dword[input3],2
	je subtraction
	cmp dword[input3],3
	je multiplication
	cmp dword[input3],4
	je division
	jne input_error
addition:
	; Increment counter
	inc dword[counter]

	; Perform addition
	mov eax, dword[input1]
	add eax, dword[input2]

	; Display result of addition
	push eax
	push dword[input2]
	push dword[input1]
	push addMsg
	call printf
	add esp, 12

	; Jump back to loop
	jmp loop

subtraction:
	; Increment counter
	inc dword[counter]

	; Perform subtraction
	mov eax, dword[input1]
	sub eax, dword[input2]

	; Display result of subtraction
	push eax
	push dword[input2]
	push dword[input1]
	push subtractMsg
	call printf
	add esp, 12

	; Jump back to loop
	jmp loop

multiplication:
	; Increment counter
	inc dword[counter]

	; Perform multiplication
	mov eax, dword[input1]
	mov ebx, dword[input2]
	mul ebx

	; Display result of multiplication
	push eax
	push dword[input2]
	push dword[input1]
	push multiplyMsg
	call printf
	add esp, 12

	; Jump back to loop
	jmp loop

division:

	; Check if divisor is 0
	cmp dword[input2],0
	je division_by_zero

	; Increment counter
	inc dword[counter]

	; Display division prompt
	push dword[input2]
	push dword[input1]
	push divideMsg
	call printf
	add esp, 12

	; Perform division
	mov eax, dword[input1]
	mov ebx, dword[input2]
	xor edx, edx
	div ebx
	mov dword[remainder], edx

	; Display quotient
	push eax
	push qoutient
	call printf
	add esp, 8

	; Display remainder
	push dword[remainder]
	push remainderMsg
	call printf
	add esp, 8

	; Jump back to loop
	jmp loop

input_error:
	; Display input error message
	push errorMsg2
	call printf
	add esp, 4

	jmp loop

int_error:
	; Display input error message
	push errorMsg
	call printf
	add esp, 4
	
	;Used to clear input buffer
	push noMsg
	push fmt2
	call scanf
	add esp,8
	
	jmp loop

division_by_zero:
	; Display division by zero error message
	push divisionErrorMsg
	call printf
	add esp, 4

	; Jump back to loop
	jmp loop

exit:
	; Display exit message
	push exitMsg
	call printf
	add esp, 4

	; Display total number of operations performed
	push dword[counter]
	push sum
	call printf
	add esp, 4

	; Exit program
	mov eax, 1
	mov ebx, 0
	int 0x80

section .data
	OpenMsg db "-----CALCULATOR------",10,0
	FirstMsg db "Enter a number: ",0
	operationMsg db "1 for addition, 2 for subtraction, 3 for multiplication , 4 for division.",10,0

	divisionErrorMsg db "Zero cannot be the denominator, try again.",10,0
	errorMsg db "Error, enter a valid integer.",10,0
	errorMsg2 db "Error, enter a valid integer, in the range ( 1 - 4).",10,0

	addMsg db "%d + %d = %d",10,0
	subtractMsg db "%d - %d = %d",10,0
	multiplyMsg db "%d x %d = %d",10,0
	divideMsg db "%d / %d ",10,0

	noMsg db 10,0	

	qoutient db "The quotient is : %d.",10,0
	remainderMsg db "The remainder is : %d.",10,0

	fmt db "%d",0
	fmt2 db "%s",0
	
	exitMsg db "Exiting the Program (-666) initiated.",10,0
	sum db "The total numbers of operations performed is %d.",10,0


section .bss
	remainder resd 1
	counter resd 1
	input1 resd 1
	input2 resd 1
	input3 resd 1
