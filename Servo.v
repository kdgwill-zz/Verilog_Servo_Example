//Frequency of 
//Frequency of 50Hz w/ 50MHz clock 
//so 50000000/50=1000000
//also Log2(1000000)=~20
//For accuracy lets reset when reaches 1000000?
//
//Now in terms of Pulse width generally 1ms to 2ms 
//this results in 50,000 to 100,000 CMPR value
//MIN:    50M * 1.0m =  50,000  = 50,000,000 * .000000001
//CENTER: 50M * 1.5m =  75,000
//MAX:    50M * 2.0m = 100,000
//
//lets try an 8 bit resolution allowing 256 steps
//First scale 0-255 to 50,000-100,000 so 50,000/255=~196
//we could also try a simpler division since 1ms/256 = 3.9us
//we could do (50Mz*1.0ms)/256 which will result in 195
//Offset (CENTER-((Steps/2)*2^Resolution))/2^resolution =~offset
//offset 165


//THIS MODULE ASSUMES SERVO RANGE IS FROM 1ms to 2ms
module Servo #(
  parameter CLK_FREQUENCY = 50000000,//we want a 50Mhz clock so 10ns this makes   
  parameter VALUE_SCALING = 256,
  parameter CTR_LEN = 21,//basically we can adjust the speed by mult CLKFREQ by SPEED 
  parameter SPEED_DATA_LEN = 5,//this will give us a value of 30 and log2 will give 5
  parameter POSITION_DATA_LEN = 8,  
  parameter ADDR_LEN = 8,
  parameter MAX_RAM_POS = 256,
  parameter DATA_LEN = 13
)(
input  clk,
input  rst,
input  [DATA_LEN-1:0] data,
output reg [ADDR_LEN-1:0] address,
output reg servo_q
);

wire[CTR_LEN-1:0] freq;
wire[SPEED_DATA_LEN-1:0] speed;

assign speed = data[POSITION_DATA_LEN+:SPEED_DATA_LEN-1];//LOOK AT VALUES TO THE LEFT OR MSB
assign freq = CLK_FREQUENCY*(speed/1000.0);//VERY COSTLY BUT MAKES LIFE EASY(MANY CIRCUITS ARE MADE FOR THIS DECLARATION)

//SECTION 1 DEAL WITH CHANGING ADDRESS
reg[CTR_LEN-1:0] ctr;
always@(posedge clk)begin
  if(rst)begin
    address<= '0;
    ctr <= '0;
  end else begin
    ctr = ctr + 1'b1;
    if(ctr>=freq )begin//THIS IS WHAT SPEED REALLY MEANS
      if(address!=MAX_RAM_POS-1)begin
        address <= address+1'b1;
      end
      ctr = '0;
    end
  end
end

//SECTION 2 DEAL WITH SERVO
wire[POSITION_DATA_LEN-1:0] pos;
wire[CTR_LEN-1-8:0] pulseCount ;//we will shift by 8 by selecting top 12 bit
assign pos = data[0+:POSITION_DATA_LEN-1];
//Doing this would be the same as a tick the pulseCount increments by 1 every certain amount of clock cycles
assign pulseCount = ctr[8+:CTR_LEN-1];//+ indicate increasing from starting point, - decreasing   

always @(posedge clk) begin
  servo_q = pulseCount < (pos + 9'd165) ;
  //servo_q = pulseCount < {4'b0001,pos};
end

endmodule