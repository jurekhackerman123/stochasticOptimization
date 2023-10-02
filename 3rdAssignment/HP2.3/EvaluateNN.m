% in this file, we evaluate the neural network
% at each timestep, the corresponding values are calculated, the velocity
% at the time t is calculated and then the NN is evaluated 

% Essentially, at every timestep we calculate Tb, then v and then put this
% all togehter in the neural network 

function fitnessValue = EvaluateNN(chromosome, alpha, deltaT, pP, mTruck, tBreak, tAmb, tMax, tau, cH, cB, initialVelocity, initialGearPosition, maxVelocity, minVelocity)
    totalDistanceTraveled = 0; 
    velocity = initialVelocity;  
    currentGear = initialGearPosition; 

    [wIH, wHO] = DecodeChromosome(chromosome, 3, 3, 2, 2); 


    while totalDistanceTraveled < 1000

        alpha = GetSlopeAngle(totalDistanceTraveled, 1, 1);

        if pP < 0.01
            tBreak = tBreak - tBreak/tau * deltaT;

        else
            tBreak = cH * pP * deltaT; 
        end


        velocity = TruckModel(pP, mTruck, tBreak, tMax, cB, velocity, currentGear, alpha, deltaT);

        if velocity > maxVelocity || velocity < minVelocity
            disp('Breaking, velocity limits not valid anymore.');
            break; 
        end

        % evaluate NN
        [pP, deltaGear] = neuralNetwork(velocity, alpha, tBreak, wIH, wHO);

        if counterForGear > 7
            currentGear = currentGear + deltaGear;
            counterForGear = 0;
        end

        % distance traveled during timestep deltaT
        distanceTravelled = velocity * t * cos(alpha);
        totalDistanceTraveled = totalDistanceTraveled + distanceTravelled; 

        % increase Gear counter
        counterForGear = counterForGear + 1; 

    end
end