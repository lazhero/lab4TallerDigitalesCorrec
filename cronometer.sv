module cronometer(input clk,rst,manualRst,output timeout);

	localparam [29:0] finishTime= 30'b101100101101000001011110000000; //for use
	 
	//localparam [29:0] finishTime= 30'b10100;  //for test to avoid waiting to much
	
	logic [29:0] count, nextCount;
	
	
	always_ff @(posedge clk or posedge rst) begin
		if(rst) count=0;
		else count=nextCount;
	end
	
	always_comb begin
	
		if(manualRst)nextCount=0;
		else begin
			case(count)
				finishTime:nextCount=count;
				default: nextCount=count+1;
			endcase
		end
		
	end
	assign timeout=(count==finishTime);
endmodule 