


function velocityNextStep = TruckModel(pP, mTruck, tBreak, tMax, cB, velocity, currentGear, currentSlope, deltaT)
    
    % braking force
    if tBreak < tMax -100
        brakingForce = mTruck * 9.81 / 20 * pP; 
    else 
        brakingForce = mTruck * 9.81 / 20 * pP * exp(-(tBreak - (tMax - 100)) / 100 );
    end

    
    % gravity force 
    gravityForce = mTruck * 9.81 * sin(currentSlope); 

    % engine break force
    engineBrakeForceArray = [7, 5, 4, 3, 2.5, 2, 1.6, 1.4, 1.2, 1];
    engineBrakeForceArray = engineBrakeForceArray * cB; 

    engineBrakeForce = engineBrakeForceArray(currentGear);

    % now, for the velocity at the next time step 
    velocityNextStep = deltaT / mTruck * (gravityForce + engineBrakeForce + brakingForce) + velocity; 


end