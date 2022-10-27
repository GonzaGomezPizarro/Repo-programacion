.global esperar
.global esperar

esperar:
// --- Delay loop ---
	movz x11, 0x05, lsl #16
delay1: 
	sub x11,x11,1
	cbnz x11, delay1
	// ------------------
    b cont
