`timescale 1 ps/ 1 ps



`define SW 3       //Roll no. 5 7 9 8 3, one state for each number
`define Sa 3'b000  //5
`define Sb 3'b001  //7
`define Sc 3'b010  //9
`define Sd 3'b011  //8
`define Se 3'b100  //3
`define Sf 4'b101  //8


//defining the codes for the HEX display
`define N5 7'b0010010 //5
`define N7 7'b1111000 //7
`define N9 7'b0010000 //9
`define N8 7'b0000000 //8
`define N3 7'b0110000 //3

module lab4_top_tb();

  reg[9:0] SW; //input to the lab4_top
  reg[3:0] KEY; //input to the lab4_top
  reg err;

  wire [6:0]HEX0;  //output to the lab4_top

  lab4_top dut(SW, KEY, HEX0); //creating a module

  //clock
  initial begin
    KEY[0] = 1; #5; //the clock starts with a 0 i.e. equivalent to 1 here
    forever begin
      KEY[0] = 0; #5;
      KEY[0] = 1; #5;
    end
  end

  initial begin
  KEY[1] = 1'b0; // resets the DUT
  SW[0] = 1'b1; //clockwise
  err = 1'b0;
  #10;  // wait until after rising edge of clock at time 5, before rising edge at time 15

  // check whether in expected state
  // if( lab4_top_tb.dut.present_state !== `Sa ) begin // checks the reset
  //   $display("ERROR ** state is %b, expected %b",lab4_top_tb.dut.present_state, `Sa );
  //   err = 1'b1;
  // end
  // also check whether output is correct
  if( HEX0 !== `N5 ) begin
   $display("ERROR ** output is %b, expected %b", HEX0, `N5 );
   err = 1'b1;
  end
  KEY[1] = 1; //de-asserting reset at the end of first 10 secs


//NOTE: following are the tests for clockwise scrolling of numbers
  $display("checking Sa->Sb");
    SW[0] = 0; // when in Sa should go to state Sb
    #10; // wait for rising edge of clock before checking states and output
    // if( lab4_top_tb.dut.present_state !== `Sb ) begin
    //    $display("ERROR ** state is %b, expected %b", lab4_top_tb.dut.present_state, `Sb );
    //    err = 1'b1;
    // end
    if( HEX0 !== `N7 ) begin
       $display("ERROR ** output is %b, expected %b", HEX0, `N7 );
       err = 1'b1;
    end

    $display("checking Sb->Sc");
      SW[0] = 0; // when in Sb should go to state Sc
      #10; // wait for rising edge of clock before checking states and output
      // if( lab4_top_tb.dut.present_state !== `Sc ) begin
      //    $display("ERROR ** state is %b, expected %b", lab4_top_tb.dut.present_state, `Sc );
      //    err = 1'b1;
      // end
      if( HEX0 !== `N9 ) begin
         $display("ERROR ** output is %b, expected %b", HEX0, `N9 );
         err = 1'b1;
      end

      $display("checking Sc->Sd");
        SW[0] = 0; // when in Sc should go to state Sd
        #10; // wait for rising edge of clock before checking states and output
        // if( lab4_top_tb.dut.present_state !== `Sd ) begin
        //    $display("ERROR ** state is %b, expected %b", lab4_top_tb.dut.present_state, `Sd );
        //    err = 1'b1;
        // end
        if( HEX0 !== `N8 ) begin
           $display("ERROR ** output is %b, expected %b", HEX0, `N8 );
           err = 1'b1;
        end

        $display("checking Sd->Se");
          SW[0] = 0; // when in Sd should go to state Se
          #10; // wait for rising edge of clock before checking states and output
          // if( lab4_top_tb.dut.present_state !== `Se ) begin
          //    $display("ERROR ** state is %b, expected %b", lab4_top_tb.dut.present_state, `Se );
          //    err = 1'b1;
          // end
          if( HEX0 !== `N3 ) begin
             $display("ERROR ** output is %b, expected %b", HEX0, `N3 );
             err = 1'b1;
          end



            $display("checking Se->Sf");
              SW[0] = 0; // when in Se should go to state Sf
              #10; // wait for rising edge of clock before checking states and output
              // if( lab4_top_tb.dut.present_state !== `Sf ) begin
              //    $display("ERROR ** state is %b, expected %b", lab4_top_tb.dut.present_state, `Sf );
              //    err = 1'b1;
              // end
              if( HEX0 !== `N8 ) begin
                 $display("ERROR ** output is %b, expected %b", HEX0, `N8 );
                 err = 1'b1;
              end

              $display("checking Sf->Sa");
                SW[0] = 0; // when in Sb should go to state Sc
                #10; // wait for rising edge of clock before checking states and output
                // if( lab4_top_tb.dut.present_state !== `Sa ) begin
                //    $display("ERROR ** state is %b, expected %b", lab4_top_tb.dut.present_state, `Sa );
                //    err = 1'b1;
                // end
                if( HEX0 !== `N5 ) begin
                   $display("ERROR ** output is %b, expected %b", HEX0, `N5 );
                   err = 1'b1;
                end

//*-*-**-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-**-*-*-*-*-*-*-*-*-*-*-*-*-*-
  //NOTE: following are the tests for anti-clockwise scrolling throught the numbers

  $display("checking Sa->Sf");
    SW[0] = 1; // when in Sa should go to state Sf
    #10; // wait for rising edge of clock before checking states and output
    // if( lab4_top_tb.dut.present_state !== `Sf ) begin
    //    $display("ERROR ** state is %b, expected %b", lab4_top_tb.dut.present_state, `Sf);
    //    err = 1'b1;
    // end
    if( HEX0 !== `N8 ) begin
       $display("ERROR ** output is %b, expected %b", HEX0, `N8 );
       err = 1'b1;
    end

    $display("checking Sf->Se");
      SW[0] = 1; // when in Sf should go to state Se
      #10; // wait for rising edge of clock before checking states and output
      // if( lab4_top_tb.dut.present_state !== `Se ) begin
      //    $display("ERROR ** state is %b, expected %b", lab4_top_tb.dut.present_state, `Se);
      //    err = 1'b1;
      // end
      if( HEX0 !== `N3 ) begin
         $display("ERROR ** output is %b, expected %b", HEX0, `N3 );
         err = 1'b1;
      end

    $display("checking Se->Sd");
      SW[0] = 1; // when in Se should go to state Sd
      #10; // wait for rising edge of clock before checking states and output
      // if( lab4_top_tb.dut.present_state !== `Sd ) begin
      //    $display("ERROR ** state is %b, expected %b", lab4_top_tb.dut.present_state, `Sd);
      //    err = 1'b1;
      // end
      if( HEX0 !== `N8 ) begin
         $display("ERROR ** output is %b, expected %b", HEX0, `N8 );
         err = 1'b1;
      end

      $display("checking Sd->Sc");
        SW[0] = 1; // when in Sd should go to state Sc
        #10; // wait for rising edge of clock before checking states and output
        // if( lab4_top_tb.dut.present_state !== `Sc ) begin
        //    $display("ERROR ** state is %b, expected %b", lab4_top_tb.dut.present_state, `Sc);
        //    err = 1'b1;
        // end
        if( HEX0 !== `N9 ) begin
           $display("ERROR ** output is %b, expected %b", HEX0, `N9 );
           err = 1'b1;
        end

        $display("checking Sc->Sb");
          SW[0] = 1; // when in Sc should go to state Sb
          #10; // wait for rising edge of clock before checking states and output
          // if( lab4_top_tb.dut.present_state !== `Sb ) begin
          //    $display("ERROR ** state is %b, expected %b", lab4_top_tb.dut.present_state, `Sb);
          //    err = 1'b1;
          // end
          if( HEX0 !== `N7 ) begin
             $display("ERROR ** output is %b, expected %b", HEX0, `N7 );
             err = 1'b1;
          end

          $display("checking Sb->Sa");
            SW[0] = 1; // when in Sb should go to state Sa
            #10; // wait for rising edge of clock before checking states and output
            // if( lab4_top_tb.dut.present_state !== `Sa ) begin
            //    $display("ERROR ** state is %b, expected %b", lab4_top_tb.dut.present_state, `Sa);
            //    err = 1'b1;
            // end
            if( HEX0 !== `N5 ) begin
               $display("ERROR ** output is %b, expected %b", HEX0, `N5 );
               err = 1'b1;
            end



    if( ~err ) $display("PASSED");
    $stop;
    end

endmodule
