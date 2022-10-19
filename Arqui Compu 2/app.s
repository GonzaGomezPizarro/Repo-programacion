.globl app
app:
	//---------------- Inicialización GPIO --------------------

	mov w20, PERIPHERAL_BASE + GPIO_BASE     // Dirección de los GPIO.		
	
	// Configurar GPIO 17 como input:
	mov X21,#0
	str w21,[x20,GPIO_GPFSEL1] 		// Coloco 0 en Function Select 1 (base + 4)   	
	
	//---------------- Main code --------------------
	// X0 contiene la dirección base del framebuffer (NO MODIFICAR)
	
		
	add x10, x0, 0		// X10 contiene la dirección base del framebuffer
loop2:
	mov x1,512        	// Contador para Y
loop1:
	sub x1,x1,1			// Resta en 1 para Y
	cmp x1,0			// y==0?
	beq InfLoop			// TRUE==Terminar / False==Continuar
	mov w3, 0xF800    	// Set W3 en 0xF800 = ROJO
	mov w12, 0x20		// Set W12 en 0x20 = Verde[Minimo], primer Sector trabajamos con verde
	mov x2,512			// Contador para X
	b loop0         	// Saltar a Loop0
loop0:
	sturh w3,[x10]	   	// Setear el color del pixel N
	add x10,x10,2		// Mover al siguiente Pixel
	sturh w3,[x10]	   	// Setear el color del pixel N
	add x10,x10,2		// Mover al siguiente Pixel
	add w3, w3,w12		// Incrementar el Color de W3 en W12 segun el color almacenado en W12
	sub x2,x2,2  		// Decrementar el contador X
	
	cmp x2,#386			// X == 386??
	beq ROJO			// TRUE == Rojo (Setear W12 a Rojo[minimo])
	
	cmp x2,#262			// X == 262??
	beq Verde			// TRUE == Verde (Setear W12 a Verde[minimo])
	
	cmp x2,#74			// X == 74??
	beq AZULR			// TRUE == Azul (Setear W12 a Azul[minimo]) (AZULR == Azul disminuye)

	cmp x2,#0			// X == 0??
	beq loop1			// TRUE == Saltar a loop1 y volver a empezar 
	b loop0

looprest:				
	sturh w3,[x10]	   	// Setear el color del pixel N
	add x10,x10,2		// Mover al siguiente Pixel
	sturh w3,[x10]	   	// Setear el color del pixel N
	add x10,x10,2		// Mover al siguiente Pixel
	sub w3, w3,w12		// Incrementar el Color de W3 en W12 segun el color almacenado en W12
	sub x2,x2,2			// Decrementar el contador X
	
	cmp x2,#324			// X == 324??
	beq AZUL 			// TRUE == Azul (Setear W12 a Azul[minimo])
	
	cmp x2,#136			// X == 136??
	beq ROJOR			// TRUE == Rojo (Setear W12 a Azul[minimo]) (ROJOR == Rojo disminuye)

	cmp x2,#12			// X == 12??
	beq finaa			// TRUE == Saltar a finaa 
	b looprest			// En caso de que no sea el final

ROJO:
	mov w12, 0x800		// Setear el color de W12 en el minimo de Rojo
	b looprest			// Saltar al loop de decremento del color
Verde:
	mov w12, 0x20		// Setear el color de W12 en el minimo de Verde
	b looprest			// Saltar al loop de decremento del color
AZUL:
	mov w12, 0x1		// Setear el color de W12 en el minimo de Azul
	b loop0				// Saltar al loop de incremento del color

ROJOR:
	mov w12, 0x800		// Setear el color de W12 en el minimo de Rojo
	b loop0				// Saltar al loop de incremento del color

AZULR:
	mov w12, 0x1		// Setear el color de W12 en el minimo de Azul
	b looprest			// Saltar al loop de decremento del color

finaa:
	mov w3, 0xf800		// Setear el color de W12 en el maximo de Rojo
	sturh w3,[x10]	   	// Setear el color del pixel N
	add x10,x10,2		// Mover al siguiente Pixel
	sturh w3,[x10]	   	// Setear el color del pixel N
	add x10,x10,2		// Mover al siguiente Pixel
	sub x2,x2,2			// Decrementar el contador X

	cmp x2,#0			// X == 0??
	beq loop1			// TRUE == Saltar a loop1
	b  finaa			// buclea en final

	
	// --- Infinite Loop ---

InfLoop: 
	b InfLoop			// Loop infinito


	
