module checkEmpty(input [1:0] a,b,c,d,e,f,g,h,i,input [3:0] pos, output flag);
	
	localparam empty_state=2'b0;
	logic condition;
	always_comb begin
		case(pos)
			4'b0000: condition=(a==empty_state);
			4'b0001: condition=(b==empty_state);
			4'b0010: condition=(c==empty_state);
			4'b0011: condition=(d==empty_state);
			4'b0100: condition=(e==empty_state);
			4'b0101: condition=(f==empty_state);
			4'b0110: condition=(g==empty_state);
			4'b0111: condition=(h==empty_state);
			4'b1000: condition=(i==empty_state);
			default: condition=0;
		endcase
		
	end
	assign flag=condition;

endmodule 