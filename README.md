# FFALU_w-tempsense

Created by Anas Benhamida and Muayad Al-Barwani



Input/Output Changes:
Output mechanism: 
Related to temp sensor, will need more that one anode to show temperature and unit of measurement
Design Changes: 
Modify decoder 
Related to temp sensor, will need more that one anode to show temperature and unit of measurement
Sequential logic element
Related to our output mechanism, we will use a finite state machine to help drive the use of multiple anodes on our FPGA display 

Surprise Changes: 
Temperature sensor

Summary Paragraph: 
We changed our decoder to take a 5-bit input so that we can display more symbols (degrees) It now displays the mode, A input, B input, 
and the result of whatever operation the ALU performs at the same time on four 7-segment display anodes. 
We also implemented a temperature sensor that displays the temperature on the 7 segment display in this format, 23°C, on the FPGA display
which will also require 4 anodes. To get the temperature sensor working, we used pre-made code, we then had to make some changes to the pre-made
code and our FSM to make them compatible with our ALU. 

Testing and thought process:
Much of our testing was related to getting the corrext values and making sure the switches and muxes worked after
having to figure out different ways to display our values without increasing our ALUs input bits unnecessarily. We managed to
do that using a number of muxes and case statements and that solved our issues. Since we got accurate temperature values and 
the anodes worked with no problem, we didn't have much more that needed a test bench although it would of been useful in 
detecting our mistake in forgetting the SCL.

Video Link:

https://drive.google.com/file/d/1LIxJslVreEY90sxoAL8gy3yEnLuUBSkK/view?usp=sharing 
