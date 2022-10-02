module squareBoxTest();
	logic [3:0] code;
	logic sel,pl,rst,clk;
	logic [1:0] out;
	squareBox #(.id_code(4'b0000)) myBox (.code(code), .sel(sel),.pl(pl),.rst(rst),.clk(clk), .out(out));
	initial begin
		code=4'b0000;
		rst=1'b1;
		pl=1'b0;
		sel=1'b0;
		clk=1'b0;
		
		#10;
		rst=1'b0;
		#10;
		sel=1'b1;
		#10;
		clk=1'b1;
		#10;
		pl=1'b1;
		clk=1'b0;
		#10;
		clk=1'b1;
		#10;
		
		code=4'b0000;
		rst=1'b1;
		pl=1'b1;
		sel=1'b0;
		clk=1'b0;
		
		#10;
		rst=1'b0;
		#10;
		sel=1'b1;
		#10;
		clk=1'b1;
		#10;
		pl=1'b0;
		clk=1'b0;
		#10;
		clk=1'b1;
		#10;
		
		code=4'b0001;
		rst=1'b1;
		pl=1'b0;
		sel=1'b0;
		clk=1'b0;
		
		#10;
		rst=1'b0;
		#10;
		sel=1'b1;
		#10;
		clk=1'b1;
		#10;
		pl=1'b1;
		clk=1'b0;
		#10;
		clk=1'b1;
		#10;
		
		
	end

endmodule
