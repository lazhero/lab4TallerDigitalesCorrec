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

parameter ff = 8'hff;
parameter bei = 8'd128;
parameter ge = 8'd35;

reg [15:0] H_count_value = 0; 
reg [15:0] V_count_value = 0;


Pixel_On_Text2 #(.displayText("X")) t1(
                CLK_VGA,
                200, // text position.x (top left)
                200, // text position.y (top left)
                VGA_horzCoord, // current position.x
                VGA_vertCoord, // current position.y
                res  // result, 1 if current pixel is on text, 0 otherwise
            );



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
always_ff @(posedge clk)
	begin
		//Columna 1
		if(H_count_value > 144 && H_count_value < 304)
			begin
				//Fila 1
				if(V_count_value > 35 && V_count_value < 155)
				begin
					r_red   = 8'd00;
					r_green = 8'd187;
					r_blue  = 8'd45;
				end
				//Fila 2
				else if(V_count_value > 215 && V_count_value < 335)
				begin
					r_red   = 8'd200;
					r_green = 8'd162;
					r_blue  = 8'd200;
				end
				//Fila 3
				else if(V_count_value > 395 && V_count_value < 515)
				begin
					r_red   = ff;
					r_green = ff;
					r_blue  = ff;
				end
				//lineas que separan
				else
				begin
					r_red   = 8'h00;
					r_green = 8'h00;
					r_blue  = 8'h00;
				end
			end
		//Columna 2
		else if(H_count_value > 384 && H_count_value < 544)
			begin
				//Fila 1
				if(V_count_value > 35 && V_count_value < 155)
					begin
						r_red   = ff;
						r_green = ff;
						r_blue  = ff;
					end
				//Fila 2
				else if(V_count_value > 215 && V_count_value < 335)
					begin
						r_red   = 8'd00;
						r_green = 8'd00;
						r_blue  = ff;
					end
				//Fila 3
				else if(V_count_value > 395 && V_count_value < 515)
					begin
						r_red   = ff;
						r_green = ff;
						r_blue  = ff;
					end
				//lineas que separan
				else
					begin
						r_red   = 8'h00;
						r_green = 8'h00;
						r_blue  = 8'h00;
					end
			end
		//Columna 3
		else if(H_count_value > 624 && H_count_value < 784)
			begin
				//Fila 1
				if(V_count_value > 35 && V_count_value < 155)
					begin
						r_red   = ff;
						r_green = ff;
						r_blue  = ff;
					end
				//Fila 2
				else if(V_count_value > 215 && V_count_value < 335)
					begin
						r_red   = ff;
						r_green = ff;
						r_blue  = ff;
					end
				//Fila 3
				else if(V_count_value > 395 && V_count_value < 515)
					begin
						r_red   = ff;
						r_green = ff;
						r_blue  = ff;
					end
				else
					begin
						r_red   = 8'h00;
						r_green = 8'h00;
						r_blue  = 8'h00;
					end
			end
		else
			begin
				r_red   = 8'h00;
				r_green = 8'h00;
				r_blue  = 8'h00;
			end
	end
	assign Red = r_red;
	assign Blue =  r_blue;
	assign Green = r_green;

endmodule 