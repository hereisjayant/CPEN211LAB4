module lab4_top_tb();

  reg[9:0] SW; //input to the lab4_top
  reg[3:0] KEY; //input to the lab4_top
  wire [6:0]HEX0;  //output to the lab4_top

  lab4_top test(SW, KEY, HEX0); //creating a module

  initial begin
    KEY[1] = 1;#5;
    SW[0]=1;
    KEY[0] = 1; #5;
    forever begin
      KEY[0] = 0; #5;
      KEY[0] = 1; #5;
    end
  end
endmodule
