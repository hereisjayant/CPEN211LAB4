
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

module lab4_top(SW,KEY,HEX0);
  input [9:0] SW; //Use SW[0] to change the direction. If 1(up) it works as intended, if 0 it cycles backwards.
  input [3:0] KEY; // KEY[0] is the clock, KEY[1] is the reset button. Note these are 1 when unpressed, 0 when pressed.
  output [6:0] HEX0; //Use HEX0 for the output
  reg [6:0] HEX0;

  reg [2:0] present_state;
  reg[2:0] next_state;

  // next state and output logic
  always @(posedge !KEY[0]) begin
    if(!KEY[1])begin
      present_state = `Sa;
      HEX0 = `N5;
      end
    else begin
      case (present_state) //Checks the present state and the Switch
        `Sa: present_state = SW[0] ? `Sb : `Se; //checks the current state and the switch and accordingly
        `Sb: present_state = SW[0] ? `Sc : `Sa; // assigns the next state, and the output to HEX0
        `Sc: present_state = SW[0] ? `Sd : `Sb;
        `Sd: present_state = SW[0] ? `Se : `Sc;
        `Se: present_state = SW[0] ? `Sa : `Sd;
        default: present_state = 3'bxxx;     /// checks for errors
      endcase
      case(present_state)
        `Sa: HEX0= `N5;
        `Sb: HEX0= `N7;
        `Sc: HEX0= `N9;
        `Sd: HEX0= `N8;
        `Se: HEX0= `N3;
      endcase
    end
  end
endmodule
