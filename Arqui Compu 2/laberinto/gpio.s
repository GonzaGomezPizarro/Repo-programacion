//--------DEFINICIÓN DE FUNCIONES-----------//
    .global inputRead    
	//DESCRIPCION: Lee el boton en el GPIO17. 
//------FIN DEFINICION DE FUNCIONES-------//

inputRead: 	
	ldr w21, [x20, GPIO_GPLEV0] 	// Leo el registro GPIO Pin Level 0 y lo guardo en X21
	and X22, x21, #0x20000	// Limpio el bit 17 (estado del GPIO17)
	and x23, x21, #0x40000  // limpio bit 18
	and x24, x21, #0x8000 // 19 
	and x25, x21, #0x4000 //20
	
    b continuar
	
	
apagarLEDrojo:
	mov w26, 0x8 //LED ROJO
 	str w26, [x20, 0x1c]
 	b rojoApagado

prenderLEDrojo:
	mov w26, 0x8 //LED ROJO
	str w26, [x20, 0x28]
	b rojoPrendido

apagarLEDverde:
	mov w26, 0x4 //LED verde
 	str w26, [x20, 0x1c]
 	b verdeApagado

prenderLEDverde:
	mov w26, 0x4 //LED verde
	str w26, [x20, 0x28]
	b verdePrendido

apagarLEDverde2:
	mov w26, 0x4 //LED verde
 	str w26, [x20, 0x1c]
 	b verdeApagado2
	

	
	
	
