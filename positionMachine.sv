module positionMachine(input clk,rst,next,output [3:0] pos);


	logic [3:0] nextState,state;
	
	 
	
	always_ff @(posedge clk or posedge rst)begin
		if(rst) state=4'b0000;
		else state=nextState;
	end
	
	always_comb begin
		case(state)
			4'b0000: if(next) nextState=4'b0001;else nextState=state;
			4'b0001: if(next) nextState=4'b0010;else nextState=state;
			4'b0010: if(next) nextState=4'b0011;else nextState=state;
			4'b0011: if(next) nextState=4'b0100;else nextState=state;
			4'b0100: if(next) nextState=4'b0101;else nextState=state;
			4'b0101: if(next) nextState=4'b0110;else nextState=state;
			4'b0110: if(next) nextState=4'b0111;else nextState=state;
			4'b0111: if(next) nextState=4'b1000;else nextState=state;
			4'b1000: if(next) nextState=4'b0000;else nextState=state;
			default: nextState=4'b0000;
		
		endcase 
	end
	
	assign pos=state;
	
endmodule 