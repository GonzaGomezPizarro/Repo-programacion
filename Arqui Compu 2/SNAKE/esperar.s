.global esperar


esperar:
// --- Delay loop ---
	movz x15, 0x10, lsl #16
delay1: 
	sub x15,x15,#1
	cbnz x15, delay1
	// ------------------
    b cont
