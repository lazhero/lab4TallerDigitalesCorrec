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
logic[7:0] r_red,r_blue,r_green;


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

//assign Red   = (H_count_value > 144 && H_count_value < 783 && V_count_value > 35 && V_count_value <= 514) ? 8'hFF:8'h00;
//assign Green = (H_count_value > 144 && H_count_value < 783 && V_count_value > 35 && V_count_value <= 514) ? 8'hFF:8'h00;
//assign Blue  = (H_count_value > 144 && H_count_value < 783 && V_count_value > 35 && V_count_value <= 514) ? 8'hFF:8'h00;
always @(posedge clk)
	begin
		//Cuadrado 1
		if(H_count_value > 144 && H_count_value < 304 && V_count_value > 35 && V_count_value < 155)
			begin
				r_red   = 8'hFF;
				r_green = 8'hFF;
				r_blue  = 8'hFF;
			end
		//Cuadrado 2
		if(H_count_value > 384 && H_count_value < 544 && V_count_value > 35 && V_count_value < 155)
			begin
				r_red   = 8'h10;
				r_green = 8'hAA;
				r_blue  = 8'hFF;
			end
		//Cuadrado 3
		if(H_count_value > 624 && H_count_value < 784 && V_count_value > 35 && V_count_value < 155)
			begin
				r_red   = 8'h10;
				r_green = 8'hFF;
				r_blue  = 8'hFF;
			end
		//Cuadrado 4
		if(H_count_value > 144 && H_count_value < 304 && V_count_value > 215 && V_count_value < 335)
			begin
				r_red   = 8'h20;
				r_green = 8'h50;
				r_blue  = 8'hAF;
			end	
		//Cuadrado 5
		if(H_count_value > 384 && H_count_value < 544 && V_count_value > 215 && V_count_value < 335)
			begin
				r_red   = 8'hAA;
				r_green = 8'h00;
				r_blue  = 8'hFF;
			end
		//Cuadrado 6
		if(H_count_value > 624 && H_count_value < 784 && V_count_value > 215 && V_count_value < 335)
			begin
				r_red   = 8'h00;
				r_green = 8'hFF;
				r_blue  = 8'hFF;
			end
		//Cuadrado 7
		if(H_count_value > 144 && H_count_value < 304 && V_count_value > 395 && V_count_value < 515)
			begin
				r_red   = 8'h10;
				r_green = 8'hFA;
				r_blue  = 8'h6F;
			end
		//Cuadrado 8
		if(H_count_value > 384 && H_count_value < 544 && V_count_value > 395 && V_count_value < 515)
			begin
				r_red   = 8'h60;
				r_green = 8'h55;
				r_blue  = 8'hAF;
			end	
		//Cuadrado 9
		if(H_count_value > 624 && H_count_value < 784 && V_count_value > 395 && V_count_value < 515)
			begin
				r_red   = 8'hA0;
				r_green = 8'h53;
				r_blue  = 8'h4F;
			end	
		else
			begin
				r_red   = 8'hFF;
				r_green = 8'hFF;
				r_blue  = 8'hFF;
			end
	end
	assign Red = (H_count_value > 144 && H_count_value <= 783 && V_count_value > 35 && V_count_value <= 514) ? r_red : 8'hFF;
	assign Blue = (H_count_value > 144 && H_count_value <= 783 && V_count_value > 35 && V_count_value <= 514) ? r_blue : 8'hFF;
	assign Green = (H_count_value > 144 && H_count_value <= 783 && V_count_value > 35 && V_count_value <= 514) ? r_green : 8'hFF;

endmodule 