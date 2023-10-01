clc, clearvars;

filename = 'BestChromosomeFinal.mat';

% Load the array from the MAT file
load(filename);

% bestChromosome = zeros(1, 10);


numberOfGenes = length(globalBestChromosome);

% PREPARE REGISTERS 

unionOfRegisters = {'x', '0', '0', '1', '3', '-1'}; 

% unionOfRegisters(1) = 'x'; 
% unionOfRegisters(2) = '0'; 
% unionOfRegisters(3) = '0';
% unionOfRegisters(4) = '1'; 
% unionOfRegisters(5) = '3'; 
% unionOfRegisters(6) = '-1';

for j = 1:4:numberOfGenes

    operatorIndex = globalBestChromosome(j); 
    destinationIndex = globalBestChromosome(j+1); 
    operandOneIndex = globalBestChromosome(j+2); 
    operandTwoIndex = globalBestChromosome(j+3); 
    
    
    if operatorIndex == 1
        disp(1);
        unionOfRegisters{destinationIndex} = ['(', unionOfRegisters{operandOneIndex}, '+', unionOfRegisters{operandTwoIndex}, ')']
    elseif operatorIndex == 2
        disp(2);
        unionOfRegisters{destinationIndex} = ['(', unionOfRegisters{operandOneIndex}, '-', unionOfRegisters{operandTwoIndex}, ')']
    elseif operatorIndex == 3
        disp(3);
        unionOfRegisters{destinationIndex} = ['(', unionOfRegisters{operandOneIndex}, '*', unionOfRegisters{operandTwoIndex}, ')']
    elseif operatorIndex == 4
        disp(4); 
        disp('DEBUGDEBUG')
        unionOfRegisters{destinationIndex} = ['(', unionOfRegisters{operandOneIndex}, '/', unionOfRegisters{operandTwoIndex}, ')']
    end          


end

yEstimate = unionOfRegisters{1};


disp('Final function: ')
disp(yEstimate);

% so, the function we are looking for, is: 
% (x*(x^2 - x)+1) / (x*(x*x-x) +1 + x^2*(x^2-x))



numberOfVariableRegisters = 3; 
numberOfConstantRegisters = 3; 

data = LoadFunctionData(); 

yEstimateList = zeros(1, length(data));

for iDataPoint = 1:length(data)
        
    yTemp = DecodeChromosome(data(iDataPoint), globalBestChromosome, numberOfVariableRegisters, numberOfConstantRegisters);

    yEstimateList(iDataPoint) = yTemp; 

end



% plotting 
x = data(:, 1)';
y = data(:, 2)';

% Create a plot with two data sets
plot(x, y, 'b', 'LineWidth', 2, 'MarkerSize', 2);
hold on; 
plot(x, yEstimateList, 'o', 'LineWidth', 2, 'MarkerSize', 2);



% Add labels, title, and legend
xlabel('X-axis');
ylabel('Y-axis');
title('Approximation of a dataseries with LGP');
legend('y_{true}', 'y_{estimate}');


