module squareBox #(parameter [3:0] id_code=4'b0000) (input [3:0] code, input sel,pl,rst,clk, output[1:0] out);


	logic [1:0] state,nextState;
	
	always_ff @(posedge clk or posedge rst)begin
		if(rst)state=2'b00;
		else state=nextState;
	end
	
	
	always_comb begin
		case(state)
			2'b00:begin
				if(code==id_code & sel & !pl)nextState=2'b01;
				else if(code==id_code & sel & pl)nextState=2'b10;
				else nextState=2'b00;
			end
			2'b01:nextState=2'b01;
			2'b10:nextState=2'b10;
			default: nextState=2'b00;
		
		endcase
	end
	assign out=state;
	

endmodule 