/*
Universidad del Valle de Guatemala
Organizacion de computadoras y assembler
autor: David Valenzuela				171001
*/

.data
.align 2
base: .float 61
string: .asciz "La nota del proyecto necesaria para aprobar el curso es de: %f% \n"

/**
 * r0 - r3 contiene la direccion del valor float
*/
.text
.global calculoNotaProyecto
calculoNotaProyecto:
	push {lr}
	@Cargar los valores punto flotante y convertirlos a B64
	vldr s0, [r0]
	vcvt.F64.F32 d5, s0
	vldr s1, [r1]
	vcvt.F64.F32 d6, s1
	vldr s2, [r2]
	vcvt.F64.F32 d7, s2
	vldr s3, [r3]
	vcvt.F64.F32 d8, s3
	ldr r5, adbase
	vldr s10, [r5]
	vcvt.F64.F32 d9, s10
	@Sumamos todos los valores
	vadd.F64 d5, d5, d6
	vadd.F64 d5, d5, d7
	vadd.F64 d5, d5, d8
	@Encontramos cuanto falta para llegar a 61
	vsub.F64 d4, d9, d5
	ldr r0, =string
	vmov r2, r3, d4
	bl printf
	@Guardamos el resultado en la direccion de r0
	pop {lr}
	mov pc, lr @Return r0

	adbase: .word base
