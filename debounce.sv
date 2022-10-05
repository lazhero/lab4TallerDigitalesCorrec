module debounce(input button,clk,rst,output outButton);

	logic state,nextState;
	
	always_ff @(posedge clk or posedge rst) begin
		if(rst)state=1'b0;
		else state=nextState;
	end
	
	always_comb begin
	
		case(state)
			1'b0:if(button)nextState=1'b1;else nextState=1'b0;
			1'b1:if(button)nextState=1'b0;else nextState=1'b1;
			
		
		endcase
	end
	
	assign outButton=state;
endmodule 