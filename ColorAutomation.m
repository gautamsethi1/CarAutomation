global key
InitKeyboard();
%brick = ConnectBrick('OOO');
brick.SetColorMode(4, 2); sets the sensor to the second mode
color = brick.ColorCode(4); %reads the color from the sensor
reading = brick.TouchPressed(2); %checks if the touch sensor is pressed

while color~=0
%while loop will run until the robot is picked up and it will then read the color 0, and the code will end
    color = brick.ColorCode(4);
    if color==5 %if the robot detects red, it will stop for 4 seconds and then move forward
        pause(4);
        brick.MoveMotor('D', -20);
        brick.MoveMotor('A', 20);
        pause(3);
        brick.StopMotor('D');
        brick.StopMotor('A');
    end
    if color == 3 || color == 4 %robot will enter manual control if it detects green or yellow
        if color == 3 %code to make drop off autonomous, will drop user once color green is read
            brick.MoveMotor('B', -20);
            pause(0.4)
            brick.StopMotor('B');
        end
        while 1
            pause(0.1)
        switch key
        case 'uparrow'
            disp('Up Arrow Pressed!');
            %code to move forward
            brick.MoveMotor('D',-40);
            brick.MoveMotor('A',-40)
            pause(0.5);
            brick.StopMotor('D');
            brick.StopMotor('A');
        case 'downarrow'
            disp('Down Arrow Pressed!');
            %code to move backwards
            brick.MoveMotor('A',50);
            brick.MoveMotor('D',50);
            pause(0.5);
            brick.StopMotor('D');
            brick.StopMotor('A');
        case 'leftarrow'
            disp('Left Arrow Pressed!');
            %code to turn left
            brick.MoveMotorAngleRel('A',-90,180);
            brick.MoveMotorAngleRel('D',90,180);
             brick.ResetMotorAngle('A');
            brick.ResetMotorAngle('D');
        case 'rightarrow'
            disp('Right Arrow Pressed!');
            %code to turn right
           brick.ResetMotorAngle('A');
            brick.ResetMotorAngle('D');
            brick.MoveMotorAngleRel('D',-90,180);
            brick.MoveMotorAngleRel('A',90,180);
             brick.ResetMotorAngle('A');
            brick.ResetMotorAngle('D');
        case 'a'
            disp('left');
            %code to turn slightly left
            brick.MoveMotor('A', -90);
            pause(0.1);
            brick.StopMotor('AD');
        case 'f'
            disp('right');
            %code to turn slightly right
            brick.MoveMotor('D', -90);
            brick.StopMotor('A', 'Brake');
            pause(0.1);
            brick.StopMotor('AD');
        case 0
            disp('No Key Pressed!');
        case 'w'
            disp('Picking up User!');
            %code to pick up user
            brick.MoveMotor('B', 35);
            pause(0.5)
            brick.StopMotor('B');
        case 'd'
            disp('Dropping off User!');
            %code to drop off user
            brick.MoveMotor('B', -20);
            pause(0.4)
            brick.StopMotor('B');
        case 'q'
            break;
        end
       end
   end
    color = brick.ColorCode(4); %reads the color from the sensor
    if color==5 %if color red is detected the robot will stop for 4 seconds and then move forward for 3 seconds
        pause(4);
        brick.MoveMotor('D', -20);
        brick.MoveMotor('A', -20);
        pause(3);
        brick.StopMotor('D');
        brick.StopMotor('A');
    end
     distance = brick.UltrasonicDist(3); %checks the distance to the wall to the left
    if distance>62 %if the robot decects no wall to the left it will turn left
            brick.MoveMotor('A', -90);
            pause(0.7);
            brick.StopMotor('AB'); %robot turns left
            
            %robot will move forward for one second
            brick.MoveMotor('D', -20);
            brick.MoveMotor('A', -20);
            pause(1);
            brick.StopMotor('D');
            brick.StopMotor('A');
             color = brick.ColorCode(4);
            if color==5 %robot will check if it on top of the red tape, if it is it will then pause for four seconds and then move forward
               pause(4);
               brick.MoveMotor('D', -20);
               brick.MoveMotor('A', 20);
               pause(3);
               brick.StopMotor('D');
               brick.StopMotor('A');
            end
            %robot will move forward for one second
           brick.MoveMotor('D', -20);
            brick.MoveMotor('A', -20);
            pause(1);
            brick.StopMotor('D');
            brick.StopMotor('A');
            color = brick.ColorCode(4);
            if color==5 %robot checks for red, if color equals 5 it will pause for 4 seconds and then move forward
               pause(4);
               brick.MoveMotor('D', -20);
               brick.MoveMotor('A', 20);
               pause(3);
               brick.StopMotor('D');
               brick.StopMotor('A');
            end
            %robot will again move forward for one second and then stop
           brick.MoveMotor('D', -20);
            brick.MoveMotor('A', -20);
            pause(1);
            brick.StopMotor('D');
            brick.StopMotor('A');
            color = brick.ColorCode(4); %reads the color from the sensor
            if color==5 %robot checks if it is detecting the color red, if it is, then it will pause for 
               pause(4);
               brick.MoveMotor('D', -20);
               brick.MoveMotor('A', 20);
               pause(3);
               brick.StopMotor('D');
               brick.StopMotor('A');
            end
           brick.MoveMotor('D', -20);
            brick.MoveMotor('A', -20);
            pause(1);
            brick.StopMotor('D');
            brick.StopMotor('A');
            color = brick.ColorCode(4);%reads the color from the sensor
            if color==5 %checks if the color detected is red, if yes the robot will pause for four seconds
               pause(4);
               brick.MoveMotor('D', -20);
               brick.MoveMotor('A', 20);
               pause(3);
               brick.StopMotor('D');
               brick.StopMotor('A');
           end
  
    else %if there is no wall to the left of the robot it will continue to move forward
         brick.MoveMotor('D', -20);
          brick.MoveMotor('A', -20);
          pause(2);
          brick.StopMotor('D');
          brick.StopMotor('A');
    end
     color = brick.ColorCode(4); %reads the color from the sensor
    if color==5 %if the color is red, the robot will pause for 4 seconds and then moves forward
        pause(4);
        brick.MoveMotor('D', -20);
        brick.MoveMotor('A', -20);
        pause(3);
        brick.StopMotor('D');
        brick.StopMotor('A');
    end
   
    reading = brick.TouchPressed(2); %checks if the touch sensor is pressed
    %if the color sensor is pressed will enter the body of the if statement
    if reading==1
        disp('Wall detected');
        %will move backwards for one second
            brick.MoveMotor('A',30);
            brick.MoveMotor('D',30);
            pause(1);
            brick.StopMotor('D');
            brick.StopMotor('A');
            pause(1);
            %will turn 45 degrees 
           brick.MoveMotor('D', -90);
            brick.StopMotor('A', 'Brake');
            pause(0.3);
            brick.StopMotor('AD');
            %robot will again move backwards for one second
            brick.MoveMotor('A',30);
            brick.MoveMotor('D',30);
            pause(1);
            brick.StopMotor('D');
            brick.StopMotor('A');
            pause(1);
            %robot will turn 45 degrees right
           brick.MoveMotor('D', -90);
            brick.StopMotor('A', 'Brake');
            pause(0.3);
            brick.StopMotor('AD');
    else %if wall is not detected, robot will just move forward
         brick.MoveMotor('D', -20);
          brick.MoveMotor('A', -20);
          pause(0.5);
          brick.StopMotor('D');
          brick.StopMotor('A'); 
    end
     color = brick.ColorCode(4);%reads the color from the sensor
    if color==5 %if the color is red, the robot will stop for 4 seconds and then move forward
        pause(4);
        brick.MoveMotor('D', -10);
        brick.MoveMotor('A', -10);
        pause(3);
        brick.StopMotor('D');
        brick.StopMotor('A');
    end
      distance = brick.UltrasonicDist(3); %checks the distance to the wall to the left
    if distance>62 %if the robot decects no wall to the left it will turn left
            brick.MoveMotor('A', -90);
            pause(0.7);
            brick.StopMotor('AB'); %robot turns left
            
            %robot will move forward for one second
            brick.MoveMotor('D', -20);
            brick.MoveMotor('A', -20);
            pause(1);
            brick.StopMotor('D');
            brick.StopMotor('A');
             color = brick.ColorCode(4);
            if color==5 %robot will check if it on top of the red tape, if it is it will then pause for four seconds and then move forward
               pause(4);
               brick.MoveMotor('D', -20);
               brick.MoveMotor('A', 20);
               pause(3);
               brick.StopMotor('D');
               brick.StopMotor('A');
            end
            %robot will move forward for one second
            brick.MoveMotor('D', -20);
            brick.MoveMotor('A', -20);
            pause(1);
            brick.StopMotor('D');
            brick.StopMotor('A');
            color = brick.ColorCode(4);
            if color==5 %robot checks for red, if color equals 5 it will pause for 4 seconds and then move forward
               pause(4);
               brick.MoveMotor('D', -20);
               brick.MoveMotor('A', 20);
               pause(3);
               brick.StopMotor('D');
               brick.StopMotor('A');
            end
            %robot will again move forward for one second and then stop
           brick.MoveMotor('D', -20);
            brick.MoveMotor('A', -20);
            pause(1);
            brick.StopMotor('D');
            brick.StopMotor('A');
            color = brick.ColorCode(4); %reads the color from the sensor
            if color==5 %robot checks if it is detecting the color red, if it is, then it will pause for 
               pause(4);
               brick.MoveMotor('D', -20);
               brick.MoveMotor('A', 20);
               pause(3);
               brick.StopMotor('D');
               brick.StopMotor('A');
            end
           brick.MoveMotor('D', -20);
            brick.MoveMotor('A', -20);
            pause(1);
            brick.StopMotor('D');
            brick.StopMotor('A');
            color = brick.ColorCode(4);%reads the color from the sensor
            if color==5 %checks if the color detected is red, if yes the robot will pause for four seconds
               pause(4);
               brick.MoveMotor('D', -20);
               brick.MoveMotor('A', 20);
               pause(3);
               brick.StopMotor('D');
               brick.StopMotor('A');
           end
  
    else %if there is no wall to the left of the robot it will continue to move forward
         brick.MoveMotor('D', -20);
          brick.MoveMotor('A', -20);
          pause(2);
          brick.StopMotor('D');
          brick.StopMotor('A');
    end
     color = brick.ColorCode(4);%reads the color from the sensor
    if color==5 %if color detected is red, then the robot will stop for 4 seconds and then move forward
        pause(4);
    brick.MoveMotor('D', -20);
    brick.MoveMotor('A', -20);
    pause(3);
    brick.StopMotor('D');
    brick.StopMotor('A');
    end
    color = brick.ColorCode(4);%reads the color from the sensor
 end


            




