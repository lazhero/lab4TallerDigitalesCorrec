module test_vga_Controller();
	 logic clk, rst, clk_25MHz;
	 logic Hsync, Vsync;
	 logic[7:0] Red, Green, Blue;
	 
	 
	 clock_divider my_clock(clk, rst, clk_25MHz);
	 VGA_Controller My_VGA_Controller(clk_25MHz, rst, Hsync, Vsync, Red, Green, Blue);
	 
	 initial begin
		clk = 0;#1;
		rst = 1;#1;
		rst = 0;#3;
		forever begin
			clk = ~clk; #5;
		end
	 end

endmodule 