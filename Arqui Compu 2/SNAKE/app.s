.globl app
app:
	//---------------- Inicialización GPIO --------------------

	mov w20, PERIPHERAL_BASE + GPIO_BASE     // Dirección de los GPIO.		
	
	// Configurar GPIO 17 como input:
	mov X21,#0
	str w21,[x20,GPIO_GPFSEL1] 		// Coloco 0 en Function Select 1 (base + 4)   	
	
	//---------------- Main code --------------------
	// X0 contiene la dirección base del framebuffer (NO MODIFICAR)

	b escenario

	ldr x11, =XxX //posiciones x de los cuerpos de la vibora ////  NO TOCAR ESTE REGISTRO
	ldr X12, =YyY //posiciones y de los cuerpos de la vibora ////  NO TOCAR ESTE REGISTRO
	//vamos a setear la posicion inicial de la vibora
	mov w3, 0x0202    	// 0x0202 = verde oscuro	
	add x10, x0, 0		// X10 contiene la dirección base del framebuffer
	mov x13, 4
a:

	add x10, x10, 2052 //2052*4 = 8208 = 1024*8 + 2*8 --> seteamos pos de inicio de la vibora
	sub x13, x13, 1
	cbnz x13,a 

	mov x1, 6
	mov x2, 4

	sturh x1,[x11] 
	sturh x2,[x12]
	//(x,y)=(6,4)

	mov x1, 5
	sturh x1,[x11,2] 
	sturh x2,[x12,2]
	//(x,y)=(5,4)

	sturh x2,[x11,4]
	sturh x2,[x12,4]
	//(x,y)=(4,4)
	//la vibora se mueve en 64 x 64

	mov x13, 3
pintarbloque:
	mov x2,8			// Contador de y
xxx:
	mov x1,8  			// Contador de x
pintar:
	sturh w3,[x10] 		// Setear el color del primer pixel del bloque
	add x10,x10,2	   	// Siguiente pixel (16 bits)
	sub x1,x1,1	   	// decrementar el contador X
	cbnz x1,pintar     // Si no es el 8vo pixel, saltar
	add x10,x10,1008 	// primer pixel de la siguiente fila +1024(siguiente fila)-16(vuelvo 8 columnas) = 1008
	sub x2,x2,1 		// decrementar el contador de y
	cbnz x2,xxx 		// si no es la ultima fila, saltar
	
	sub x10, x10, 2048  
	sub x10, x10, 2048
	sub x10, x10, 2048
	sub x10, x10, 2048
	add x10, x10, 16 //siguiente bloque
	cbnz x13, pintarbloque

	//TAMAÑO DE LA VIBORAR
	mov x15, 3 //  NO TOCAR ESTE REGISTRO

	//DIRECCION DE LA VIBORAR -- 1 DERECHA, 2 ABAJO, 3 IZQUIEDA, 4 ARRIBA
	mov x25, 1 //  NO TOCAR ESTE REGISTRO		

	





loop:
	b esperar
cont:
//	b escuchar
	b avanzarYdibujar
contt:
//	bnz x20, loop





	
	// --- Infinite Loop ---	
InfLoop: 
	b InfLoop
	