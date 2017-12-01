module shape2base (
    input wire clk,  // clock
    input [3:0] dataret,
    input wire[5:0] address,
    output reg [50:0] outdata
  );
  
  (* rom_style = "block" *)
  
  reg [5:0] address_reg;
  reg[2:0] datatoget;
  reg [3:0] orientreg;

  /* Combinational Logic */
  always @* begin
    case(datatoget)
    0:case (address_reg)
        //Data for s1o0
        default: outdata = 0;
    endcase
    1:case(address_reg)
      //Data for s1o2
      default: outdata = 0;
      endcase
    endcase
  end
  
  /* Sequential Logic */
  always @(posedge clk) begin
    address_reg <= address;
    orientreg <= orientation;
    datatoget <= dataret;
    
  end
  
endmodule
