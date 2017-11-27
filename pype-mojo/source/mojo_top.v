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
  
wire yellow;
tilesort tilesorter(.clk(clk), .yellow(yellow));



/////////////////////////////////////////////////////////////////
 wire line0 = (((CounterX>=325)&(CounterX<=326))&(CounterY == 0));
	wire line1 = (((CounterX>=321)&(CounterX<=329))&(CounterY == 1));
	wire line2 = (((CounterX>=317)&(CounterX<=333))&(CounterY == 2));
	wire line3 = (((CounterX>=315)&(CounterX<=335))&(CounterY == 3));
	wire line4 = (((CounterX>=311)&(CounterX<=339))&(CounterY == 4));
	wire line5 = (((CounterX>=307)&(CounterX<=343))&(CounterY == 5));
	wire line6 = (((CounterX>=303)&(CounterX<=347))&(CounterY == 6));
	wire line7 = (((CounterX>=301)&(CounterX<=349))&(CounterY == 7));
	wire line8 = (((CounterX>=297)&(CounterX<=353))&(CounterY == 8));
	wire line9 = (((CounterX>=293)&(CounterX<=357))&(CounterY == 9));
	wire line10 = (((CounterX>=291)&(CounterX<=359))&(CounterY == 10));
	wire line11 = (((CounterX>=287)&(CounterX<=363))&(CounterY == 11));
	wire line12 = (((CounterX>=283)&(CounterX<=367))&(CounterY == 12));
	wire line13 = (((CounterX>=281)&(CounterX<=369))&(CounterY == 13));
	wire line14 = (((CounterX>=277)&(CounterX<=373))&(CounterY == 14));
	wire line15 = (((CounterX>=275)&(CounterX<=375))&(CounterY == 15));
	wire line16 = (((CounterX>=275)&(CounterX<=375))&(CounterY == 16));
	wire line17 = (((CounterX>=275)&(CounterX<=375))&(CounterY == 17));
	wire line18 = (((CounterX>=275)&(CounterX<=375))&(CounterY == 18));
	wire line19 = (((CounterX>=275)&(CounterX<=375))&(CounterY == 19));
	wire line20 = (((CounterX>=275)&(CounterX<=375))&(CounterY == 20));
	wire line21 = (((CounterX>=275)&(CounterX<=375))&(CounterY == 21));
	wire line22 = (((CounterX>=275)&(CounterX<=375))&(CounterY == 22));
	wire line37 = (((CounterX>=275)&(CounterX<=375))&(CounterY == 37));
	wire line38 = (((CounterX>=275)&(CounterX<=375))&(CounterY == 38));
	wire line39 = (((CounterX>=275)&(CounterX<=375))&(CounterY == 39));
	wire line40 = (((CounterX>=275)&(CounterX<=375))&(CounterY == 40));
	wire line41 = (((CounterX>=275)&(CounterX<=375))&(CounterY == 41));
	wire line42 = (((CounterX>=275)&(CounterX<=375))&(CounterY == 42));
	wire line43 = (((CounterX>=275)&(CounterX<=375))&(CounterY == 43));
	wire line44 = (((CounterX>=275)&(CounterX<=375))&(CounterY == 44));
	wire line45 = (((CounterX>=277)&(CounterX<=373))&(CounterY == 45));
	wire line46 = (((CounterX>=281)&(CounterX<=369))&(CounterY == 46));
	wire line47 = (((CounterX>=283)&(CounterX<=367))&(CounterY == 47));
	wire line48 = (((CounterX>=287)&(CounterX<=363))&(CounterY == 48));
	wire line49 = (((CounterX>=291)&(CounterX<=359))&(CounterY == 49));
	wire line50 = (((CounterX>=293)&(CounterX<=357))&(CounterY == 50));
	wire line51 = (((CounterX>=297)&(CounterX<=353))&(CounterY == 51));
	wire line52 = (((CounterX>=301)&(CounterX<=349))&(CounterY == 52));
	wire line53 = (((CounterX>=303)&(CounterX<=347))&(CounterY == 53));
	wire line54 = (((CounterX>=307)&(CounterX<=343))&(CounterY == 54));
	wire line55 = (((CounterX>=311)&(CounterX<=339))&(CounterY == 55));
	wire line56 = (((CounterX>=315)&(CounterX<=335))&(CounterY == 56));
	wire line57 = (((CounterX>=317)&(CounterX<=333))&(CounterY == 57));
	wire line58 = (((CounterX>=321)&(CounterX<=329))&(CounterY == 58));
	wire line59 = (((CounterX>=325)&(CounterX<=326))&(CounterY == 59));

/////////////////////////////////////////////////////////////////
wire R = line0 | line1 | line2 | line3 | line4 | line5 | line6 | line7 | line8 | line9 | line10 | line11 | line12 | line13 | line14 | line15 | line16 | line17 | line18 | line19 | line20 | line21 | line22 | line37 | line38 | line39 | line40 | line41 | line42 | line43 | line44 | line45 | line46 | line47 | line48 | line49 | line50 | line51 | line52 | line53 | line54 | line55 | line56 | line57 | line58 | line59;
wire G = line0 | line1 | line2 | line3 | line4 | line5 | line6 | line7 | line8 | line9 | line10 | line11 | line12 | line13 | line14 | line15 | line16 | line17 | line18 | line19 | line20 | line21 | line22 | line37 | line38 | line39 | line40 | line41 | line42 | line43 | line44 | line45 | line46 | line47 | line48 | line49 | line50 | line51 | line52 | line53 | line54 | line55 | line56 | line57 | line58 | line59;
wire B = line0 | line1 | line2 | line3 | line4 | line5 | line6 | line7 | line8 | line9 | line10 | line11 | line12 | line13 | line14 | line15 | line16 | line17 | line18 | line19 | line20 | line21 | line22 | line37 | line38 | line39 | line40 | line41 | line42 | line43 | line44 | line45 | line46 | line47 | line48 | line49 | line50 | line51 | line52 | line53 | line54 | line55 | line56 | line57 | line58 | line59;

reg vga_R, vga_G, vga_B;
always @(posedge clk)
begin
	vga_R <= R & inDisplayArea;
	vga_G <= G & inDisplayArea;
	vga_B <= B & inDisplayArea;
end

endmodule