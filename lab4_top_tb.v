module lab4_top_tb();

  reg[9:0] SW; //input to the lab4_top
  reg[3:0] KEY; //input to the lab4_top
  wire [6:0]HEX0;  //output to the lab4_top

  lab4_top test(SW, KEY, HEX0); //creating a module

  initial begin

    //case 0 : pressing nothing with SW[1] on, we shold be in the first STATE
    SW = 1'b1;// NOTE: sw[0] is on
    KEY[0] = 1'b1; // all the KEYs are unpressed
    #5;
    // print the current values to the Modelsim command line
    $display("The switch (SW[0]) is ON, key pressed 0 times output is %b, expected output is %b", HEX0, 7'b0010010);

    //case 1 : pressing key once with SW[1] on, we shold be in the second
    KEY[0] = 1'b0; // KEY[0] is pressed once
    #5;
    // print the current values to the Modelsim command line
    $display("The switch (SW[0]) is ON, key pressed 1 time output is %b, expected output is %b", HEX0, 7'b1111000);
    KEY[0] = 1'b1;

    //case 2 : pressing key two times with SW[1] on, we shold be in the third STATE
    KEY[0] = 1'b0; // KEY[0] is pressed again
    #5;
    // print the current values to the Modelsim command line
    $display("The switch (SW[0]) is ON, key pressed 1 time output is %b, expected output is %b", HEX0, 7'b0010000);
    KEY[0] = 1'b1;

    //case 3 : pressing key 3 times with SW[1] on, we shold be in the fourth STATE
    KEY[0] = 1'b0; // KEY[0] is pressed again
    #5;
    // print the current values to the Modelsim command line
    $display("The switch (SW[0]) is ON, key pressed 1 time output is %b, expected output is %b", HEX0, 7'b0000000);
    KEY[0] = 1'b1;

    //case 4 : pressing key 4th time with SW[1] on, we shold be in the fifth state
    KEY = 4'b1110; // KEY[0] is pressed once
    #5;
    // print the current values to the Modelsim command line
    $display("The switch (SW[0]) is ON, key pressed 1 time output is %b, expected output is %b", HEX0, 7'b0110000);

    //case 5 : pressing key 5th time with SW[1] on, we shold be in the first state again
    KEY = 4'b1110; // KEY[0] is pressed once
    #5;
    // print the current values to the Modelsim command line
    $display("The switch (SW[0]) is ON, key pressed 1 time output is %b, expected output is %b", HEX0, 7'b0010010);

    //case 6 : pressing key 6th time with SW[1] on, we shold be in the second STATE
    KEY = 4'b1110; // KEY[0] is pressed once
    #5;
    // print the current values to the Modelsim command line
    $display("The switch (SW[0]) is ON, key pressed 1 time output is %b, expected output is %b", HEX0, 7'b1111000);

    //case 7 : pressing key 7th time with SW[1] OFF, we shold be back to the first state
    SW = 10'b0000000000;// NOTE: sw[0] is turned OFF
    KEY = 4'b1110; // KEY[0] is pressed once
    #5;
    // print the current values to the Modelsim command line
    $display("The switch (SW[0]) is ON, key pressed 1 time output is %b, expected output is %b", HEX0, 7'b0010010);

    //case 8 : pressing key 8th time with SW[1] OFF, we shold be back to the fifth state
    KEY = 4'b1110; // KEY[0] is pressed once
    #5;
    // print the current values to the Modelsim command line
    $display("The switch (SW[0]) is ON, key pressed 1 time output is %b, expected output is %b", HEX0, 7'b0110000);

    $stop;
    end
  endmodule
