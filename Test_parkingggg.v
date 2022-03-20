module Test_car_parking_new;

	// Inputs
	reg clk;
	reg reset;
	reg entrance_sen;
	reg exit_sen;
	reg [2:0] password;

	// Outputs
	wire [3:0] result;

	// Instantiate the Unit Under Test (UUT)
	Car_Parking uut (
		.clk(clk), 
		.reset(reset), 
		.entrance_sen(entrance_sen), 
		.exit_sen(exit_sen), 
		.password(password), 
		.result(result)
	);
initial begin
 clk = 0;
 forever #10 clk = ~clk;
 end
	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 0;
		entrance_sen = 0;
		exit_sen = 0;
		password = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		 reset=1'b0;
	  #100
	  clk=1'b1;
	  #100
	  entrance_sen=1'b1;password=3'b111;exit_sen=1'b1;
	  

	end
      
endmodule
