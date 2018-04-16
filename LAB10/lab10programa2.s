/*
Universidad del Valle de Guatemala
Organizacion de computadoras y assembler
autor: David Valenzuela				171001
autor: Juan Jose Navas
*/

.data
.align 2
mensaje: .asciz "Ingrese nombre en minusculas (Maximo 10 caracteres, y sin espacios en blaco)"
resultado: .asciz " ";

.text
.global main
.extern printf

main:
	stmfd sp!, {lr}	/* SP = R13 link register */

	/* Imprimimos inicio del porgrama */
	ldr r0, =mensaje
	bl printf

		/* salida correcta */
	mov r0, #0
	mov r3, #0
	ldmfd sp!, {lr}	/* R13 = SP */
	bx lr