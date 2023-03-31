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
	cmp w4, 0x00ee
	beq ganaste
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
	cmp w4, 0x00ee
	beq ganaste
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
	b coloresss

derecha1:
    add x10,x10,16
    b coloresss

arriba1:
    sub x10,x10,2048
    sub x10,x10,2048
    sub x10,x10,2048
    sub x10,x10,2048
	b coloresss

abajo1:
    add x10, x10, 2048
    add x10, x10, 2048
    add x10, x10, 2048
    add x10, x10, 2048
	b coloresss

coloresss: 
	sub x16, x16, 1
	cmp x16, #7
	beq verde 
	cmp x16, #6
	beq azul
	cmp x16, #5
	beq violetta
	cmp x16, #4
	beq rojo1
	cmp x16, #3
	beq rojo2
	cmp x16, #2
	beq naranja
	cmp x16, #1
	beq amarillo
	cmp x16, #0
	beq verdeClaro
	b blancoo

verde:
	mov w3, 0x0404
	b pintar
azul:
	mov w3, 0x1111
	b pintar
violetta:
	mov w3, 0xf8f8
	b pintar
rojo1:
	mov w3, 0xf0f0
	b pintar
rojo2:
	mov w3, 0xf800
	b pintar
naranja:
	mov w3, 0xe2e2
	b pintar
amarillo:
	mov w3, 0xe7e7
	b pintar
verdeClaro:
	mov w3, 0x0707
	mov x16, 8
	b pintar
blancoo:
	mov w3, 0xffff
	mov x16, 8

pintar:

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

ganaste:
	// --- Delay loop ---
	movz x11, 0x05, lsl #16
delayyy: 
	sub x11,x11,1
	cbnz x11, delayyy
	// ------------------
	mov w3, 0xF800    	// 0xF800 = ROJO	
	add x10, x0, 0		// X10 contiene la dirección base del framebuffer
	mov x2,512         	// Tamaño en Y
loop10:
	mov x1,512         	// Tamaño en X
loop00:
	sturh w3,[x10]	   	// Setear el color del pixel N
	add x10,x10,2	   	// Siguiente pixel
	sub x1,x1,1	   		// Decrementar el contador X
	cbnz x1,loop00	   	// Si no terminó la fila, saltar
	sub x2,x2,1	   		// Decrementar el contador Y
	cbnz x2,loop10	  	// Si no es la última fila, saltar

	// --- Delay loop ---
	b apagarLEDrojo
rojoApagado:
	b prenderLEDverde
verdePrendido:

	movz x11, 0x05, lsl #16
delayyyy: 
	sub x11,x11,1
	cbnz x11, delayyyy
	// ------------------

	mov w3, 0xffff   		
	add x10, x0, 0		// X10 contiene la dirección base del framebuffer
	mov x2,512         	// Tamaño en Y
loop5:
	mov x1,512         	// Tamaño en X
loop05:
	sturh w3,[x10]	   	// Setear el color del pixel N
	add x10,x10,2	   	// Siguiente pixel
	sub x1,x1,1	   		// Decrementar el contador X
	cbnz x1,loop05	   	// Si no terminó la fila, saltar
	sub x2,x2,1	   		// Decrementar el contador Y
	cbnz x2,loop5	  	// Si no es la última fila, saltar

	b apagarLEDverde
verdeApagado:

	b ganaste
