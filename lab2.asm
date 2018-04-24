.data
	prompt: .asciiz "Podaj liczbe\n a = "
	equalZeroMessage: .asciiz "a rowna sie 0\n"
	lesserThanZeroMessage: .asciiz "a jest ujemne\n"
	greaterThanZeroMessage: .asciiz "a jest dodatnie\n"
	isEvenMessage: .asciiz "a jest parzysta\n"
	isOddMessage: .asciiz "a jest nieparzysta\n"

	exitPrompt: .asciiz "\nChcesz ponownie odaplic program? (1 - tak) "
.text

main:
	li $v0, 4 # ustaw wypisanie string'a
	la $a0, prompt # przekaż do wypisania zawartość prompt'a
	syscall # wypisz

	li $v0, 5 # ustaw pobranie int'a
	syscall # pobierz
	
	move $t0, $v0 # zapisz wartość w t0

egual_greater_lesser_condition:	
	beq $t0, 0, if_equal_zero # a == 0
	bgt $t0, 0, if_greater_than_zero # a > 0 
	
	li $v0, 4 # ustaw wypisanie string'a
	la $a0, lesserThanZeroMessage # przekaż do wypisania zawartość lesserThanZeroMessage'a
	syscall # wypisz
	j even_condition
		
	if_equal_zero:
		li $v0, 4 # ustaw wypisanie string'a
		la $a0, equalZeroMessage # przekaż do wypisania zawartość equalZeroMessage'a
		syscall # wypisz
		j even_condition
		
	if_greater_than_zero:
		li $v0, 4 # ustaw wypisanie string'a
		la $a0, greaterThanZeroMessage # przekaż do wypisania zawartość greaterThanZeroMessage'a
		syscall # wypisz

even_condition:
	div $t1, $t0, 2 
	mul $t2, $t1, 2
	
	beq $t0, $t2, if_even
	
	li $v0, 4 # ustaw wypisanie string'a
	la $a0, isOddMessage # przekaż do wypisania zawartość isOddMessage'a
	syscall # wypisz	
	j exit
		
	if_even: 
		li $v0, 4 # ustaw wypisanie string'a
		la $a0, isEvenMessage # przekaż do wypisania zawartość isEvenMessage'a
		syscall # wypisz
		j exit
	
	

exit:
	li $v0, 4 # ustaw wypisanie string'a
	la $a0, exitPrompt # przekaż do wypisania zawartość exitPrompt'a
	syscall # wypisz

	li $v0, 5 # ustaw pobranie int'a
	syscall # pobierz
	beq $v0, 1, main # ponów program jeśli w v0 jest wartość 1

	li $v0, 10 # ustaw koniec programu
	syscall # zakończ program
