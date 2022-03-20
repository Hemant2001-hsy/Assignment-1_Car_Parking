                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 module Car_Parking(clk,reset,entrance_sen,exit_sen,password,result);
input clk,reset,entrance_sen,exit_sen;
input[2:0] password;
output [3:0]result;
reg[3:0] result;
parameter idle=3'b000,check_password=3'b001,gate=3'b010,stop=3'b011,correct_password=3'b100,wrong_password=3'b101;
reg[2:0]current_state,next_state;


//NEXT STATE
always@(posedge clk or posedge reset)
begin
if(reset)
current_state=idle;
else
current_state=next_state;
end

//CHANGE STATE
always@(*)
begin
case(current_state)
idle:begin
     if(entrance_sen==1)
	  next_state=check_password;
	  else
	  next_state=idle;
	  end
check_password:begin
               if(password==3'b111)
					next_state=correct_password;
					else
					next_state=check_password;
					end
correct_password:begin
                 next_state=gate;
					  end
gate:begin
     if(exit_sen==1)
	  next_state=stop;
	  else if(exit_sen==0)
	  next_state=gate;
	  else 
	  next_state=idle;
	  end
stop:begin
     next_state=idle;
	  end
default:next_state=idle;
endcase
end

//OUTPUT
always@(posedge clk)
begin
case(current_state)
idle:begin
   result=4'b0000;
	end
check_password:begin
               result=4'b0001;
					end
gate:begin
     result=4'b0010;
	  end
stop:begin
     result=4'b0011;
	  end
correct_password:begin
                 result=4'b0100;
					  end

endcase
end
endmodule
