// Pong VGA game
// (c) fpga4fun.com

module mojo_top_0(clk, vga_h_sync, vga_v_sync, vga_R, vga_G, vga_B, quadA, quadB);
input clk;
output vga_h_sync, vga_v_sync, vga_R, vga_G, vga_B;
input quadA, quadB;

wire inDisplayArea;
wire [10:0] CounterX;
wire [8:0] CounterY;

hvsync_generator_1 syncgen(.clk(clk), .vga_h_sync(vga_h_sync), .vga_v_sync(vga_v_sync), 
  .inDisplayArea(inDisplayArea), .CounterX(CounterX), .CounterY(CounterY));

/////////////////////////////////////////////////////////////////
reg [8:0] PaddlePosition;
reg [2:0] quadAr, quadBr;
always @(posedge clk) quadAr <= {quadAr[1:0], quadA};
always @(posedge clk) quadBr <= {quadBr[1:0], quadB};

always @(posedge clk)
if(quadAr[2] ^ quadAr[1] ^ quadBr[2] ^ quadBr[1])
begin
	if(quadAr[2] ^ quadBr[1])
	begin
		if(~&PaddlePosition)        // make sure the value doesn't overflow
			PaddlePosition <= PaddlePosition + 1;
	end
	else
	begin
		if(|PaddlePosition)        // make sure the value doesn't underflow
			PaddlePosition <= PaddlePosition - 1;
	end
end

/////////////////////////////////////////////////////////////////
reg [10:0] ballX;
reg [8:0] ballY;
reg ball_inX, ball_inY;

always @(posedge clk)
if(ball_inX==0) ball_inX <= (CounterX==ballX) & ball_inY; else ball_inX <= !(CounterX==ballX+32);

always @(posedge clk)
if(ball_inY==0) ball_inY <= (CounterY==ballY); else ball_inY <= !(CounterY==ballY+16);

wire ball = ball_inX & ball_inY;

/////////////////////////////////////////////////////////////////
wire border = (CounterX[10:4]==0) || (CounterX[10:4]==79) || (CounterY[8:3]==0) || (CounterY[8:3]==59);
wire paddle = (CounterX>=PaddlePosition+16) && (CounterX<=PaddlePosition+240) && (CounterY[8:4]==27);
wire BouncingObject = border | paddle; // active if the border or paddle is redrawing itself

wire line1 = (((CounterX >= 293) & (CounterX <= 293)) ) & ((CounterY == 251));
wire line2 = (((CounterX >= 291) & (CounterX <= 292)) |((CounterX >= 294) & (CounterX <= 295)) ) & ((CounterY == 252));
wire line3 = (((CounterX >= 289) & (CounterX <= 290)) |((CounterX >= 296) & (CounterX <= 297)) ) & ((CounterY == 253));
wire line4 = (((CounterX >= 287) & (CounterX <= 288)) |((CounterX >= 298) & (CounterX <= 299)) ) & ((CounterY == 254));
wire line5 = (((CounterX >= 286) & (CounterX <= 286)) |((CounterX >= 300) & (CounterX <= 300)) ) & ((CounterY == 255));
wire line6 = (((CounterX >= 284) & (CounterX <= 285)) |((CounterX >= 301) & (CounterX <= 302)) ) & ((CounterY == 256));
wire line7 = (((CounterX >= 282) & (CounterX <= 283)) |((CounterX >= 303) & (CounterX <= 304)) ) & ((CounterY == 257));
wire line8 = (((CounterX >= 281) & (CounterX <= 281)) |((CounterX >= 305) & (CounterX <= 305)) ) & ((CounterY == 258));
wire line9 = (((CounterX >= 279) & (CounterX <= 280)) |((CounterX >= 306) & (CounterX <= 307)) ) & ((CounterY == 259));
wire line10 = (((CounterX >= 277) & (CounterX <= 278)) |((CounterX >= 281) & (CounterX <= 281)) |((CounterX >= 308) & (CounterX <= 309)) ) & ((CounterY == 260));
wire line11 = (((CounterX >= 275) & (CounterX <= 276)) |((CounterX >= 281) & (CounterX <= 282)) |((CounterX >= 310) & (CounterX <= 311)) ) & ((CounterY == 261));
wire line12 = (((CounterX >= 274) & (CounterX <= 274)) |((CounterX >= 282) & (CounterX <= 282)) |((CounterX >= 312) & (CounterX <= 312)) ) & ((CounterY == 262));
wire line13 = (((CounterX >= 272) & (CounterX <= 273)) |((CounterX >= 283) & (CounterX <= 283)) |((CounterX >= 313) & (CounterX <= 314)) ) & ((CounterY == 263));
wire line14 = (((CounterX >= 270) & (CounterX <= 271)) |((CounterX >= 284) & (CounterX <= 284)) |((CounterX >= 315) & (CounterX <= 316)) ) & ((CounterY == 264));
wire line15 = (((CounterX >= 269) & (CounterX <= 269)) |((CounterX >= 284) & (CounterX <= 285)) |((CounterX >= 317) & (CounterX <= 317)) ) & ((CounterY == 265));
wire line16 = (((CounterX >= 267) & (CounterX <= 268)) |((CounterX >= 285) & (CounterX <= 285)) |((CounterX >= 318) & (CounterX <= 319)) ) & ((CounterY == 266));
wire line17 = (((CounterX >= 265) & (CounterX <= 266)) |((CounterX >= 286) & (CounterX <= 286)) |((CounterX >= 320) & (CounterX <= 321)) ) & ((CounterY == 267));
wire line18 = (((CounterX >= 263) & (CounterX <= 264)) |((CounterX >= 286) & (CounterX <= 286)) |((CounterX >= 322) & (CounterX <= 323)) ) & ((CounterY == 268));
wire line19 = (((CounterX >= 262) & (CounterX <= 262)) |((CounterX >= 286) & (CounterX <= 287)) |((CounterX >= 324) & (CounterX <= 324)) ) & ((CounterY == 269));
wire line20 = (((CounterX >= 260) & (CounterX <= 262)) |((CounterX >= 287) & (CounterX <= 287)) |((CounterX >= 325) & (CounterX <= 326)) ) & ((CounterY == 270));
wire line21 = (((CounterX >= 258) & (CounterX <= 259)) |((CounterX >= 262) & (CounterX <= 262)) |((CounterX >= 287) & (CounterX <= 288)) |((CounterX >= 327) & (CounterX <= 328)) ) & ((CounterY == 271));
wire line22 = (((CounterX >= 257) & (CounterX <= 257)) |((CounterX >= 262) & (CounterX <= 263)) |((CounterX >= 288) & (CounterX <= 288)) |((CounterX >= 329) & (CounterX <= 329)) ) & ((CounterY == 272));
wire line23 = (((CounterX >= 255) & (CounterX <= 256)) |((CounterX >= 263) & (CounterX <= 263)) |((CounterX >= 289) & (CounterX <= 289)) |((CounterX >= 330) & (CounterX <= 331)) ) & ((CounterY == 273));
wire line24 = (((CounterX >= 253) & (CounterX <= 254)) |((CounterX >= 263) & (CounterX <= 263)) |((CounterX >= 290) & (CounterX <= 290)) |((CounterX >= 332) & (CounterX <= 333)) ) & ((CounterY == 274));
wire line25 = (((CounterX >= 251) & (CounterX <= 252)) |((CounterX >= 263) & (CounterX <= 264)) |((CounterX >= 290) & (CounterX <= 291)) |((CounterX >= 334) & (CounterX <= 335)) ) & ((CounterY == 275));
wire line26 = (((CounterX >= 250) & (CounterX <= 250)) |((CounterX >= 264) & (CounterX <= 265)) |((CounterX >= 291) & (CounterX <= 292)) | ((CounterX >= 336) & (CounterX <= 336))) & ((CounterY == 276));
wire line27 = (((CounterX >= 250) & (CounterX <= 250)) |((CounterX >= 265) & (CounterX <= 265)) |((CounterX >= 292) & (CounterX <= 293)) | ((CounterX >= 336) & (CounterX <= 336))) & ((CounterY == 277));
wire line28 = (((CounterX >= 250) & (CounterX <= 250)) |((CounterX >= 266) & (CounterX <= 266)) |((CounterX >= 293) & (CounterX <= 294)) | ((CounterX >= 336) & (CounterX <= 336))) & ((CounterY == 278));
wire line29 = (((CounterX >= 250) & (CounterX <= 250)) |((CounterX >= 266) & (CounterX <= 267)) |((CounterX >= 294) & (CounterX <= 294)) | ((CounterX >= 336) & (CounterX <= 336))) & ((CounterY == 279));
wire line30 = (((CounterX >= 250) & (CounterX <= 250)) |((CounterX >= 267) & (CounterX <= 267)) |((CounterX >= 295) & (CounterX <= 295)) | ((CounterX >= 336) & (CounterX <= 336))) & ((CounterY == 280));
wire line31 = (((CounterX >= 250) & (CounterX <= 250)) |((CounterX >= 268) & (CounterX <= 268)) |((CounterX >= 295) & (CounterX <= 295)) | ((CounterX >= 336) & (CounterX <= 336))) & ((CounterY == 281));
wire line32 = (((CounterX >= 250) & (CounterX <= 250)) |((CounterX >= 268) & (CounterX <= 269)) |((CounterX >= 295) & (CounterX <= 296)) | ((CounterX >= 336) & (CounterX <= 336))) & ((CounterY == 282));
wire line33 = (((CounterX >= 250) & (CounterX <= 250)) |((CounterX >= 269) & (CounterX <= 269)) |((CounterX >= 296) & (CounterX <= 296)) | ((CounterX >= 336) & (CounterX <= 336))) & ((CounterY == 283));
wire line34 = (((CounterX >= 250) & (CounterX <= 250)) |((CounterX >= 270) & (CounterX <= 270)) |((CounterX >= 297) & (CounterX <= 297)) | ((CounterX >= 336) & (CounterX <= 336))) & ((CounterY == 284));
wire line35 = (((CounterX >= 250) & (CounterX <= 250)) |((CounterX >= 270) & (CounterX <= 271)) |((CounterX >= 297) & (CounterX <= 298)) | ((CounterX >= 336) & (CounterX <= 336))) & ((CounterY == 285));
wire line36 = (((CounterX >= 250) & (CounterX <= 250)) |((CounterX >= 271) & (CounterX <= 271)) |((CounterX >= 298) & (CounterX <= 298)) | ((CounterX >= 336) & (CounterX <= 336))) & ((CounterY == 286));
wire line37 = (((CounterX >= 250) & (CounterX <= 250)) |((CounterX >= 271) & (CounterX <= 271)) |((CounterX >= 299) & (CounterX <= 299)) | ((CounterX >= 336) & (CounterX <= 336))) & ((CounterY == 287));
wire line38 = (((CounterX >= 250) & (CounterX <= 250)) |((CounterX >= 271) & (CounterX <= 272)) |((CounterX >= 300) & (CounterX <= 300)) | ((CounterX >= 336) & (CounterX <= 336))) & ((CounterY == 288));
wire line39 = (((CounterX >= 250) & (CounterX <= 250)) |((CounterX >= 272) & (CounterX <= 272)) |((CounterX >= 300) & (CounterX <= 301)) | ((CounterX >= 336) & (CounterX <= 336))) & ((CounterY == 289));
wire line40 = (((CounterX >= 250) & (CounterX <= 250)) |((CounterX >= 272) & (CounterX <= 272)) |((CounterX >= 301) & (CounterX <= 301)) | ((CounterX >= 336) & (CounterX <= 336))) & ((CounterY == 290));
wire line41 = (((CounterX >= 250) & (CounterX <= 250)) |((CounterX >= 273) & (CounterX <= 273)) |((CounterX >= 302) & (CounterX <= 302)) | ((CounterX >= 336) & (CounterX <= 336))) & ((CounterY == 291));
wire line42 = (((CounterX >= 250) & (CounterX <= 250)) |((CounterX >= 273) & (CounterX <= 273)) |((CounterX >= 303) & (CounterX <= 303)) | ((CounterX >= 336) & (CounterX <= 336))) & ((CounterY == 292));
wire line43 = (((CounterX >= 250) & (CounterX <= 250)) |((CounterX >= 273) & (CounterX <= 274)) |((CounterX >= 303) & (CounterX <= 304)) | ((CounterX >= 336) & (CounterX <= 336))) & ((CounterY == 293));
wire line44 = (((CounterX >= 250) & (CounterX <= 250)) |((CounterX >= 274) & (CounterX <= 274)) |((CounterX >= 304) & (CounterX <= 304)) | ((CounterX >= 336) & (CounterX <= 336))) & ((CounterY == 294));
wire line45 = (((CounterX >= 250) & (CounterX <= 250)) |((CounterX >= 275) & (CounterX <= 275)) |((CounterX >= 304) & (CounterX <= 305)) | ((CounterX >= 336) & (CounterX <= 336))) & ((CounterY == 295));
wire line46 = (((CounterX >= 250) & (CounterX <= 250)) |((CounterX >= 275) & (CounterX <= 276)) |((CounterX >= 305) & (CounterX <= 305)) | ((CounterX >= 336) & (CounterX <= 336))) & ((CounterY == 296));
wire line47 = (((CounterX >= 250) & (CounterX <= 250)) |((CounterX >= 276) & (CounterX <= 276)) |((CounterX >= 305) & (CounterX <= 305)) | ((CounterX >= 336) & (CounterX <= 336))) & ((CounterY == 297));
wire line48 = (((CounterX >= 250) & (CounterX <= 250)) |((CounterX >= 277) & (CounterX <= 277)) |((CounterX >= 306) & (CounterX <= 306)) | ((CounterX >= 336) & (CounterX <= 336))) & ((CounterY == 298));
wire line49 = (((CounterX >= 250) & (CounterX <= 250)) |((CounterX >= 277) & (CounterX <= 278)) |((CounterX >= 306) & (CounterX <= 306)) | ((CounterX >= 336) & (CounterX <= 336))) & ((CounterY == 299));
wire line50 = (((CounterX >= 250) & (CounterX <= 250)) |((CounterX >= 278) & (CounterX <= 279)) |((CounterX >= 306) & (CounterX <= 307)) | ((CounterX >= 336) & (CounterX <= 336))) & ((CounterY == 300));
wire line51 = (((CounterX >= 250) & (CounterX <= 250)) |((CounterX >= 280) & (CounterX <= 280)) |((CounterX >= 307) & (CounterX <= 307)) | ((CounterX >= 336) & (CounterX <= 336))) & ((CounterY == 301));
wire line52 = (((CounterX >= 250) & (CounterX <= 250)) |((CounterX >= 280) & (CounterX <= 280)) |((CounterX >= 308) & (CounterX <= 308)) | ((CounterX >= 336) & (CounterX <= 336))) & ((CounterY == 302));
wire line53 = (((CounterX >= 250) & (CounterX <= 250)) |((CounterX >= 281) & (CounterX <= 282)) |((CounterX >= 308) & (CounterX <= 309)) | ((CounterX >= 336) & (CounterX <= 336))) & ((CounterY == 303));
wire line54 = (((CounterX >= 250) & (CounterX <= 250)) |((CounterX >= 282) & (CounterX <= 283)) |((CounterX >= 309) & (CounterX <= 310)) | ((CounterX >= 336) & (CounterX <= 336))) & ((CounterY == 304));
wire line55 = (((CounterX >= 250) & (CounterX <= 250)) |((CounterX >= 283) & (CounterX <= 283)) |((CounterX >= 310) & (CounterX <= 310)) | ((CounterX >= 336) & (CounterX <= 336))) & ((CounterY == 305));
wire line56 = (((CounterX >= 250) & (CounterX <= 250)) |((CounterX >= 283) & (CounterX <= 283)) |((CounterX >= 311) & (CounterX <= 311)) | ((CounterX >= 336) & (CounterX <= 336))) & ((CounterY == 306));
wire line57 = (((CounterX >= 250) & (CounterX <= 250)) |((CounterX >= 284) & (CounterX <= 284)) |((CounterX >= 312) & (CounterX <= 312)) | ((CounterX >= 336) & (CounterX <= 336))) & ((CounterY == 307));
wire line58 = (((CounterX >= 250) & (CounterX <= 250)) |((CounterX >= 285) & (CounterX <= 285)) |((CounterX >= 312) & (CounterX <= 313)) | ((CounterX >= 336) & (CounterX <= 336))) & ((CounterY == 308));
wire line59 = (((CounterX >= 250) & (CounterX <= 250)) |((CounterX >= 285) & (CounterX <= 286)) |((CounterX >= 313) & (CounterX <= 313)) | ((CounterX >= 336) & (CounterX <= 336))) & ((CounterY == 309));
wire line60 = (((CounterX >= 250) & (CounterX <= 250)) |((CounterX >= 286) & (CounterX <= 287)) |((CounterX >= 313) & (CounterX <= 313)) | ((CounterX >= 336) & (CounterX <= 336))) & ((CounterY == 310));
wire line61 = (((CounterX >= 250) & (CounterX <= 250)) |((CounterX >= 287) & (CounterX <= 287)) |((CounterX >= 314) & (CounterX <= 314)) | ((CounterX >= 336) & (CounterX <= 336))) & ((CounterY == 311));
wire line62 = (((CounterX >= 250) & (CounterX <= 250)) |((CounterX >= 287) & (CounterX <= 288)) |((CounterX >= 314) & (CounterX <= 314)) | ((CounterX >= 336) & (CounterX <= 336))) & ((CounterY == 312));
wire line63 = (((CounterX >= 250) & (CounterX <= 250)) |((CounterX >= 288) & (CounterX <= 288)) |((CounterX >= 314) & (CounterX <= 315)) | ((CounterX >= 336) & (CounterX <= 336))) & ((CounterY == 313));
wire line64 = (((CounterX >= 250) & (CounterX <= 250)) |((CounterX >= 288) & (CounterX <= 289)) |((CounterX >= 315) & (CounterX <= 315)) | ((CounterX >= 336) & (CounterX <= 336))) & ((CounterY == 314));
wire line65 = (((CounterX >= 250) & (CounterX <= 250)) |((CounterX >= 289) & (CounterX <= 289)) |((CounterX >= 315) & (CounterX <= 315)) | ((CounterX >= 336) & (CounterX <= 336))) & ((CounterY == 315));
wire line66 = (((CounterX >= 250) & (CounterX <= 250)) |((CounterX >= 290) & (CounterX <= 290)) |((CounterX >= 315) & (CounterX <= 316)) | ((CounterX >= 336) & (CounterX <= 336))) & ((CounterY == 316));
wire line67 = (((CounterX >= 250) & (CounterX <= 250)) |((CounterX >= 290) & (CounterX <= 291)) |((CounterX >= 316) & (CounterX <= 316)) | ((CounterX >= 336) & (CounterX <= 336))) & ((CounterY == 317));
wire line68 = (((CounterX >= 250) & (CounterX <= 250)) |((CounterX >= 291) & (CounterX <= 291)) |((CounterX >= 316) & (CounterX <= 317)) | ((CounterX >= 336) & (CounterX <= 336))) & ((CounterY == 318));
wire line69 = (((CounterX >= 250) & (CounterX <= 250)) |((CounterX >= 291) & (CounterX <= 292)) |((CounterX >= 317) & (CounterX <= 317)) | ((CounterX >= 336) & (CounterX <= 336))) & ((CounterY == 319));
wire line70 = (((CounterX >= 250) & (CounterX <= 250)) |((CounterX >= 292) & (CounterX <= 292)) |((CounterX >= 318) & (CounterX <= 318)) | ((CounterX >= 336) & (CounterX <= 336))) & ((CounterY == 320));
wire line71 = (((CounterX >= 250) & (CounterX <= 250)) |((CounterX >= 292) & (CounterX <= 293)) |((CounterX >= 318) & (CounterX <= 319)) | ((CounterX >= 336) & (CounterX <= 336))) & ((CounterY == 321));
wire line72 = (((CounterX >= 250) & (CounterX <= 250)) |((CounterX >= 293) & (CounterX <= 293)) |((CounterX >= 319) & (CounterX <= 319)) | ((CounterX >= 336) & (CounterX <= 336))) & ((CounterY == 322));
wire line73 = (((CounterX >= 250) & (CounterX <= 250)) |((CounterX >= 293) & (CounterX <= 293)) |((CounterX >= 320) & (CounterX <= 320)) | ((CounterX >= 336) & (CounterX <= 336))) & ((CounterY == 323));
wire line74 = (((CounterX >= 250) & (CounterX <= 250)) |((CounterX >= 294) & (CounterX <= 294)) |((CounterX >= 320) & (CounterX <= 320)) | ((CounterX >= 336) & (CounterX <= 336))) & ((CounterY == 324));
wire line75 = (((CounterX >= 250) & (CounterX <= 250)) |((CounterX >= 294) & (CounterX <= 294)) |((CounterX >= 320) & (CounterX <= 321)) | ((CounterX >= 336) & (CounterX <= 336))) & ((CounterY == 325));
wire line76 = (((CounterX >= 251) & (CounterX <= 252)) |((CounterX >= 294) & (CounterX <= 295)) |((CounterX >= 321) & (CounterX <= 321)) |((CounterX >= 334) & (CounterX <= 335)) ) & ((CounterY == 326));
wire line77 = (((CounterX >= 253) & (CounterX <= 254)) |((CounterX >= 295) & (CounterX <= 296)) |((CounterX >= 321) & (CounterX <= 322)) |((CounterX >= 332) & (CounterX <= 333)) ) & ((CounterY == 327));
wire line78 = (((CounterX >= 255) & (CounterX <= 256)) |((CounterX >= 296) & (CounterX <= 297)) |((CounterX >= 322) & (CounterX <= 322)) |((CounterX >= 330) & (CounterX <= 331)) ) & ((CounterY == 328));
wire line79 = (((CounterX >= 257) & (CounterX <= 257)) |((CounterX >= 297) & (CounterX <= 297)) |((CounterX >= 322) & (CounterX <= 323)) |((CounterX >= 329) & (CounterX <= 329)) ) & ((CounterY == 329));
wire line80 = (((CounterX >= 258) & (CounterX <= 259)) |((CounterX >= 297) & (CounterX <= 298)) |((CounterX >= 323) & (CounterX <= 323)) |((CounterX >= 327) & (CounterX <= 328)) ) & ((CounterY == 330));
wire line81 = (((CounterX >= 260) & (CounterX <= 261)) |((CounterX >= 298) & (CounterX <= 299)) |((CounterX >= 323) & (CounterX <= 326)) ) & ((CounterY == 331));
wire line82 = (((CounterX >= 262) & (CounterX <= 262)) |((CounterX >= 299) & (CounterX <= 299)) |((CounterX >= 324) & (CounterX <= 324)) ) & ((CounterY == 332));
wire line83 = (((CounterX >= 263) & (CounterX <= 264)) |((CounterX >= 299) & (CounterX <= 300)) |((CounterX >= 322) & (CounterX <= 323)) ) & ((CounterY == 333));
wire line84 = (((CounterX >= 265) & (CounterX <= 266)) |((CounterX >= 300) & (CounterX <= 300)) |((CounterX >= 320) & (CounterX <= 321)) ) & ((CounterY == 334));
wire line85 = (((CounterX >= 267) & (CounterX <= 268)) |((CounterX >= 301) & (CounterX <= 301)) |((CounterX >= 318) & (CounterX <= 319)) ) & ((CounterY == 335));
wire line86 = (((CounterX >= 269) & (CounterX <= 269)) |((CounterX >= 302) & (CounterX <= 302)) |((CounterX >= 317) & (CounterX <= 317)) ) & ((CounterY == 336));
wire line87 = (((CounterX >= 270) & (CounterX <= 271)) |((CounterX >= 302) & (CounterX <= 303)) |((CounterX >= 315) & (CounterX <= 316)) ) & ((CounterY == 337));
wire line88 = (((CounterX >= 272) & (CounterX <= 273)) |((CounterX >= 303) & (CounterX <= 304)) |((CounterX >= 313) & (CounterX <= 314)) ) & ((CounterY == 338));
wire line89 = (((CounterX >= 274) & (CounterX <= 274)) |((CounterX >= 304) & (CounterX <= 304)) |((CounterX >= 312) & (CounterX <= 312)) ) & ((CounterY == 339));
wire line90 = (((CounterX >= 275) & (CounterX <= 276)) |((CounterX >= 304) & (CounterX <= 305)) |((CounterX >= 310) & (CounterX <= 311)) ) & ((CounterY == 340));
wire line91 = (((CounterX >= 277) & (CounterX <= 278)) |((CounterX >= 305) & (CounterX <= 305)) |((CounterX >= 308) & (CounterX <= 309)) ) & ((CounterY == 341));
wire line92 = (((CounterX >= 279) & (CounterX <= 280)) |((CounterX >= 305) & (CounterX <= 307)) ) & ((CounterY == 342));
wire line93 = (((CounterX >= 281) & (CounterX <= 281)) |((CounterX >= 305) & (CounterX <= 306)) ) & ((CounterY == 343));
wire line94 = (((CounterX >= 282) & (CounterX <= 283)) |((CounterX >= 303) & (CounterX <= 304)) ) & ((CounterY == 344));
wire line95 = (((CounterX >= 284) & (CounterX <= 285)) |((CounterX >= 301) & (CounterX <= 302)) ) & ((CounterY == 345));
wire line96 = (((CounterX >= 286) & (CounterX <= 286)) |((CounterX >= 300) & (CounterX <= 300)) ) & ((CounterY == 346));
wire line97 = (((CounterX >= 287) & (CounterX <= 288)) |((CounterX >= 298) & (CounterX <= 299)) ) & ((CounterY == 347));
wire line98 = (((CounterX >= 289) & (CounterX <= 290)) |((CounterX >= 296) & (CounterX <= 297)) ) & ((CounterY == 348));
wire line99 = (((CounterX >= 291) & (CounterX <= 292)) |((CounterX >= 294) & (CounterX <= 295)) ) & ((CounterY == 349));
wire line100 = (((CounterX >= 293) & (CounterX <= 293)) ) & ((CounterY == 350));

reg ResetCollision;
always @(posedge clk) ResetCollision <= (CounterY==500) & (CounterX==0);  // active only once for every video frame

reg CollisionX1, CollisionX2, CollisionY1, CollisionY2;
always @(posedge clk) if(ResetCollision) CollisionX1<=0; else if(BouncingObject & (CounterX==ballX   ) & (CounterY==ballY+ 8)) CollisionX1<=1;
always @(posedge clk) if(ResetCollision) CollisionX2<=0; else if(BouncingObject & (CounterX==ballX+32) & (CounterY==ballY+ 8)) CollisionX2<=1;
always @(posedge clk) if(ResetCollision) CollisionY1<=0; else if(BouncingObject & (CounterX==ballX+ 16) & (CounterY==ballY   )) CollisionY1<=1;
always @(posedge clk) if(ResetCollision) CollisionY2<=0; else if(BouncingObject & (CounterX==ballX+ 16) & (CounterY==ballY+16)) CollisionY2<=1;

/////////////////////////////////////////////////////////////////
wire UpdateBallPosition = ResetCollision;  // update the ball position at the same time that we reset the collision detectors

reg ball_dirX, ball_dirY;
always @(posedge clk)
if(UpdateBallPosition)
begin
	if(~(CollisionX1 & CollisionX2))        // if collision on both X-sides, don't move in the X direction
	begin
		ballX <= ballX + (ball_dirX ? -1 : 1);
		if(CollisionX2) ball_dirX <= 1; else if(CollisionX1) ball_dirX <= 0;
	end

	if(~(CollisionY1 & CollisionY2))        // if collision on both Y-sides, don't move in the Y direction
	begin
		ballY <= ballY + (ball_dirY ? -1 : 1);
		if(CollisionY2) ball_dirY <= 1; else if(CollisionY1) ball_dirY <= 0;
	end
end 

/////////////////////////////////////////////////////////////////
wire R = line1 | line2 | line3 | line4 | line5 | line6 | line7 | line8 | line9 | line10 | line11 | line12 | line13 | line14 | line15 | line16 | line17 | line18 | line19 | line20 | line21 | line22 | line23 | line24 | line25 | line26 | line27 | line28 | line29 | line30 | line31 | line32 | line33 | line34 | line35 | line36 | line37 | line38 | line39 | line40 | line41 | line42 | line43 | line44 | line45 | line46 | line47 | line48 | line49 | line50 | line51 | line52 | line53 | line54 | line55 | line56 | line57 | line58 | line59 | line60 | line61 | line62 | line63 | line64 | line65 | line66 | line67 | line68 | line69 | line70 | line71 | line72 | line73 | line74 | line75 | line76 | line77 | line78 | line79 | line80 | line81 | line82 | line83 | line84 | line85 | line86 | line87 | line88 | line89 | line90 | line91 | line92 | line93 | line94 | line95 | line96 | line97 | line98 | line99 | line100;
wire G = line1 | line2 | line3 | line4 | line5 | line6 | line7 | line8 | line9 | line10 | line11 | line12 | line13 | line14 | line15 | line16 | line17 | line18 | line19 | line20 | line21 | line22 | line23 | line24 | line25 | line26 | line27 | line28 | line29 | line30 | line31 | line32 | line33 | line34 | line35 | line36 | line37 | line38 | line39 | line40 | line41 | line42 | line43 | line44 | line45 | line46 | line47 | line48 | line49 | line50 | line51 | line52 | line53 | line54 | line55 | line56 | line57 | line58 | line59 | line60 | line61 | line62 | line63 | line64 | line65 | line66 | line67 | line68 | line69 | line70 | line71 | line72 | line73 | line74 | line75 | line76 | line77 | line78 | line79 | line80 | line81 | line82 | line83 | line84 | line85 | line86 | line87 | line88 | line89 | line90 | line91 | line92 | line93 | line94 | line95 | line96 | line97 | line98 | line99 | line100;
wire B = line1 | line2 | line3 | line4 | line5 | line6 | line7 | line8 | line9 | line10 | line11 | line12 | line13 | line14 | line15 | line16 | line17 | line18 | line19 | line20 | line21 | line22 | line23 | line24 | line25 | line26 | line27 | line28 | line29 | line30 | line31 | line32 | line33 | line34 | line35 | line36 | line37 | line38 | line39 | line40 | line41 | line42 | line43 | line44 | line45 | line46 | line47 | line48 | line49 | line50 | line51 | line52 | line53 | line54 | line55 | line56 | line57 | line58 | line59 | line60 | line61 | line62 | line63 | line64 | line65 | line66 | line67 | line68 | line69 | line70 | line71 | line72 | line73 | line74 | line75 | line76 | line77 | line78 | line79 | line80 | line81 | line82 | line83 | line84 | line85 | line86 | line87 | line88 | line89 | line90 | line91 | line92 | line93 | line94 | line95 | line96 | line97 | line98 | line99 | line100;

reg vga_R, vga_G, vga_B;
always @(posedge clk)
begin
	vga_R <= R & inDisplayArea;
	vga_G <= G & inDisplayArea;
	vga_B <= B & inDisplayArea;
end

endmodule