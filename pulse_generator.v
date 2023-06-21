`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/21/2023 11:16:20 PM
// Design Name: 
// Module Name: pulse_generator
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


module pulse_generator#(parameter WIDTH = 4)(
    input  clk, 
    input  rst,
    input  [WIDTH-1:0] enable_val,
    output  pulse);

reg [WIDTH-1:0] count;

always@(posedge clk, negedge rst)
    begin
        if(rst == 1'b0)
            begin
                count <= {WIDTH{1'b0}};
            end
        else
            begin
                count <= (count < enable_val) ? count + 1 : 0;
            end   
    end

assign pulse = (count == enable_val) ? 1 : 0;

endmodule
