`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/21/2023 11:20:35 PM
// Design Name: 
// Module Name: pulse_generator_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module pulse_generator_tb();

        parameter WIDTH = 4;
        parameter N = 10;
        
        parameter PULSE_CYCLE = (10 *(N+1));

        reg  clk; 
        reg  rst;
        reg  [WIDTH-1:0] enable_val;
        wire  pulse;
        
        pulse_generator dut(clk,rst,enable_val,pulse);
        
        always #5 clk = ~clk;


        initial 
        begin
            clk = 0;
            rst = 0;  
            
            enable_val = N;
            
            #10;
            rst = 1;
            #(2 * PULSE_CYCLE);  
            $finish();
        end
endmodule
