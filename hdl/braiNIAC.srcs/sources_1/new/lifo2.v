module lifo2 #(parameter WIDTH=8, DEPTH = 8)(
	input  clk,
	input  reset,
	output reg [WIDTH-1:0] q,
	input  [WIDTH-1:0] d,
	output empty, 
	input  push,
	input  pop
);
	
	reg [DEPTH - 1:0] ptr;
	reg [WIDTH - 1:0] stack [DEPTH - 1: 0];
	
	// Empty if the pointer is in the bottom position
	assign empty = (ptr == 0);

	always @(posedge clk) begin
		if (reset)
			ptr <= 0;
		else if (push)
			ptr <= ptr + 1;
		else if (pop)
			ptr <= ptr - 1;
	end

	always @(posedge clk) begin
		if (push || pop) begin
			if(push)
				stack[ptr] <= d;
		end
		q <= stack[ptr - 1];
	end

endmodule