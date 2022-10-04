module test_vga_Controller();
	 logic clk, rst, VGA_clk;
	 logic Hsync, Vsync;
	 logic[7:0] Red, Green, Blue;
	 
	 VGA_Controller My_VGA_Controller(clk, rst, Hsync, Vsync, Red, Green, Blue, VGA_clk);
	 
	 initial begin
		clk = 0;#1;
		rst = 1;#1;
		rst = 0;#3;
		forever begin
			clk = ~clk; #5;
		end
	 end

endmodule 