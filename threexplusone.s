	global threexplusone

	section .text
;; OPTIMIZATIONS - speed up 3 * x + 1
;;;reduced number of push and pops
;;;implemented rolling loop
;;;simplified finding odds an evens from being a loop
;;; Hunter Vaccaro (hpv8hf) threexplusone.s 11/19/2019
threexplusone:
	xor rax, rax
	xor r10, r10
start:
	cmp	rdi, 1		;if(input == 1) break;
	je	done
	push 	rdi
	;//sub 	rdi, 2
	;//cmp 	rdi, 0
	;//je	even		
	;//cmp	rdi, 1		
	;//je	odd
	;//sub 	rdi, 2
	;//cmp 	rdi, 0
	;//je	even
	;//cmp	rdi, 1
	;//je	odd
	;//sub 	rdi, 2
	;//cmp 	rdi, 0
	;//je	even
	;//cmp	rdi, 1
	;//je	odd		
	;//jmp	loop		
loop:
	mov 	r11, rdi	;finds if input is even or odd
	inc 	r11
	xor 	rdi, r11
	cmp 	rdi, 1
	je 	even
	jmp	odd
even:				;performs even function call (input/2)
	pop 	rdi
	shr	rdi, 1
	call	threexplusone	;recursive call on new input
	inc 	r10
	jmp 	done
	
odd:				;performs odd function call (3*input+1)
	pop 	rdi
	mov	r11, rdi	
	shl 	rdi, 1
	add 	rdi, r11
	inc	rdi
	call	threexplusone	;recursive call on new input
	inc 	r10
	jmp 	done
done:
	mov 	rax, r10	;moves the counter into rax
	ret
