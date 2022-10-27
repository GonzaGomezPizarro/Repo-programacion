.global escenario

escenario:
	
	//ACA SE PINTA TODO DE NEGRO
	mov w3, 0x0000    	// 0x0000 = negro	
	add x10, x0, 0		// X10 contiene la dirección base del framebuffer

	mov x2,512         	// Tamaño en Y
lesc1:
	mov x1,512         	// Tamaño en X
lesc0:
	sturh w3,[x10]	   	// Setear el color del pixel N
	add x10,x10,2	   	// Siguiente pixel
	sub x1,x1,1	   		// Decrementar el contador X
	cbnz x1, lesc0	   	// Si no terminó la fila, saltar
	sub x2,x2,1	   		// Decrementar el contador Y
	cbnz x2, lesc1	  	// Si no es la última fila, saltar

// AHORA SE PINTA LOS BORDES DE BLANCO
// ahora la pantalla de 512x512 pixeles se va a dividir en 64x64 bloques de 8x8 pixeles c/u
	mov w3, 0xFFFF    	// 0xFFFF = BLANCO
	
	add x10, x0, 2052 // X10 contiene la dirección base del framebuffer
	add x10, x10, 2052
	add x10, x10, 2052
	add x10, x10, 2052 // 2052*4 = 8208 = 1024*8 + 2*8 
 
	mov x2,61 		// contador de y
	mov x1,62 		// contador de x
escbranch:
	b escpintarbloque
esccontinuar:
	sub x1,x1,1 	// decremento contador de x,
	add x10,x10,16  // siguiente bloque
	cbnz x1,escbranch // si no se termino la linea, saltar

	sub x10,x10,16  // retrocedo una posicion
escbranch2:
	// siguiente linea 2048*4 = (1024*8 = 8192) x los 8 bits
	add x10, x10, 2048
	add x10, x10, 2048
	add x10, x10, 2048
	add x10, x10, 2048
	sub x2,x2,1			// decremento contador de y
	b escpintarbloque2
esccontinuar2:
	cbnz x2, escbranch2 	// si no termino la columna, saltar
	
	mov x1,61		// contador de x
escbranch3:
	b escpintarbloque3
esccontinuar3:
	sub x1,x1,1 	// decremento contador de x,
	sub x10,x10,16  // bloque anterior
	cbnz x1,escbranch3 // si no se termino la linea, saltar

	mov x2,61 		// contador de y
escbranch4:
	b escpintarbloque4
escontinuar4:
	// linea anterior 2048*4 = (1024*8 = 8192) x los 8 bits
	sub x10, x10, 2048
	sub x10, x10, 2048
	sub x10, x10, 2048
	sub x10, x10, 2048
	sub x2,x2,1	
	
	cbnz x2, escbranch4 	// si no termino la columna, saltar
	b fiiiiiiiin





escpintarbloque:
	mov x12,8			// Contador de y
escxxx:
	mov x11,8  			// Contador de x
escpintar:
	sturh w3,[x10] 		// Setear el color del primer pixel del bloque
	add x10,x10,2	   	// Siguiente pixel (16 bits)
	sub x11,x11,1	   	// decrementar el contador X
	cbnz x11,escpintar     // Si no es el 8vo pixel, saltar
	add x10,x10,1008 	// primer pixel de la siguiente fila +1024(siguiente fila)-16(vuelvo 8 columnas) = 1008
	sub x12,x12,1 		// decrementar el contador de y
	cbnz x12,escxxx 		// si no es la ultima fila, saltar
	
	sub x10, x10, 2048  // vuelvo a la posicion inicial - // 2052*4 = 8208 = 1024*8 + 2*8  (retorcedo 8 filas y 8columnas)
	sub x10, x10, 2048
	sub x10, x10, 2048
	sub x10, x10, 2048

	b esccontinuar

escpintarbloque2:
	mov x12,8			// Contador de y
escxxx2:
	mov x11,8  			// Contador de x
escpintar2:
	sturh w3,[x10] 		// Setear el color del primer pixel del bloque
	add x10,x10,2	   	// Siguiente pixel (16 bits)
	sub x11,x11,1	   	// decrementar el contador X
	cbnz x11,escpintar2     // Si no es el 8vo pixel, saltar
	add x10,x10,1008 	// primer pixel de la siguiente fila +1024(siguiente fila)-16(vuelvo 8 columnas) = 1008
	sub x12,x12,1 		// decrementar el contador de y
	cbnz x12,escxxx2 		// si no es la ultima fila, saltar
	
	sub x10, x10, 2048  // vuelvo a la posicion inicial - // 2052*4 = 8208 = 1024*8 + 2*8  (retorcedo 8 filas y 8columnas)
	sub x10, x10, 2048
	sub x10, x10, 2048
	sub x10, x10, 2048
	b esccontinuar2

escpintarbloque3:
	mov x12,8			// Contador de y
escxxx3:
	mov x11,8  			// Contador de x
escpintar3:
	sturh w3,[x10] 		// Setear el color del primer pixel del bloque
	add x10,x10,2	   	// Siguiente pixel (16 bits)
	sub x11,x11,1	   	// decrementar el contador X
	cbnz x11,escpintar3     // Si no es el 8vo pixel, saltar
	add x10,x10,1008 	// primer pixel de la siguiente fila +1024(siguiente fila)-16(vuelvo 8 columnas) = 1008
	sub x12,x12,1 		// decrementar el contador de y
	cbnz x12,escxxx3 		// si no es la ultima fila, saltar
	
	sub x10, x10, 2048  // vuelvo a la posicion inicial - // 2052*4 = 8208 = 1024*8 + 2*8  (retorcedo 8 filas y 8columnas)
	sub x10, x10, 2048
	sub x10, x10, 2048
	sub x10, x10, 2048
	b esccontinuar3

escpintarbloque4:
	mov x12,8			// Contador de y
escxxx4:
	mov x11,8  			// Contador de x
escpintar4:
	sturh w3,[x10] 		// Setear el color del primer pixel del bloque
	add x10,x10,2	   	// Siguiente pixel (16 bits)
	sub x11,x11,1	   	// decrementar el contador X
	cbnz x11,escpintar4     // Si no es el 8vo pixel, saltar
	add x10,x10,1008 	// primer pixel de la siguiente fila +1024(siguiente fila)-16(vuelvo 8 columnas) = 1008
	sub x12,x12,1 		// decrementar el contador de y
	cbnz x12,escxxx4 		// si no es la ultima fila, saltar
	
	sub x10, x10, 2048  // vuelvo a la posicion inicial - // 2052*4 = 8208 = 1024*8 + 2*8  (retorcedo 8 filas y 8columnas)
	sub x10, x10, 2048
	sub x10, x10, 2048
	sub x10, x10, 2048
	b escontinuar4
	
fiiiiiiiin:
	b loop

	



	