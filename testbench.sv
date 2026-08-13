// Code your testbench here
// or browse Examples
`timescale 1ns / 1ps

module tb_PE;

    // Testbench signals
    reg  [3:0] in;
    wire [1:0] out;
    wire       valid;

    // Instantiate the Unit Under Test (UUT)
    PE uut (
        .in(in),
        .out(out),
        .valid(valid)
    );

    integer i;
  
    initial begin
      $dumpvars(0,tb_PE);
        // Print header for readable output
        $display("---------------------------------");
        $display(" Time | in[3:0] | out[1:0] | valid ");
        $display("---------------------------------");

        // Loop through all 16 input combinations (4'b0000 to 4'b1111)
        for (i = 0; i < 16; i = i + 1) begin
            in = i;
            #10; // Wait 10ns for combinational propagation
            
            $display("%5t |  %b   |    %b    |   %b  ", $time, in, out, valid);
        end

        $display("---------------------------------");
        $finish; // End simulation
    end

endmodule