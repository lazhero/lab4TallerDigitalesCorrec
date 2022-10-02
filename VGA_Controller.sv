module VGA_Controller(

	input clk,
	input rst,
	output Hsync,
	output Vsync,
	output [7:0] Red,
	output [7:0] Green,
	output [7:0] Blue,
	output VGA_clk
);

logic clk_25Mhz;
clock_divider clk_divider(clk,clk_25Mhz);
logic enable_v_counter = 0;
reg [15:0] H_count_value = 0; 
reg [15:0] V_count_value = 0;

always @(posedge clk_25Mhz or posedge rst)

	begin
	
		if (rst)
		
			begin
			H_count_value <= 0; 
			V_count_value <= 0;
			end
			
		else
			
			begin
				if(H_count_value < 799) 
			
				begin
				H_count_value <= H_count_value + 1;
				enable_v_counter <= 0;
				end
				
			else
				
				begin
				H_count_value <= 0;
				enable_v_counter <= 1;
				end

			if(enable_v_counter == 1'b1)
			
				begin
				if(V_count_value <= 524)
				
					V_count_value <= V_count_value + 1;
				else 
				
					V_count_value <= 0;
				end
			end

	end

assign VGA_clk = clk_25Mhz;

assign Hsync = (H_count_value >= 0 && H_count_value < 96) ? 1:0;
assign Vsync = (V_count_value >= 0 && V_count_value < 2)  ? 1:0;

assign Red   = (H_count_value > 144 && H_count_value < 783 && V_count_value > 35 && V_count_value <= 514) ? 8'hFF:8'h00;
assign Green = (H_count_value > 144 && H_count_value < 783 && V_count_value > 35 && V_count_value <= 514) ? 8'hFF:8'h00;
assign Blue  = (H_count_value > 144 && H_count_value < 783 && V_count_value > 35 && V_count_value <= 514) ? 8'hFF:8'h00;

endmodule 