.globl app
app:
	//---------------- Inicialización GPIO --------------------

	mov w20, PERIPHERAL_BASE + GPIO_BASE     // Dirección de los GPIO.		
	
	// Configurar GPIO 17 como input:
	mov X21,#0
	str w21,[x20,GPIO_GPFSEL1] 		// Coloco 0 en Function Select 1 (base + 4)   	
	
	// configurar LEDs como outputs
	mov X26,#0x240
	str w26,[x20,0] 		// 001 en los gpio 2 y 3
	
	//---------------- Main code --------------------
	// X0 contiene la dirección base del framebuffer (NO MODIFICAR)
	b escenario


	b prenderLEDrojo
rojoPrendido:
	b apagarLEDverde2
verdeApagado2:
loop:
	b esperar
cont:
	b escuchar
contt:
	b loop
	// --- Infinite Loop ---	
InfLoop: 
	b InfLoop
	