module playGrill(input [3:0] position ,input sel,Pl,clk,rst,output[1:0] a,b,c,d,e,f,g,h,i);

	squareBox #(.id_code(4'b0000)) c0 (.code(position), .sel(sel),.pl(Pl),.rst(rst),.clk(clk),.out(a));
	squareBox #(.id_code(4'b0001)) c1 (.code(position), .sel(sel),.pl(Pl),.rst(rst),.clk(clk),.out(b));
	squareBox #(.id_code(4'b0010)) c2 (.code(position), .sel(sel),.pl(Pl),.rst(rst),.clk(clk),.out(c));
	squareBox #(.id_code(4'b0011)) c3 (.code(position), .sel(sel),.pl(Pl),.rst(rst),.clk(clk),.out(d));
	squareBox #(.id_code(4'b0100)) c4 (.code(position), .sel(sel),.pl(Pl),.rst(rst),.clk(clk),.out(e));
	squareBox #(.id_code(4'b0101)) c5 (.code(position), .sel(sel),.pl(Pl),.rst(rst),.clk(clk),.out(f));
	squareBox #(.id_code(4'b0110)) c6 (.code(position), .sel(sel),.pl(Pl),.rst(rst),.clk(clk),.out(g));
	squareBox #(.id_code(4'b0111)) c7 (.code(position), .sel(sel),.pl(Pl),.rst(rst),.clk(clk),.out(h));
	squareBox #(.id_code(4'b1000)) c8 (.code(position), .sel(sel),.pl(Pl),.rst(rst),.clk(clk),.out(i));

endmodule 