module playerIterator(input clk,rst,change, output player);
	
	logic state,nextState;
	always_ff @(posedge clk or posedge rst)begin
	
		if(rst)state=1'b0;
		else state=nextState;
	end
	
	always_comb begin
		case(state)
			1'b0:if(change)nextState=1'b1;else nextState=state;
			1'b1:if(change) nextState=1'b0;else nextState=state;
		endcase
	end
	
	assign player=state;


endmodule 