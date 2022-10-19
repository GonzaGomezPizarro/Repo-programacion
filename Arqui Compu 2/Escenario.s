.globl app
app:
	//---------------- Inicialización GPIO --------------------

	mov w20, PERIPHERAL_BASE + GPIO_BASE     // Dirección de los GPIO.		
	
	// Configurar GPIO 17 como input:
	mov X21,#0
	str w21,[x20,GPIO_GPFSEL1] 		// Coloco 0 en Function Select 1 (base + 4)   	
	
	//---------------- Main code --------------------
	// X0 contiene la dirección base del framebuffer (NO MODIFICAR)
	
	//ACA SE PINTA TODO DE NEGRO
	mov w3, 0x0000    	// 0x0000 = negro	
	add x10, x0, 0		// X10 contiene la dirección base del framebuffer

	mov x2,512         	// Tamaño en Y
loop1:
	mov x1,512         	// Tamaño en X
loop0:
	sturh w3,[x10]	   	// Setear el color del pixel N
	add x10,x10,2	   	// Siguiente pixel
	sub x1,x1,1	   		// Decrementar el contador X
	cbnz x1,loop0	   	// Si no terminó la fila, saltar
	sub x2,x2,1	   		// Decrementar el contador Y
	cbnz x2,loop1	  	// Si no es la última fila, saltar

// AHORA SE PINTA LOS BORDES DE BLANCO
// ahora la pantalla de 512x512 pixeles se va a dividir en 64x64 bloques de 8x8 pixeles c/u
	mov w3, 0xFFFF    	// 0x0000 = BLANCO
	add x10, x0, 8208		// X10 contiene la dirección base del framebuffer
	//8208 = 1024*8 + 2*8 
 
	mov x2,61 		// contador de y
	mov x1,62 		// contador de x
branch:
	b pintarbloque
continuar:
	sub x1,x1,1 	// decremento contador de x,
	add x10,x10,16  // siguiente bloque
	cbnz x1,branch // si no se termino la linea, saltar

	sub x10,x10,16  // retrocedo una posicion
branch2:
	add x10,x10, 8192 	// siguiente linea (1024*8 = 8192)
	sub x2,x2,1			// decremento contador de y
	b pintarbloque2
continuar2
	cbnz x2, branch2 	// si no termino la columna, saltar

	mov x1,61		// contador de x
branch3:
	sub x10,x10,16
	b pintarbloque3
continuar3:
	sub x1,x1,1 	// decremento contador de x,
	sub x10,x10,16  // bloque anterior
	cbnz x1,branch // si no se termino la linea, saltar

	mov x2,60 		// contador de y
branch4:
	sub x10,x10, 8192 	// linea anterior (1024*8 = 8192)
	sub x2,x2,1	
	b pintarbloque4
continuar4:
	cbnz x2, branch2 	// si no termino la columna, saltar
	b InfLoop





	




pintarbloque:
	mov x12,8			// Contador de y
xxx:
	mov x11,8  			// Contador de x
pintar:
	sturh w3,[x10] 		// Setear el color del primer pixel del bloque
	add x10,x10,2	   	// Siguiente pixel (16 bits)
	sub x11,x11,1	   	// decrementar el contador X
	cbnz x11,pintar     // Si no es el 8vo pixel, saltar
	add x10,x10,1008 	// primer pixel de la siguiente fila +1024(siguiente fila)-16(vuelvo 8 columnas) = 1008
	sub x12,x12,1 		// decrementar el contador de y
	cbnz x12,xxx 		// si no es la ultima fila, saltar
	sub x10,x10,8208    // vuelvo a la posicion inicial - //8208 = 1024*8 + 2*8  (retorcedo 8 filas y 8columnas)
	b continuar

pintarbloque2:
	mov x12,8			// Contador de y
xxx2:
	mov x11,8  			// Contador de x
pintar2:
	sturh w3,[x10] 		// Setear el color del primer pixel del bloque
	add x10,x10,2	   	// Siguiente pixel (16 bits)
	sub x11,x11,1	   	// decrementar el contador X
	cbnz x11,pintar2     // Si no es el 8vo pixel, saltar
	add x10,x10,1008 	// primer pixel de la siguiente fila +1024(siguiente fila)-16(vuelvo 8 columnas) = 1008
	sub x12,x12,1 		// decrementar el contador de y
	cbnz x12,xxx2		// si no es la ultima fila, saltar
	sub x10,x10,8208    // vuelvo a la posicion inicial - //8208 = 1024*8 + 2*8  (retorcedo 8 filas y 8columnas)
	b continuar2

pintarbloque3:
	mov x12,8			// Contador de y
xxx3:
	mov x11,8  			// Contador de x
pintar3:
	sturh w3,[x10] 		// Setear el color del primer pixel del bloque
	add x10,x10,2	   	// Siguiente pixel (16 bits)
	sub x11,x11,1	   	// decrementar el contador X
	cbnz x11,pintar3     // Si no es el 8vo pixel, saltar
	add x10,x10,1008 	// primer pixel de la siguiente fila +1024(siguiente fila)-16(vuelvo 8 columnas) = 1008
	sub x12,x12,1 		// decrementar el contador de y
	cbnz x12,xxx3		// si no es la ultima fila, saltar
	sub x10,x10,8208    // vuelvo a la posicion inicial - //8208 = 1024*8 + 2*8  (retorcedo 8 filas y 8columnas)
	b continuar3

pintarbloque4:
	mov x12,8			// Contador de y
xxx4:
	mov x11,8  			// Contador de x
pintar4:
	sturh w3,[x10] 		// Setear el color del primer pixel del bloque
	add x10,x10,2	   	// Siguiente pixel (16 bits)
	sub x11,x11,1	   	// decrementar el contador X
	cbnz x11,pintar4     // Si no es el 8vo pixel, saltar
	add x10,x10,1008 	// primer pixel de la siguiente fila +1024(siguiente fila)-16(vuelvo 8 columnas) = 1008
	sub x12,x12,1 		// decrementar el contador de y
	cbnz x12,xxx4		// si no es la ultima fila, saltar
	sub x10,x10,8208    // vuelvo a la posicion inicial - //8208 = 1024*8 + 2*8  (retorcedo 8 filas y 8columnas)
	b continuar4



	// --- Infinite Loop ---	
InfLoop: 
	b InfLoop


	