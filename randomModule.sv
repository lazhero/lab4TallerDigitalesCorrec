module randomModule(input rst,clk,output[3:0] pos);
	logic [3:0] state1,nextState1;
	
	
	always_ff @(posedge clk or posedge rst)begin
		if(rst)state1=0;
		else state1=nextState1;
	end
	
	always_comb begin
		case(state1)
			4'b1000:nextState1=0;
			default: nextState1=state1+1;
		endcase
	
	end
	
	
	assign pos=state1;

endmodule 

