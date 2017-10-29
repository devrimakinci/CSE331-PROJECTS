# Adi : Devrim
# Soyadi : AKINCI
# Numarasi : 141044052

j main # Programin baslamasi icin main label'ina atladim.

	.data
str: # Sonucu konsolda gostermek icin
	.asciiz "Result = "

dot: # Nokta karakterini konsolda gostermek icin
	.asciiz "."

.text
.globl sum # Iki sayiyi toplar.

sum:
	add $t0, $a0, $a2 # t0 = a0 + a2
	add $t1, $a1, $a3 # t1 = a1 + a3
	add $t0, $t0, $t1 # t0 = t0 + t1
	div $t0, $t5 # t0 / t5
	mflo $v0 # v0 = t0 / t5
	mfhi $v1 # v1 = t0 % t5
	jr $ra   # Cagrilan yere donme

.text
.globl substract # Iki sayiyi cikarir.

substract:
	add $t0, $a0, $a1 # t0 = a0 + a1
	add $t1, $a2, $a3 # t1 = a2 + a3
	sub $t3, $t0, $t1 # t3 = t0 - t1
	div $t3, $t5 # t3 / t5
	mflo $v0 # v0 = t3 / t5
	mfhi $v1 # v1 = t3 % t5
	jr $ra   # Cagrilan yere donme

.text
.globl multiply # Iki sayiyi carpar.

multiply:
	mul $t3,$a0,$a1 # t3 = a0 * a1
	div $t3, $a2 # t3 / a2
	mflo $v0 # v0 = t3 / a2
	mfhi $v1 # v1 = t3 % a2
	jr $ra  # Cagrilan yere donme

.text
.globl calculateNumberOfDigit # Bir sayinin basamak sayisini bulur.

calculateNumberOfDigit:
	li $t5,10 # t5 = 10
	li $v0,0  # v0 = 0
	li $t6,0  # t6 = 0

loop1:
	div $a0, $t5 # a0 / t5
	mflo $a0 # a0 = a0 / t5
	addi $v0, $v0, 1 # v0 + v0 + 1
	beq $a0, $t6, exit1 # if (a0 == t6) goto exit1
	j loop1 # goto loop1

exit1:
	jr $ra # Cagrilan yere donme

.text
.globl countZero # Bir sayinin icerisindeki sifirlarin sayisini bulur.

countZero:
	li $t5,10 # t5 = 10
	li $v0,0  # v0 = 0
	li $t6,0  # t6 = 0

loop2:
	div $a0, $t5 # a0 / t5
	mflo $a0 # a0 = a0 / t5
	mfhi $t7 # t7 = a0 % t5
	bne $t7, $t6, cond # if (t7 != t6) goto cond
	addi $v0, $v0, 1 # v0 = v0 + 1

cond:
	beq $a0, $t6, exit2 # if (a0 == t6) goto exit2
	j loop2 # goto loop2

exit2:
	jr $ra # Cagrilan yere donme

.text
.globl power # Verilen sayiya gore 10'nun kuvvetini alir.

power:
	li $t7,0 # t7 = 0
	li $t6,1 # t6 = 1
	li $v0,1 # v0 = 1

loop4:
	beq $a0, $t7, exit4 # if (a0 == t7) goto exit4
	mul $v0,$v0,10 # v0 = v0 * 10
	sub $a0, $a0, $t6 # a0 = a0 - t6
	j loop4 # goto loop4

exit4:
	jr $ra # Cagrilan yere donme

.text
.globl isDivideByTen # Sayiyi 10 ile bolumunden kalan sifirdan farkli bir sayi olana kadar boler. Yani sayinin sonundaki sifirlari atar.

isDivideByTen:
	li $t5,10 # t5 = 10
	li $t6,0 # t6 = 0
	
loop5:
	div $a0, $t5 # a0 / t5
	mfhi $t7 # t7 = a0 % t5
	bne $t6, $t7, exit5 # if (t6 != t7) goto exit5
	mflo $a0 # a0 = a0 / t5
	j loop5 # goto loop5

exit5:
	move $v0,$a0 # v0 = a0
	jal $ra  # Cagrilan yere donme

.text
.globl main	# Programin calistirilacagi yer

main:
	li $v0,5       #System call code for read_int
	syscall        #Integer bir sayi okur.
	move $t0,$v0   #t0'a okudugu Integer sayiyi yazar.

	li $v0,5       #System call code for read_int
	syscall        #Integer bir sayi okur.
	move $t1,$v0   #t1'e okudugu Integer sayiyi yazar.
	
	li $v0,12      #System call code for read a character
	syscall		   #Bir karakter okur.
	move $t2,$v0   #t2'ye okudugu karakteri yazar.

	li $v0,5       #System call code for read_int
	syscall        #Integer bir sayi okur.
	move $t3,$v0   #t3'e okudugu Integer sayiyi yazar.
	

	li $v0,5       #System call code for read_int
	syscall        #Integer bir sayi okur.
	move $t4,$v0   #t4'e okudugu Integer sayiyi yazar.

	li $t6,-1 # t6 = -1
	blt $t0,$0,Negative1 # if (t0 < 0) goto Negative1
	j NonNegative # goto NonNegative

Negative1: # if (t0 < 0)
	mul $t1,$t1,$t6 # t1 = t1 * t6

NonNegative: # if (t0 >= 0)
	blt $t3,$0,Negative2 # if (t3 < 0) goto Negative2
	j Label2 # goto Label2

Negative2: # if (t3 >= 0)
	mul $t4,$t4,$t6 # t4 = t4 * t6

Label2:
	li $t5,0 # t5 = 0
	addi $sp, $sp, -4 # Stack pointer'in bir yer acilmasi
	sw $s0, 0($sp)
	move $s0,$0 # s0 = 0
	bne $t0, $t5, cond4 # if (t0 != t5) goto cond4
	bne $t3, $t5, cond4 # if (t0 != t5) goto cond4
	li $t6,1 # t6 = 1
	move $s0,$t6 # s0 = t6
	j cond4 # goto cond4

	# if (t2 == '+')
cond4:
	bne $t2, 43, ElseIf  #If (t2 != 43(ASCII -> +)) goto ElseIf
	beq $t1, $0, Zero1 # if (t1 == 0) goto Zero1
	move $a0,$t1 # a0 = t1
	jal isDivideByTen # isDivideByTen fonksiyonun cagrilmasi
	move $t1,$v0 # t1 = a0

Zero1:
	move $a0,$t1 # a0 = t1
	jal calculateNumberOfDigit # Verilen sayinin basamak sayisinin bulunmasi
	move $t8,$v0 # t8 = v0

	beq $t4, $0, Zero2 # if (t4 == 0) goto Zero2
	move $a0,$t4 # a0 = t4
	jal isDivideByTen # isDivideByTen fonksiyonun cagrilmasi
	move $t4,$v0 # t4 = v0

Zero2:
	move $a0,$t4 # a0 = t4
	jal calculateNumberOfDigit # Verilen sayinin basamak sayisinin bulunmasi
	move $t9,$v0 # t9 = v0

	bge $t8,$t9,Greater # if (t8 >= t9) goto Greater
	move $a0,$t9 # a0 = t9
	jal power # power fonksiyonun cagrilmasi
	move $t5,$v0 # t5 = v0

	## Virgul Kaydirma Islemı ##
	mul $t0,$t0,$t5 # t0 = t0 * t5
	mul $t3,$t3,$t5 # t3 = t3 * t5

	sub $t8, $t9, $t8 # t8 = t9 - t8
	move $a0,$t8 # a0 = t8
	jal power # power fonksiyonun cagrilmasi
	move $t8,$v0 # t8 = v0
	mul $t1,$t1,$t8 # t1 = t1 * t8
	
	## Argumanlarin Atanmasi
	move $a0,$t0 # a0 = t0
	move $a1,$t1 # a1 = t1
	move $a2,$t3 # a2 = t3
	move $a3,$t4 # a3 = t4

	jal sum  # sum cagrilmasi
	j Label1 # goto Label1

Greater: # if (t8 >= t9)
	move $a0,$t8 # a0 = t8
	jal power # power fonksiyonun cagrilmasi
	move $t5,$v0 # t5 = v0

	## Virgul Kaydirma Islemı ##
	mul $t0,$t0,$t5 # t0 = t0 * t5
	mul $t3,$t3,$t5 # t3 = t3 * t5

	sub $t8, $t8, $t9 # t8 = t8 -t9
	move $a0,$t8 # a0 = t8
	jal power # power fonksiyonun cagrilmasi
	move $t8,$v0 # t8 = v0
	mul $t4,$t4,$t8 # t4 = t4 * t8

	## Argumanlarin Atanmasi
	move $a0,$t0 # a0 = t0
	move $a1,$t1 # a1 = t1
	move $a2,$t3 # a2 = t3
	move $a3,$t4 # a3 = t4

	jal sum  # sum cagrilmasi
	j Label1 # Programin akisi Label1'den devam edecek

ElseIf: # if(t2 == '-')
	bne $t2, 45, Else # If (t2 != 45(ASCII -> -)) goto Else
	beq $t1, $0, Zero3 # if (t1 == 0) goto Zero3
	move $a0,$t1 # a0 = t1
	jal isDivideByTen # isDivideByTen fonksiyonun cagrilmasi
	move $t1,$v0 # t1 = a0

Zero3:	
	move $a0,$t1 # a0 = t1
	jal calculateNumberOfDigit #Verilen sayinin basamak sayisinin bulunmasi
	move $t8,$v0 # t8 = v0

	beq $t4, $0, Zero4 # if (t4 == 0) goto Zero4
	move $a0,$t4 # a0 = t4
	jal isDivideByTen # isDivideByTen fonksiyonun cagrilmasi
	move $t4,$v0 # t4 = v0

Zero4:	
	move $a0,$t4 # a0 = t4
	jal calculateNumberOfDigit #Verilen sayinin basamak sayisinin bulunmasi
	move $t9,$v0 # t9 = v0

	bge $t8,$t9,Greater2 # if (t8 >= t9) goto Greater2
	move $a0,$t9 # a0 = t9
	jal power # power fonksiyonun cagrilmasi
	move $t5,$v0 # t5 = v0

	## Virgul Kaydirma Islemı ##
	mul $t0,$t0,$t5 # t0 = t0 * t5
	mul $t3,$t3,$t5 # t3 = t3 * t5

	sub $t8, $t9, $t8 # t8 = t9 - t8
	move $a0,$t8 # a0 = t8
	jal power # power fonksiyonun cagrilmasi
	move $t8,$v0 # t8 = v0
	mul $t1,$t1,$t8 # t1 = t1 * t8
	
	## Argumanlarin Atanmasi
	move $a0,$t0 # a0 = t0
	move $a1,$t1 # a1 = t1
	move $a2,$t3 # a2 = t3
	move $a3,$t4 # a3 = t4

	jal substract # subtract cagrilmasi
	j Label1      # Programin akisi Label1'den devam edecek

Greater2: # if (t8 >= t9)
	move $a0,$t8 # a0 = t8
	jal power # power fonksiyonun cagrilmasi
	move $t5,$v0 # t5 = v0

	## Virgul Kaydirma Islemı ##
	mul $t0,$t0,$t5 # t0 = t0 * t5
	mul $t3,$t3,$t5 # t3 = t3 * t5

	sub $t8, $t8, $t9 # t8 = t8 - t9
	move $a0,$t8 # a0 = t8
	jal power # power fonksiyonun cagrilmasi
	move $t8,$v0 # t8 = v0
	mul $t4,$t4,$t8 # t4 = t4 * t8

	## Argumanlarin Atanmasi
	move $a0,$t0 # a0 = t0
	move $a1,$t1 # a1 = t1
	move $a2,$t3 # a2 = t3
	move $a3,$t4 # a3 = t4

	jal substract # subtract cagrilmasi
	j Label1      # Programin akisi Label1'den devam edecek

Else: # if (t2 == '*')
	beq $t1, $0, Zero5 # if (t1 == 0) goto Zero5
	move $a0,$t1 # a0 = t1
	jal isDivideByTen # isDivideByTen fonksiyonun cagrilmasi
	move $t1,$v0 # t1 = v0

Zero5:	
	move $a0,$t1 # a0 = t1
	jal calculateNumberOfDigit # calculateNumberOfDigit fonksiyonun cagrilmasi
	move $t8,$v0 # t8 = v0

	move $a0,$t8 # a0 = t8
	jal power    # power fonksiyonun cagrilmasi
	move $t5,$v0 # t5 = v0

	mul $t0,$t0,$t5 # t0 = t0 * t5
	add $t0, $t0, $t1 # t0 = t0 + t1

	beq $t4, $0, Zero6 # if (t4 == 0) goto Zero6
	move $a0,$t4 # a0 = t4
	jal isDivideByTen # isDivideByTen fonksiyonun cagrilmasi
	move $t4,$v0 # t4 = v0

Zero6:	
	move $a0,$t4 # a0 = t4
	jal calculateNumberOfDigit # calculateNumberOfDigit fonksiyonun cagrilmasi
	move $t9,$v0 # t9 = v0

	move $a0,$t9 # a0 = v9
	jal power    # power fonksiyonun cagrilmasi
	move $t5,$v0 # t5 = v0

	mul $t3,$t3,$t5 # t3 = t3 * t5
	add $t3, $t3, $t4 # t3 = t3 + t4
	add $t9, $t9, $t8 # t9 = t9 + t8

	move $a0,$t9 # a0 = t9
	jal power    # power fonksiyonun cagrilmasi
	move $t5,$v0 # t5 = v0

	## Argumanlarin Atanmasi
	move $a0,$t0 # a0 = t0
	move $a1,$t3 # a1 = t3
	move $a2,$t5 # a2 = t5
	
	jal multiply  # multiply cagrilmasi
	j Label1      # Programin akisi Label1'den devam edecek

Label1:
	bne $t2, 43, cond2
	move $t0,$v0 # t0 = v0
	move $t2,$v1 # t2 = v1

	beq $t1, $0, Zero7 # if (t1 == 0) goto Zero7
	move $a0,$t1 # a0 = t1
	jal isDivideByTen # isDivideByTen fonksiyonun cagrilmasi
	move $t1,$v0 # t1 = v0

Zero7:
	move $a0,$t1 # a0 = t1
	jal countZero # countZero cagrilmasi
	move $t1,$v0 # t1 = v0

	move $a0,$t2 # a0 = t2
	jal countZero # countZero cagrilmasi
	move $t6,$v0 # t6 = v0

	bgt $t6,$t1,print # if (t6 > t1) goto print
	sub $t1, $t1, $t6 # t1 = t1 - t6
	j print # goto print

cond2:

	bne $t2, 45, cond3
	move $t0,$v0 # t0 = v0
	move $t2,$v1 # t2 = v1

	beq $t2, $0, Zero8 # if (t2 == 0) goto Zero8
	move $a0,$t2 # a0 = t2
	jal isDivideByTen # isDivideByTen fonksiyonun cagrilmasi
	move $t2,$v0 # t2 = v0

Zero8:	
	move $a0,$t3 # a0 = t3
	jal countZero # countZero cagrilmasi
	move $t1,$v0 # t1 = v0

	move $a0,$t0 # a0 = t0
	jal countZero # countZero cagrilmasi
	move $t8,$v0 # t8 = v0

	move $a0,$t2 # a0 = t2
	jal countZero # countZero cagrilmasi
	move $t9,$v0 # t9 = v0

	add $t8, $t8, $t9 # t8 = t8 + t9
	bgt $t8,$t1,print # if (t8 > t1) goto print
	sub $t1, $t1, $t8 # t1 = t1 - t8
	j print # goto print

cond3:
	move $t0,$v0 # t0 = v0
	move $t2,$v1 # t2 = v1

	beq $t2, $0, Zero10 # if (t2 == 0) goto Zero10
	move $a0,$t2 # a0 = t2
	jal isDivideByTen # isDivideByTen fonksiyonun cagrilmasi
	move $t2,$v0 # t2 = v0

Zero10:
	beq $t3, $0, Zero11 # if (t3 == 0) goto Zero11
	move $a0,$t3 # a0 = t3
	jal isDivideByTen # isDivideByTen fonksiyonun cagrilmasi
	move $t3,$v0 # t3 = v0

Zero11:	
	move $a0,$t3 # a0 = t3
	jal countZero # countZero fonksiyonun cagrilmasi
	move $t9,$v0 # t9 = v0

	beq $t0, $0, Zero9 # if (t0 == 0) goto Zero9
	move $a0,$t0 # a0 = t0
	jal countZero # countZero fonksiyonun cagrilmasi
	move $t8,$v0 # t8 = v0

	move $a0,$t2 # a0 = t2
	jal countZero # countZero fonksiyonun cagrilmasi
	move $t7,$v0 # t7 = v0

	j Label5 # goto Label5

Zero9:
	move $a0,$t2 # a0 = t2
	jal countZero # countZero fonksiyonun cagrilmasi
	move $t7,$v0 # t7 = v0

	li $t8,0 # t8 = 0
	add $t8, $t7, $t8 # t8 = t7 + t8
	sub $t1, $t9, $t8 # t1 = t9 - t8
	bne $t1, $0, print # if (t1 != 0) goto print

Label5:
	add $t8, $t7, $t8 # t8 = t7 + t8
	bgt $t8,$t9,print # if (t8 > t9) goto print
	sub $t1, $t9, $t8 # t1 = t9 - t8
	bne $t1, $0, print # if (t1 != 0) goto print
	move $a0,$t2 # a0 = t2
	jal calculateNumberOfDigit # calculateNumberOfDigit fonksiyonun cagrilmasi
	move $t3,$v0 # t3 = v0
	li $t4,2 # t4 = 2
	bge $t3,$t4,GreaterOrEqual # if (t3 >= t4) goto GreaterOrEqual
	move $t1,$s0 # t1 = s0
	j print # goto print

GreaterOrEqual:
	move $t1,$0 # t1 = 0
	j print # goto print

print:
	li $v0,4  # System call code for print_str
	la $a0,str # Konsola yazdirilacak stringin adresini alir.
	syscall   # Konsola belirtilen stringi basar

	li $v0,1  # System call code for print_int
	move $a0,$t0 # a0 = t0
	syscall # Konsola integer bir sayi basar

	li $v0,4  # System call code for print_str
	la $a0,dot # Konsola yazdirilacak stringin adresini alir.
	syscall # Konsola belirtilen stringi basar

loop3:
	li $t7,0 # t7 = 0
	li $t3,1 #t3 = 1
	beq $t1, $t7, exit3 # if (t1 == t7) goto exit3
	li $v0,1 # System call code for print_int
	move $a0,$t7 # a0 = t7
	syscall # Konsola sifir yazar.
	sub $t1, $t1, $t3 # t1 = t1 - t3
	j loop3 # goto loop3

exit3:
	blt $t2,$0,Negative3 # if (t2 < 0) goto Negative3
	li $t1,0 # t1 = 0
	beq $t2, $t1, Label4 # if (t2 == t1) goto Label4
	move $a0,$t2 # a0 = t2
	jal  isDivideByTen # isDivideByTen fonksiyonun cagrilmasi
	move $t2,$v0 # t2 = v0
	j Label4 # goto Label4

Negative3: # if (t2 >= 0)
	li $t6,-1 # t6 = -1
	mul $t2,$t2,$t6 # t2 = t2 * t6
	li $t1,0 # t1 = 0
	beq $t2, $t1, Label4 # if (t2 == t1) goto Label4
	move $a0,$t2 # a0 = t2
	jal  isDivideByTen # isDivideByTen fonksiyonun cagrilmasi
	move $t2,$v0 # t2 = v0
	j Label4 # goto Label4
	
Label4:
	li $v0,1 # System call code for print_int
	move $a0,$t2 # a0 = t2
	syscall # Konsola integer bir sayi basar

	lw $s0, 0($sp) # Restore
	addi $sp, $sp, 4 # Stack kapatma

	## Programin bitmesi ##
	li $v0,10 
	syscall