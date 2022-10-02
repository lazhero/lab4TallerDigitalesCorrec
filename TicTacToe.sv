
module TicTacToe(input sel,next,rst,clk,Fclk,output [1:0] a,b,c,d,e,f,g,h,i);
	logic [3:0] position,pRam,pFinal;
	logic Pcondition;
	logic player;
	logic checkPos,checkPosRandom;
	logic timeout,timeRstCondition;
	
	positionMachine myPositionMachine(.clk(clk),.rst(rst),.next(next),.pos(position));
	
	randomModule myrandom(.clk(Fclk),.rst(rst),.pos(pRam));
	muxCustom themux (.a(position),.b(pRam),.sel(timeout), .out(pFinal));
	playGrill grill (.position(pFinal) ,.sel(Pcondition),.Pl(player),.clk(clk),.rst(rst),.a(a),.b(b),.c(c),.d(d),.e(e),.f(f),.g(g),.h(h),.i(i));
	playerIterator myiterator(.clk(clk),.rst(rst),.change(Pcondition), .player(player));
	
	cronometer mycronometer(.clk(clk),.rst(rst),.manualRst(timeRstCondition),.timeout(timeout));
	
	checkEmpty myCheckPos(.a(a),.b(b),.c(c),.d(d),.e(e),.f(f),.g(g),.h(h),.i(i),.pos(position), .flag(checkPos));
	checkEmpty myCheckPosRandom(.a(a),.b(b),.c(c),.d(d),.e(e),.f(f),.g(g),.h(h),.i(i),.pos(pRam), .flag(checkPosRandom));
	
	
	
	
	assign Pcondition=(sel&checkPos)|(timeout&checkPosRandom);
	assign timeRstCondition=Pcondition;
endmodule 