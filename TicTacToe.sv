
module TicTacToe(input sel,next,rst,clk,Fclk,output [1:0] a,b,c,d,e,f,g,h,i, output [1:0] winner);
	
	localparam [1:0] p1=2'b01; //player 1
	localparam [1:0] p2=2'b10; //player 2
	
	logic [3:0] position,pRam,pFinal;
	logic Pcondition;
	logic player;
	logic checkPos,checkPosRandom;
	logic timeout,timeRstCondition;
	logic [1:0] victory;
	logic doneGameCondition;
	
	positionMachine myPositionMachine(.clk(clk),.rst(rst),.next(next),.pos(position));
	
	randomModule myrandom(.clk(Fclk),.rst(rst),.pos(pRam));
	muxCustom themux (.a(position),.b(pRam),.sel(timeout), .out(pFinal));
	playGrill grill (.position(pFinal) ,.sel(Pcondition),.Pl(player),.clk(clk),.rst(rst),.a(a),.b(b),.c(c),.d(d),.e(e),.f(f),.g(g),.h(h),.i(i));
	playerIterator myiterator(.clk(clk),.rst(rst),.change(Pcondition), .player(player));
	
	cronometer mycronometer(.clk(clk),.rst(rst),.manualRst(timeRstCondition),.timeout(timeout));
	
	checkEmpty myCheckPos(.a(a),.b(b),.c(c),.d(d),.e(e),.f(f),.g(g),.h(h),.i(i),.pos(position), .flag(checkPos));
	checkEmpty myCheckPosRandom(.a(a),.b(b),.c(c),.d(d),.e(e),.f(f),.g(g),.h(h),.i(i),.pos(pRam), .flag(checkPosRandom));
	
	victoryCondition victoryModule(.a(a),.b(b),.c(c),.d(d),.e(e),.f(f),.g(g),.h(h),.i(i), .victory(victory));
	
	
	assign doneGameCondition= (victory==p1) | (victory==p2);
	assign Pcondition=((sel&checkPos)|(timeout&checkPosRandom)) & !doneGameCondition;
	assign timeRstCondition=Pcondition;
	assign winner=victory;
endmodule 