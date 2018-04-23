.data
	prompt: .asciiz "Jak sie nazywasz? "
	promptAnswer: .asciiz "Czesc "
	exitPrompt: .asciiz "Chcesz ponownie odaplic program? (1,0) "
	name: .space 20 # zmienna na odpowiedź o wielkości do 20 znaków

.text

main:
	li $v0, 4 # ustaw wypisanie string'a
	la $a0, prompt # przekaż do wypisania zawartość prompt'a
	syscall # wypisz
	
	li $v0, 8 # ustaw pobranie string'a
	la $a0, name # przekaż zmienną na zapisanie wyniku
	li $a1, 20 # przekazać maksymnalną liczbę znaków
	syscall # pobierz
	
	move $t0, $v0 # zapisz w t0 pobraną wartość z v0
	
	li $v0, 4 # ustaw wypisanie string'a
	la $a0, promptAnswer # przekaż do wypisania zawartość promptAnserw'a
	syscall # wypisz
	
	li $v0, 4 # ustaw wypisanie string'a
	la $a0, name # przekaż do wypisania zawartość name'a
	syscall	# wypisz
	
	
	li $v0, 4 # ustaw wypisanie string'a
	la $a0, exitPrompt # przekaż do wypisania zawartość exitPrompt'a
	syscall # wypisz
	
	li $v0, 5 # ustaw pobranie int'a
	syscall # pobierz
	beq $v0, 1, main # ponów program jeśli w v0 jest wartość 1

	li $v0, 10 # ustaw koniec programu
	syscall # zakończ program
