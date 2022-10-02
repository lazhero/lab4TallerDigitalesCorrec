module mux21(input[3:0] a,b,input sel, output logic [3:0] out);

	always_comb begin
		case(sel)
			1'b0:out=a;
			1'b1:out=b;
			default:out=a;
		endcase
	end

endmodule 