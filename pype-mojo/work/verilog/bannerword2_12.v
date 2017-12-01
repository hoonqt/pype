module bannerword2_12 (
    input clk,  // clock
    input wire [4:0] address,  // reset
    output reg [70:0] outdata
  );
  
  (* rom_style = "block" *)
  
  reg [4:0] address_reg;

  /* Combinational Logic */
  always @* begin
    case(address_reg)
    0: outdata = 71'b11111000000111111000000111000111000000000000111111000000111000111000111;
    1: outdata = 71'b11111000000111111000000111000111000000000000111111000000111000111000111;
    2: outdata = 71'b11111000000111111000000111000111000000000000111111000000111000111000111;
    3: outdata = 71'b11000111000111000111000111000111000000000000111000111000111000111000000;
    4: outdata = 71'b11000111000111000111000111000111000000000000111000111000111000111000000;
    5: outdata = 71'b11000111000111000111000111000111000000000000111000111000111000111000000;
    6: outdata = 71'b11111111000111000111000000111000000000000000111111000000111000111000000;
    7: outdata = 71'b11111111000111000111000000111000000000000000111111000000111000111000000;
    8: outdata = 71'b11111111000111000111000000111000000000000000111111000000111000111000000;
    9: outdata = 71'b11000111000111000111000000111000000000000000111000111000111000111000000;
    10: outdata = 71'b11000111000111000111000000111000000000000000111000111000111000111000000;
    11: outdata = 71'b11000111000111000111000000111000000000000000111000111000111000111000000;
    12: outdata = 71'b11000111000111000111000000111000000000000000111111111000000111111000000;
    13: outdata = 71'b11000111000111000111000000111000000000000000111111111000000111111000000;
    14: outdata = 71'b11000111000111000111000000111000000000000000111111111000000111111000000;
    default: outdata = 0;
    endcase
  end
  
  /* Sequential Logic */
  always @(posedge clk) begin
    address_reg <= address;
  end
  
endmodule
