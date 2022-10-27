.global avanzarYdibujar

avanzarYdibujar:

    // X15 contien el tamaño de la vibora
    // x11 las posiciones en x
    // x12 las posiciones en y
    // x25 contiene la direccion de la vibora

    ldr x11, =XxX 
	ldr X12, =YyY 

avanzarCreciendo: 
    mov x3,x15 //x3 = tamaño
    add x3, x3, x3 // x3*2

    b contt
    
avanzarSINcrecer:
    mov x3,x15 //x3 = tamaño
    add x3, x3, x3 // x3*2

    ldurh x1,[x11,x3] // ultima pos
    b borrar
AVcontinuar:
    sub x3, x3, 2
    ldurh x1,[x11,x3] // pos anterior
    sturh x2,[x11,x3]
    sub x3, x3, 1
    add x11, x11, 2 //siguiente pos
    cbnz x3

    b contt

borrar:
    mov w3, 0x0000    	// 0x0000 = negro
	mov x2,8			// Contador de y
AVxxx:
	mov x1,8  			// Contador de x
AVpintar:
	sturh w3,[x10] 		// Setear el color del primer pixel del bloque
	add x10,x10,2	   	// Siguiente pixel (16 bits)
	sub x1,x1,1	   	// decrementar el contador X
	cbnz x1,AVpintar     // Si no es el 8vo pixel, saltar
	add x10,x10,1008 	// primer pixel de la siguiente fila +1024(siguiente fila)-16(vuelvo 8 columnas) = 1008
	sub x2,x2,1 		// decrementar el contador de y
	cbnz x2,AVxxx 		// si no es la ultima fila, saltar
	
	sub x10, x10, 2048  
	sub x10, x10, 2048
	sub x10, x10, 2048
	sub x10, x10, 2048
	add x10, x10, 16 //siguiente bloque
	
    b AVcontinuar
