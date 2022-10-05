module VGA_Controller(
	input[2:0] stateSq1,
	input[2:0] stateSq2,
	input[2:0] stateSq3,
	input[2:0] stateSq4,
	input[2:0] stateSq5,
	input[2:0] stateSq6,
	input[2:0] stateSq7,
	input[2:0] stateSq8,
	input[2:0] stateSq9,
	input[2:0] winner,
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

reg [15:0] H_count_value = 0; 
reg [15:0] V_count_value = 0;

logic sq1,sq2,sq3,sq4,sq5,sq6,sq7,sq8,sq9;

logic sq1_o,sq2_o,sq3_o,sq4_o,sq5_o,sq6_o,sq7_o,sq8_o,sq9_o;
logic sq1_x,sq2_x,sq3_x,sq4_x,sq5_x,sq6_x,sq7_x,sq8_x,sq9_x;

muxVGAOut square1(stateSq1,sq1_x,sq1_o,sq1);
muxVGAOut square2(stateSq2,sq2_x,sq2_o,sq2);
muxVGAOut square3(stateSq3,sq3_x,sq3_o,sq3);
muxVGAOut square4(stateSq4,sq4_x,sq4_o,sq4);
muxVGAOut square5(stateSq5,sq5_x,sq5_o,sq5);
muxVGAOut square6(stateSq6,sq6_x,sq6_o,sq6);
muxVGAOut square7(stateSq7,sq7_x,sq7_o,sq7);
muxVGAOut square8(stateSq8,sq8_x,sq8_o,sq8);
muxVGAOut square9(stateSq9,sq9_x,sq9_o,sq9);

//Text
Pixel_On_Text2 #(.displayText("X")) Square1_x(
                clk_25Mhz,
                224, // text position.x (top left)
                95, // text position.y (top left)
                H_count_value, // current position.x
                V_count_value, // current position.y
                sq1_x  // result, 1 if current pixel is on text, 0 otherwise
            );
//Text
Pixel_On_Text2 #(.displayText("X")) Square2_x(
                clk_25Mhz,
                464, // text position.x (top left)
                95, // text position.y (top left)
                H_count_value, // current position.x
                V_count_value, // current position.y
                sq2_x // result, 1 if current pixel is on text, 0 otherwise
            );				
Pixel_On_Text2 #(.displayText("X")) Square3_x(
                clk_25Mhz,
                704, // text position.x (top left)
                95, // text position.y (top left)
                H_count_value, // current position.x
                V_count_value, // current position.y
                sq3_x  // result, 1 if current pixel is on text, 0 otherwise
            );
Pixel_On_Text2 #(.displayText("X")) Square4_x(
                clk_25Mhz,
                224, // text position.x (top left)
                275, // text position.y (top left)
                H_count_value, // current position.x
                V_count_value, // current position.y
                sq4_x  // result, 1 if current pixel is on text, 0 otherwise
            );
Pixel_On_Text2 #(.displayText("X")) Square5_x(
                clk_25Mhz,
                464, // text position.x (top left)
                275, // text position.y (top left)
                H_count_value, // current position.x
                V_count_value, // current position.y
                sq5_x  // result, 1 if current pixel is on text, 0 otherwise
            );				
Pixel_On_Text2 #(.displayText("X")) Square6_x(
                clk_25Mhz,
                704, // text position.x (top left)
                275, // text position.y (top left)
                H_count_value, // current position.x
                V_count_value, // current position.y
                sq6_x  // result, 1 if current pixel is on text, 0 otherwise
            );
Pixel_On_Text2 #(.displayText("X")) Square7_x(
                clk_25Mhz,
                224, // text position.x (top left)
                455, // text position.y (top left)
                H_count_value, // current position.x
                V_count_value, // current position.y
                sq7_x  // result, 1 if current pixel is on text, 0 otherwise
            );
Pixel_On_Text2 #(.displayText("X")) Square8_x(
                clk_25Mhz,
                464, // text position.x (top left)
                455, // text position.y (top left)
                H_count_value, // current position.x
                V_count_value, // current position.y
                sq8_x  // result, 1 if current pixel is on text, 0 otherwise
            );				
Pixel_On_Text2 #(.displayText("X")) Square9_x(
                clk_25Mhz,
                704, // text position.x (top left)
                455, // text position.y (top left)
                H_count_value, // current position.x
                V_count_value, // current position.y
                sq9_x  // result, 1 if current pixel is on text, 0 otherwise
            );	

				
//Text de 0
Pixel_On_Text2 #(.displayText("X")) Square1_o(
                clk_25Mhz,
                224, // text position.x (top left)
                95, // text position.y (top left)
                H_count_value, // current position.x
                V_count_value, // current position.y
                sq1_o  // result, 1 if current pixel is on text, 0 otherwise
            );
Pixel_On_Text2 #(.displayText("X")) Square2_o(
                clk_25Mhz,
                464, // text position.x (top left)
                95, // text position.y (top left)
                H_count_value, // current position.x
                V_count_value, // current position.y
                sq2_o // result, 1 if current pixel is on text, 0 otherwise
            );				
Pixel_On_Text2 #(.displayText("X")) Square3_o(
                clk_25Mhz,
                704, // text position.x (top left)
                95, // text position.y (top left)
                H_count_value, // current position.x
                V_count_value, // current position.y
                sq3_o  // result, 1 if current pixel is on text, 0 otherwise
            );
Pixel_On_Text2 #(.displayText("X")) Square4_o(
                clk_25Mhz,
                224, // text position.x (top left)
                275, // text position.y (top left)
                H_count_value, // current position.x
                V_count_value, // current position.y
                sq4_o  // result, 1 if current pixel is on text, 0 otherwise
            );
Pixel_On_Text2 #(.displayText("X")) Square5_o(
                clk_25Mhz,
                464, // text position.x (top left)
                275, // text position.y (top left)
                H_count_value, // current position.x
                V_count_value, // current position.y
                sq5_o  // result, 1 if current pixel is on text, 0 otherwise
            );				
Pixel_On_Text2 #(.displayText("X")) Square6_o(
                clk_25Mhz,
                704, // text position.x (top left)
                275, // text position.y (top left)
                H_count_value, // current position.x
                V_count_value, // current position.y
                sq6_o  // result, 1 if current pixel is on text, 0 otherwise
            );
Pixel_On_Text2 #(.displayText("X")) Square7_o(
                clk_25Mhz,
                224, // text position.x (top left)
                455, // text position.y (top left)
                H_count_value, // current position.x
                V_count_value, // current position.y
                sq7_o  // result, 1 if current pixel is on text, 0 otherwise
            );
Pixel_On_Text2 #(.displayText("X")) Square8_o(
                clk_25Mhz,
                464, // text position.x (top left)
                455, // text position.y (top left)
                H_count_value, // current position.x
                V_count_value, // current position.y
                sq8_o  // result, 1 if current pixel is on text, 0 otherwise
            );				
Pixel_On_Text2 #(.displayText("X")) Square9_o(
                clk_25Mhz,
                704, // text position.x (top left)
                455, // text position.y (top left)
                H_count_value, // current position.x
                V_count_value, // current position.y
                sq9_o  // result, 1 if current pixel is on text, 0 otherwise
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

always_ff @(posedge clk)
	begin
		//Columna 1
		if(H_count_value > 144 && H_count_value < 304)
			begin
				//Fila 1
				if(V_count_value > 35 && V_count_value < 155)
				begin
					if(sq1)
							begin
								r_red   = 8'h00;
								r_green = 8'h00;
								r_blue  = 8'h00;
							end
						else
							begin
								r_red   = ff;
								r_green = ff;
								r_blue  = ff;
							end
				end
				//Fila 2
				else if(V_count_value > 215 && V_count_value < 335)
				begin
					if(sq4)
							begin
								r_red   = 8'h00;
								r_green = 8'h00;
								r_blue  = 8'h00;
							end
						else
							begin
								r_red   = ff;
								r_green = ff;
								r_blue  = ff;
							end
				end
				//Fila 3
				else if(V_count_value > 395 && V_count_value < 515)
				begin
					if(sq7)
							begin
								r_red   = 8'h00;
								r_green = 8'h00;
								r_blue  = 8'h00;
							end
						else
							begin
								r_red   = ff;
								r_green = ff;
								r_blue  = ff;
							end
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
						if(sq2)
							begin
								r_red   = 8'h00;
								r_green = 8'h00;
								r_blue  = 8'h00;
							end
						else
							begin
								r_red   = ff;
								r_green = ff;
								r_blue  = ff;
							end
					end
				//Fila 2
				else if(V_count_value > 215 && V_count_value < 335)
					begin
						if(sq5)
							begin
								r_red   = 8'h00;
								r_green = 8'h00;
								r_blue  = 8'h00;
							end
						else
							begin
								r_red   = ff;
								r_green = ff;
								r_blue  = ff;
							end
					end
				//Fila 3
				else if(V_count_value > 395 && V_count_value < 515)
					begin
						if(sq8)
							begin
								r_red   = 8'h00;
								r_green = 8'h00;
								r_blue  = 8'h00;
							end
						else
							begin
								r_red   = ff;
								r_green = ff;
								r_blue  = ff;
							end
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
						if(sq3)
							begin
								r_red   = 8'h00;
								r_green = 8'h00;
								r_blue  = 8'h00;
							end
						else
							begin
								r_red   = ff;
								r_green = ff;
								r_blue  = ff;
							end
					end
				//Fila 2
				else if(V_count_value > 215 && V_count_value < 335)
					begin
						if(sq6)
							begin
								r_red   = 8'h00;
								r_green = 8'h00;
								r_blue  = 8'h00;
							end
						else
							begin
								r_red   = ff;
								r_green = ff;
								r_blue  = ff;
							end
					end
				//Fila 3
				else if(V_count_value > 395 && V_count_value < 515)
					begin
						if(sq9)
							begin
								r_red   = 8'h00;
								r_green = 8'h00;
								r_blue  = 8'h00;
							end
						else
							begin
								r_red   = ff;
								r_green = ff;
								r_blue  = ff;
							end
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