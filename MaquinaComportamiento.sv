module MaquinaComportamiento (input clk, rst, x, output y);


	logic [1:0] estadoActual, estadoSiguiente;

	// lógica del estado actual (secuencial)
	
	always_ff @(posedge clk or posedge rst)
		if (rst) 
			estadoActual=0;
		else
			estadoActual=estadoSiguiente;
			
	// Lógica del estado siguiente (combinacional)
	
	always_comb 
		case (estadoActual)
			0: if (x) estadoSiguiente=1; else estadoSiguiente=0;
			1: if (x) estadoSiguiente=3; else estadoSiguiente=2;
			2: if (x) estadoSiguiente=1; else estadoSiguiente=0;
			3: if (x) estadoSiguiente=3; else estadoSiguiente=2;
			default: estadoSiguiente=0;
		endcase
	// Lógica de las salidas
	assign y= (estadoActual==0);

endmodule