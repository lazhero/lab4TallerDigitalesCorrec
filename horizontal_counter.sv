module horizontal_counter(input clk, rst,output logic enable_v, output logic[15:0] h_count);
	always_ff @(posedge clk or posedge rst)begin
		if(rst)begin
			enable_v = 0;
			h_count = 0;
		end 
		
		else begin
			if(h_count < 799)begin
				h_count = h_count+1;
				enable_v = 0;
			end
			else begin
				h_count = 0;
				enable_v = 1;
			end
		end
	end
endmodule 