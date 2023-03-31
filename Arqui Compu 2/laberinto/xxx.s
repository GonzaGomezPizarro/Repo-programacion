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
	b pintarbloque
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
	cmp x2,3
	bgt pintarbloque
	cbnz x2, escbranch2 	// si no termino la columna, saltar
	
	mov x1,61		// contador de x
escbranch3:
	b pintarbloque
	sub x1,x1,1 	// decremento contador de x,
	sub x10,x10,16  // bloque anterior
	cbnz x1,escbranch3 // si no se termino la linea, saltar

	mov x2,58 		// contador de y
escbranch4:
	b pintarbloque
escontinuar4:
	// linea anterior 2048*4 = (1024*8 = 8192) x los 8 bits
	sub x10, x10, 2048
	sub x10, x10, 2048
	sub x10, x10, 2048
	sub x10, x10, 2048
	sub x2,x2,1	
	
	cbnz x2, escbranch4 	// si no termino la columna, saltar


// SEGUNDO ANILLOOOOO -------------------------------------------------------------------------


	//mov w3, 0x3636  
	mov w3, 0xffff  

	mov x4, 40 // cuadrado de 44 x 44 (el decimo cuadrado (10))
	add x10, x0, 0 // X10 contiene la dirección base del framebuffer
	add x10, x10, 32 // 2 cuadrados a las derecha

g:	
	add x10, x10, 2048
	sub x4, x4, 1
	cbnz x4, g
 
	mov x2,43 		// contador de y
	mov x1,52 		// contador de x
escbranch5:
	b pintarbloque
	sub x1,x1,1 	// decremento contador de x,
	add x10,x10,16  // siguiente bloque
	cbnz x1,escbranch5 // si no se termino la linea, saltar

	sub x10,x10,16  // retrocedo una posicion
escbranch6:
	// siguiente linea 2048*4 = (1024*8 = 8192) x los 8 bits
	add x10, x10, 2048
	add x10, x10, 2048
	add x10, x10, 2048
	add x10, x10, 2048
	sub x2,x2,1			// decremento contador de y
	cmp x2,3
	bgt pintarbloque
	cbnz x2, escbranch6 	// si no termino la columna, saltar

	add x10, x10, 128 // 8 cuadrados a las derecha
	
	mov x1,51		// contador de x
escbranch7:
	b pintarbloque
	sub x1,x1,1 	// decremento contador de x,
	sub x10,x10,16  // bloque anterior
	cbnz x1,escbranch7 // si no se termino la linea, saltar

	mov x2,40 		// contador de y
escbranch8:
	b pintarbloque
	// linea anterior 2048*4 = (1024*8 = 8192) x los 8 bits
	sub x10, x10, 2048
	sub x10, x10, 2048
	sub x10, x10, 2048
	sub x10, x10, 2048
	sub x2,x2,1	
	
	cbnz x2, escbranch8 	// si no termino la columna, saltar
	b fiiiiiiiin




pintarbloque:
	mov x13,x10
	mov x12,8			// Contador de y
xxx:
	mov x11,8  			// Contador de x
pin:
	sturh w3,[x13] 		// Setear el color del primer pixel del bloque
	add x13,x13,2	   	// Siguiente pixel (16 bits)
	sub x11,x11,1	   	// decrementar el contador X
	cbnz x11,pin     // Si no es el 8vo pixel, saltar
	add x13,x13,1008 	// primer pixel de la siguiente fila +1024(siguiente fila)-16(vuelvo 8 columnas) = 1008
	sub x12,x12,1 		// decrementar el contador de y
	cbnz x12,xxx 		// si no es la ultima fila, saltar

	br x30


fiiiiiiiin:
	//PINTAMOS LA ZONA PARA GANAR ----------------------------------------------------------------	
	add x10, x0, 0		// X10 contiene la dirección base del framebuffer
loop2:
	mov x2,512         	// Tamaño en Y
loop1:
	mov x1,512         	// Tamaño en X
loop0:
	add x10,x10,2	   	// Siguiente pixel
	sub x1,x1,1	   		// Decrementar el contador X
	cbnz x1,loop0	   	// Si no terminó la fila, saltar
	sub x2,x2,1	   		// Decrementar el contador Y
	cbnz x2,loop1	  	// Si no es la última fila, saltar
	sub x10,x10,2
	//ESTAMOS EN EL ULTIMO PIXEL
	sub x10,x10,2048
	sub x10,x10,2048
	sub x10,x10,2048

	mov w3, 0x00ee    // COLOR PARA GANAR 
	mov x13,x10
	mov x12,40			// Contador de y
aaaaa:
	mov x11,8  			// Contador de x
bbbbb:
	sturh w3,[x13] 		// Setear el color del primer pixel del bloque
	sub x13,x13,2	   	// Siguiente pixel (16 bits)
	sub x11,x11,1	   	// decrementar el contador X
	cbnz x11,bbbbb     // Si no es el 8vo pixel, saltar
	sub x13,x13,1008 	// primer pixel de la siguiente fila +1024(siguiente fila)-16(vuelvo 8 columnas) = 1008
	sub x12,x12,1 		// decrementar el contador de y
	cbnz x12,aaaaa 		// si no es la ultima fila, saltar



	//PINTAMOS EL PRIMER CUADRADO  	 ------------------------------------------------------------------

	mov w3, 0xf800
	add x10, x0, 0		// X10 contiene la dirección base del framebuffer

	// 1 derecha 3 para abajo
	add x10, x10, 16 // 1 derecha
	mov x3, 12 // 4 iteraciones es 1 abajo
oooo:
	add x10, x10, 2048 
	sub x3, x3, 1
	cbnz x3, oooo

	mov x7, x10
	mov x12,8			// Contador de y
xxxv:
	mov x11,8  			// Contador de x
hhhhhh:
	sturh w3,[x7] 		// Setear el color del primer pixel del bloque
	add x7,x7,2	   	// Siguiente pixel (16 bits)
	sub x11,x11,1	   	// decrementar el contador X
	cbnz x11,hhhhhh     // Si no es el 8vo pixel, saltar
	add x7,x7,1008 	// primer pixel de la siguiente fila +1024(siguiente fila)-16(vuelvo 8 columnas) = 1008
	sub x12,x12,1 		// decrementar el contador de y
	cbnz x12,xxxv 		// si no es la ultima fila, saltar



	b loop

	



	