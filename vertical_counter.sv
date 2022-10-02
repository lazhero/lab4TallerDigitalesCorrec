module vertical_counter(input clk, rst, enable_v, output logic[15:0] v_count);
	always_ff @(posedge clk or posedge rst)begin
		if(rst)begin
			v_count = 0;
		end 
		
		else begin
			if(enable_v == 1'b1) begin
				if(v_count < 525)v_count = v_count+1;
				else v_count = 0;
			end
		end
	end
endmodule 