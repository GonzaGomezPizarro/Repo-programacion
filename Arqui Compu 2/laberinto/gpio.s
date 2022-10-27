//--------DEFINICIÓN DE FUNCIONES-----------//
    .global inputRead    
	//DESCRIPCION: Lee el boton en el GPIO17. 
//------FIN DEFINICION DE FUNCIONES-------//

inputRead: 	
	ldr w21, [x20, GPIO_GPLEV0] 	// Leo el registro GPIO Pin Level 0 y lo guardo en X22
	and X22, x21, #0x20000	// Limpio el bit 17 (estado del GPIO17)
	and x23, x21, #0x40000  // limpio bit 18
	and x24, x21, #0x8000 // 19 
	and x25, x21, #0x4000 //20
	
    b continuar
	
	
output:
	ldr w26, [x20, GPIO_GPLEV0] 	// Leo el registro GPIO Pin Level 0 y lo guardo en X22
	and x27, x26, #0x3 
	and x28, x26, #0x1 
	
	
	
	
