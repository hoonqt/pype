// Pong VGA game
// (c) fpga4fun.com

module mojo_top(clk, vga_h_sync, vga_v_sync, vga_R, vga_G, vga_B, quadA, quadB);
input clk;
output vga_h_sync, vga_v_sync, vga_R, vga_G, vga_B;
input quadA, quadB;

wire inDisplayArea;
wire [10:0] CounterX;
wire [8:0] CounterY;

hvsync_generator syncgen(.clk(clk), .vga_h_sync(vga_h_sync), .vga_v_sync(vga_v_sync), 
  .inDisplayArea(inDisplayArea), .CounterX(CounterX), .CounterY(CounterY));
  
tilesort tiles(.clk(clk), .tile1(tile1), .tile2(tile2), .tile3(tile3), .tile4(tile4), .tile5(tile5), .tile6(tile6));

borders border(.clk(clk), .bordered(bordered));



/////////////////////////////////////////////////////////////////
wire R = tile1|tile2|tile3|tile4|tile5|tile6|bordered;
wire G = tile1|tile2|tile3|tile4|tile5|tile6|bordered;
wire B = tile1|tile2|tile3|tile4|tile5|tile6|bordered;
reg vga_R, vga_G, vga_B;
always @(posedge clk)
begin
	vga_R <= R & inDisplayArea;
	vga_G <= G & inDisplayArea;
	vga_B <= B & inDisplayArea;
end

endmodule