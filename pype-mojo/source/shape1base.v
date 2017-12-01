module shape1base (
    input wire clk,  // clock
    input [3:0] orientation,
    input wire[5:0] address,
    output reg [50:0] outdata
  );
  
  (* rom_style = "block" *)
  
  reg [5:0] address_reg;

  /* Combinational Logic */
  always @* begin
    case(orientation)
    0:case (address_reg)
        0: outdata = 51'b000000000000000000000000010000000000000000000000000;
        1: outdata = 51'b000000000000000000000001111100000000000000000000000;
        2: outdata = 51'b000000000000000000000111111111000000000000000000000;
        3: outdata = 51'b000000000000000000001111111111100000000000000000000;
        4: outdata = 51'b000000000000000000111111111111111000000000000000000;
        5: outdata = 51'b000000000000000011111111111111111110000000000000000;
        6: outdata = 51'b000000000000001111111111111111111111100000000000000;
        7: outdata = 51'b000000000000011111111111111111111111110000000000000;
        8: outdata = 51'b000000000001111111111111111111111111111100000000000;
        9: outdata = 51'b000000000111111111111111111111111111111111000000000;
        10: outdata = 51'b000000001111111111111111111111111111111111100000000;
        11: outdata = 51'b000000111111111111111111111111111111111111111000000;
        12: outdata = 51'b000011111111111111111111111111111111111111111110000;
        13: outdata = 51'b000111111111111111111111111111111111111111111111000;
        14: outdata = 51'b011111111111111111111111111111111111111111111111110;
        15: outdata = 51'b111111111111111111111111111111111111111111111111111;
        16: outdata = 51'b111111111111111111111111111111111111111111111111111;
        17: outdata = 51'b111111111111111111111111111111111111111111111111111;
        18: outdata = 51'b111111111111111111111111111111111111111111111111111;
        19: outdata = 51'b111111111111111111111111111111111111111111111111111;
        20: outdata = 51'b111111111111111111111111111111111111111111111111111;
        21: outdata = 51'b111111111111111111111111111111111111111111111111111;
        22: outdata = 51'b111111111111111111111111111111111111111111111111111;
        23: outdata = 51'b000000000000000000000000000000000000000000000000000;
        24: outdata = 51'b000000000000000000000000000000000000000000000000000;
        25: outdata = 51'b000000000000000000000000000000000000000000000000000;
        26: outdata = 51'b000000000000000000000000000000000000000000000000000;
        27: outdata = 51'b000000000000000000000000000000000000000000000000000;
        28: outdata = 51'b000000000000000000000000000000000000000000000000000;
        29: outdata = 51'b000000000000000000000000000000000000000000000000000;
        30: outdata = 51'b000000000000000000000000000000000000000000000000000;
        31: outdata = 51'b000000000000000000000000000000000000000000000000000;
        32: outdata = 51'b000000000000000000000000000000000000000000000000000;
        33: outdata = 51'b000000000000000000000000000000000000000000000000000;
        34: outdata = 51'b000000000000000000000000000000000000000000000000000;
        35: outdata = 51'b000000000000000000000000000000000000000000000000000;
        36: outdata = 51'b000000000000000000000000000000000000000000000000000;
        37: outdata = 51'b111111111111111111111111111111111111111111111111111;
        38: outdata = 51'b111111111111111111111111111111111111111111111111111;
        39: outdata = 51'b111111111111111111111111111111111111111111111111111;
        40: outdata = 51'b111111111111111111111111111111111111111111111111111;
        41: outdata = 51'b111111111111111111111111111111111111111111111111111;
        42: outdata = 51'b111111111111111111111111111111111111111111111111111;
        43: outdata = 51'b111111111111111111111111111111111111111111111111111;
        44: outdata = 51'b111111111111111111111111111111111111111111111111111;
        45: outdata = 51'b011111111111111111111111111111111111111111111111110;
        46: outdata = 51'b000111111111111111111111111111111111111111111111000;
        47: outdata = 51'b000011111111111111111111111111111111111111111110000;
        48: outdata = 51'b000000111111111111111111111111111111111111111000000;
        49: outdata = 51'b000000001111111111111111111111111111111111100000000;
        50: outdata = 51'b000000000111111111111111111111111111111111000000000;
        51: outdata = 51'b000000000001111111111111111111111111111100000000000;
        52: outdata = 51'b000000000000011111111111111111111111110000000000000;
        53: outdata = 51'b000000000000001111111111111111111111100000000000000;
        54: outdata = 51'b000000000000000011111111111111111110000000000000000;
        55: outdata = 51'b000000000000000000111111111111111000000000000000000;
        56: outdata = 51'b000000000000000000001111111111100000000000000000000;
        57: outdata = 51'b000000000000000000000111111111000000000000000000000;
        58: outdata = 51'b000000000000000000000001111100000000000000000000000;
        59: outdata = 51'b000000000000000000000000010000000000000000000000000;
        default: outdata = 0;
    endcase
    1:case(address_reg)
      //Insert s0o1
      default: outdata = 0;
      endcase
    
    endcase
  end
  
  /* Sequential Logic */
  always @(posedge clk) begin
    address_reg <= address;
    
  end
  
endmodule