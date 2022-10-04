module victoryCondition(input [1:0] a,b,c,d,e,f,g,h,i, output logic [1:0] victory);
	localparam [1:0] p1=2'b01; //player 1
	localparam [1:0] p2=2'b10; //player 2
	localparam [1:0] noVictory=2'b00; //any player has won
	logic v1,v2;
	
	always_comb begin
		if(v1)victory=p1;
		else if(v2)victory=p2;
		else victory=noVictory;
		
	end
	
	assign v1= (a==p1 & b==p1 & c==p1) | (d==p1 & e==p1 & f==p1) | (g==p1 & h==p1 & i==p1) | (a==p1 & d==p1 & g==p1)
					| (b==p1 & e==p1 & h==p1)| (c==p1 & f==p1 & i==p1)| (a==p1 & e==p1 & i==p1)| (c==p1 & e==p1 & g==p1);
					
	assign v2=(a==p2 & b==p2 & c==p2) | (d==p2 & e==p2 & f==p2) | (g==p2 & h==p2 & i==p2) | (a==p2 & d==p2 & g==p2)
					| (b==p2 & e==p2 & h==p2)| (c==p2 & f==p2 & i==p2)| (a==p2 & e==p2 & i==p2)| (c==p2 & e==p2 & g==p2);
					
	
	


endmodule 