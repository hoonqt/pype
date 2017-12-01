/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module bannerdraw_3 (
    input clk,
    output reg out
  );
  
  
  
  wire [1-1:0] M_hvsync_vga_h_sync;
  wire [1-1:0] M_hvsync_vga_v_sync;
  wire [1-1:0] M_hvsync_inDisplayArea;
  wire [11-1:0] M_hvsync_CounterX;
  wire [9-1:0] M_hvsync_CounterY;
  hvsync_generator_1 hvsync (
    .clk(clk),
    .vga_h_sync(M_hvsync_vga_h_sync),
    .vga_v_sync(M_hvsync_vga_v_sync),
    .inDisplayArea(M_hvsync_inDisplayArea),
    .CounterX(M_hvsync_CounterX),
    .CounterY(M_hvsync_CounterY)
  );
  wire [57-1:0] M_part1_outdata;
  reg [8-1:0] M_part1_address;
  bannerpart1_9 part1 (
    .clk(clk),
    .address(M_part1_address),
    .outdata(M_part1_outdata)
  );
  wire [57-1:0] M_part2_outdata;
  reg [8-1:0] M_part2_address;
  bannerpart2_10 part2 (
    .clk(clk),
    .address(M_part2_address),
    .outdata(M_part2_outdata)
  );
  wire [70-1:0] M_word1_outdata;
  reg [5-1:0] M_word1_address;
  bannerword1_11 word1 (
    .clk(clk),
    .address(M_word1_address),
    .outdata(M_word1_outdata)
  );
  wire [71-1:0] M_word2_outdata;
  reg [5-1:0] M_word2_address;
  bannerword2_12 word2 (
    .clk(clk),
    .address(M_word2_address),
    .outdata(M_word2_outdata)
  );
  wire [70-1:0] M_word3_outdata;
  reg [5-1:0] M_word3_address;
  bannerword3_13 word3 (
    .clk(clk),
    .address(M_word3_address),
    .outdata(M_word3_outdata)
  );
  wire [71-1:0] M_word4_outdata;
  reg [5-1:0] M_word4_address;
  bannerword4_14 word4 (
    .clk(clk),
    .address(M_word4_address),
    .outdata(M_word4_outdata)
  );
  
  reg [10:0] counterh;
  
  reg [8:0] counterv;
  
  reg [56:0] fullcounter;
  
  reg [69:0] counter70;
  
  reg [70:0] counter71;
  
  always @* begin
    counterh = M_hvsync_CounterX;
    counterv = M_hvsync_CounterY;
    if (((counterh >= 9'h177 & counterh <= 9'h1e9)) & ((counterv >= 7'h78) & (counterv <= 8'hf8))) begin
      M_part1_address = counterv - 7'h78;
      M_part2_address = 1'h0;
      M_word1_address = 1'h0;
      M_word2_address = 1'h0;
      M_word3_address = 1'h0;
      M_word4_address = 1'h0;
      fullcounter = M_part1_outdata;
      out = fullcounter[(6'h38 - ((counterh - 9'h177) / 2'h2))*1+0-:1];
    end else begin
      if (((counterh >= 9'h1eb & counterh <= 10'h25d)) & ((counterv >= 7'h78) & (counterv <= 8'hf8))) begin
        M_word1_address = 1'h0;
        M_word2_address = 1'h0;
        M_word3_address = 1'h0;
        M_word4_address = 1'h0;
        M_part1_address = 1'h0;
        M_part2_address = counterv - 7'h78;
        fullcounter = M_part2_outdata;
        out = fullcounter[(6'h38 - ((counterh - 9'h1eb) / 2'h2))*1+0-:1];
      end else begin
        if (((counterh >= 9'h177 & counterh <= 10'h203)) & ((counterv >= 9'h10e) & (counterv <= 9'h11c))) begin
          M_word1_address = counterv - 9'h10e;
          M_word2_address = 1'h0;
          M_word3_address = 1'h0;
          M_word4_address = 1'h0;
          M_part1_address = 1'h0;
          M_part2_address = 1'h0;
          counter70 = M_word1_outdata;
          out = counter70[(7'h45 - ((counterh - 9'h177) / 2'h2))*1+0-:1];
        end else begin
          if (((counterh >= 10'h204 & counterh <= 10'h292)) & ((counterv >= 9'h10e) & (counterv <= 9'h11c))) begin
            M_word1_address = 1'h0;
            M_word2_address = counterv - 9'h10e;
            M_word3_address = 1'h0;
            M_word4_address = 1'h0;
            M_part1_address = 1'h0;
            M_part2_address = 1'h0;
            counter71 = M_word2_outdata;
            out = counter71[(7'h46 - ((counterh - 10'h204) / 2'h2))*1+0-:1];
          end else begin
            if (((counterh >= 10'h293 & counterh <= 10'h31f)) & ((counterv >= 9'h10e) & (counterv <= 9'h11c))) begin
              M_word1_address = 1'h0;
              M_word2_address = 1'h0;
              M_word3_address = counterv - 9'h10e;
              M_word4_address = 1'h0;
              M_part1_address = 1'h0;
              M_part2_address = 1'h0;
              counter70 = M_word3_outdata;
              out = counter70[(7'h45 - ((counterh - 10'h293) / 2'h2))*1+0-:1];
            end else begin
              if (((counterh >= 10'h31d & counterh <= 10'h3ae)) & ((counterv >= 9'h10e) & (counterv <= 9'h11c))) begin
                M_word1_address = 1'h0;
                M_word2_address = 1'h0;
                M_word3_address = 1'h0;
                M_word4_address = counterv - 9'h10e;
                M_part1_address = 1'h0;
                M_part2_address = 1'h0;
                counter71 = M_word4_outdata;
                out = counter71[(7'h46 - ((counterh - 10'h31d) / 2'h2))*1+0-:1];
              end else begin
                M_part1_address = 1'h0;
                M_part2_address = 1'h0;
                M_word1_address = 1'h0;
                M_word2_address = 1'h0;
                M_word3_address = 1'h0;
                M_word4_address = 1'h0;
                out = 1'h0;
              end
            end
          end
        end
      end
    end
  end
endmodule
