module positionTest();
	logic clk,rst,next;
	logic [3:0] pos; 
	positionMachine posM(.clk(clk),.rst(rst),.next(next),.pos(pos));
	
	
	initial begin 
		rst=1'b1;
		clk=1'b0;
		next=1'b0;
		#10;
		rst=1'b0;
		#10;
		next=1'b1;
		#10;
		clk=1'b1;
		#10;
		next=1'b0;
		clk=1'b0;
		#10;
		clk=1'b1;
		#10;
		clk=1'b0;
		#10;
		next=1'b1;
		next=1'b0;
		#10;
	end
	
endmodule 

