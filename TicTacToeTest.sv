
module TicTacToeTest();
	logic [1:0] a,b,c,d,e,f,g,h,i;
	logic sel,next,rst,clk,Fclk;
	logic winner;
	logic[3:0] position;
	TicTacToe myToe(.sel(sel),.next(next),.rst(rst),.clk(clk),.Fclk(clk),.a(a),.b(b),.c(c),.d(d),.e(e),.f(f),.g(g),.h(h),.i(i),.winner(winner),.positionOut(position));
	
	
	always begin 
		clk=!clk;
		#10;
	
	end
	
	always begin 
		Fclk=!Fclk;
		#5;
	
	end
	initial begin
		clk=1'b1;
		Fclk=1'b1;
		rst=1'b1;
		sel=1'b0;
		next=1'b0;
		
		#10;  //negedge
		rst=1'b0;
		sel=1'b1;
		
		#10; //posedge
		
		
		#10; //negedge
		sel=1'b1;   
		
		#10; //posedge output should not change
		
		
		#10; //negedge
		sel=1'b0;
		next=1'b1;
		
		#10; //posedge
		
		
		#10; //negedge
		next=1'b0;
		sel=1'b1;
		
		#10; //posedge
		
		
		#10; //negedge
		sel=1'b0;
		
		#400;
		
		/*
		
		
		#500000000;
		#500000000;
		#500000000;
		#500000000;
		#500000000;
		#500000000;
		#500000000;
		#500000000;
		#500000000;
		#500000000;
		
		#500000000;
		#500000000;
		#500000000;
		#500000000;
		#500000000;
		#500000000;
		#500000000;
		#500000000;
		#500000000;
		#500000000;
		
		#500000000;
		#500000000;
		#500000000;
		#500000000;
		#500000000;
		#500000000;
		#500000000;
		#500000000;
		#500000000;
		#500000000;
		
		
		*/
	
		
		
		
		
		
		
		
		
	
	end

endmodule 