module lab4_top(SW,KEY,HEX0);
  input [9:0] SW; //Use SW[0] to change the direction. If 1(up) it works as intended, if 0 it cycles backwards.
  input [3:0] KEY; // KEY[0] is the clock, KEY[1] is the reset button. Note these are 1 when unpressed, 0 when pressed.
  output [6:0] HEX0; //Use HEX0 for the output

  reg [6:0] HEX0;

  `define SW 3       //Roll no. 5 7 9 8 3, one state for each number
  `define Sa 3'b000  //5
  `define Sb 3'b001  //7
  `define Sc 3'b010  //9
  `define Sd 3'b011  //8
  `define Se 3'b100  //3

  //defining the codes for the HEX display
  `define N5 7'b0010010 //5
  `define N7 7'b1111000 //7
  `define N9 7'b0010000 //9
  `define N8 7'b0000000 //8
  `define N3 7'b0110000 //3


  wire [2:0] present_state, next_state_reset;
  reg [2:0] next_state;

  vDFF #(`SW) STATE(clk,next_state_reset,present_state);

  // reset logic
  assign next_state_reset = KEY[1] ? `Sa : next_state; //checks if reset is on

  // next state and output logic
  always @(*) begin
    case (present_state) //Checks the present state and the Switch
      `Sa: {next_state,HEX0} = { (SW[0] ? `Sb : `Se), `N5 }; //checks the current state and the switch and accordingly
      `Sb: {next_state,HEX0} = { (SW[0] ? `Sc : `Sa), `N7 }; // assigns the next state, and the output to HEX0
      `Sc: {next_state,HEX0} = { (SW[0] ? `Sd : `Sb), `N9 };
      `Sd: {next_state,HEX0} = { (SW[0] ? `Se : `Sc), `N8 };
      `Se: {next_state,HEX0} = { (SW[0] ? `Sa : `Sd), `N3 };
      default: {next_state,HEX0} = 10'bxxxxxxxxxx;     /// checks for errors
    endcase
  end
endmodule

//---------------------------------------------
// define flip-flop
//---------------------------------------------
module vDFF(clk, in, out) ;
  parameter n = 1;  // width
  input clk ;
  input [n-1:0] in ;
  output [n-1:0] out ;
  reg [n-1:0] out ;

  always @(posedge clk)
    out = in ;
endmodule
