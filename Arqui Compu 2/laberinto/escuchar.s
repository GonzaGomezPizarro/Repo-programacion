.global escuchar

escuchar:
    b inputRead
continuar:
	
    cbnz x22, izquierda
	cbnz x23, arriba 
	cbnz x24, abajo
	cbnz x25, derecha
    b contt

izquierda:
	sub x10,x10,4 //reviso el pixel de la izquierda
	ldurh w4, [x10]
    add x10,x10,4
    cmp w4, 0x0000
	bne contt  //si el registo no es negro, no se puede mover en esa direccion
	b borrar

derecha:
	add x10, x10, 18 //reviso el bloque de la derecha
	ldurh w4, [x10]
    sub x10, x10, 18
    cmp w4, 0x0000
	bne contt  //si el registo no es negro, no se puede mover en esa direccion
	b borrar

arriba:
	sub x10,x10, 2040 //reviso el pixel de arriba
	ldurh w4, [x10]
    add x10,x10,2040
    cmp w4, 0x0000
	bne contt  //si el registo no es negro, no se puede mover en esa direccion
	b borrar

abajo:
	add x10, x10, 2048
    add x10, x10, 2048
    add x10, x10, 2048
    add x10, x10, 2048 //reviso el bloque de abajo
	ldurh w4, [x10]
    sub x10, x10, 2048
    sub x10, x10, 2048
    sub x10, x10, 2048
    sub x10, x10, 2048
    cmp w4, 0x0000
	bne contt  //si el registo no es negro, no se puede mover en esa direccion
	b borrar

listo:
	cbnz x22, izquierda1
	cbnz x23, arriba1 
	cbnz x24, abajo1
	cbnz x25, derecha1

izquierda1:
    sub x10,x10,16
	b pintar

derecha1:
    add x10,x10,16
    b pintar

arriba1:
    sub x10,x10,2048
    sub x10,x10,2048
    sub x10,x10,2048
    sub x10,x10,2048
	b pintar

abajo1:
    add x10, x10, 2048
    add x10, x10, 2048
    add x10, x10, 2048
    add x10, x10, 2048
	b pintar

pintar:
	mov w3, 0xF0F0
	mov x1, 8
	mov x2,8
	mov x11,x10

subloopxb:

	sturh w3,[x11]
    sub x1,x1,1
	add x11,x11,2
	cbz x1, subloopyb
	b subloopxb

subloopyb:
	mov x1, 8
	add x11,x11, 1008
	sub x2,x2, 1
	cbz x2, contt
	b subloopxb

borrar:
	mov w3, 0x0000 //negroo
	mov x1, 8 //x
	mov x2, 8 //y
	mov x11,x10 //copia de x10

subloopxb1:
	sturh w3,[x11]
	sub x1,x1,1
	add x11,x11,2
    cbz x1, subloopyb1 // cuano terminal la fila
	b subloopxb1

subloopyb1:
	mov x1, 8
	add x11,x11,1008
	sub x2,x2,1
	cbz x2, listo
	b subloopxb1

b contt

