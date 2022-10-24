.globl app
app:
	//---------------- Inicialización GPIO --------------------

	mov w20, PERIPHERAL_BASE + GPIO_BASE     // Dirección de los GPIO.		
	
	// Configurar GPIO 17 como input:
	mov X21,#0
	str w21,[x20,GPIO_GPFSEL1] 		// Coloco 0 en Function Select 1 (base + 4)   	
	
	//---------------- Main code --------------------
	// X0 contiene la dirección base del framebuffer (NO MODIFICAR)
loopx:
	b escenario
loop:
	b esperar
	
	mov w3, 0xF800    	// 0xF800 = ROJO	
	add x10, x0, 0		// X10 contiene la dirección base del framebuffer
loop2:
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
//	b escuchar
//	b avanzarYdibujar
//	bnz x20, loop
	
	// --- Infinite Loop ---	
InfLoop: 
	b InfLoop
	