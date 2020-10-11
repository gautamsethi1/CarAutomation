global key
InitKeyboard();

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
