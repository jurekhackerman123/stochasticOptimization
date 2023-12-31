% this function initializes the population, given the size and nGenes which
% is the number of 1s and 0s in each of the strings of the individuals
% population is a matrix. 
function population = InitializePopulation(populationSize, mininumNumberOfInstructions, maximumNumberOfInstructions, numberOfOperators, numberOfVariableRegisters, numberOfConstantRegisters)


    
    population = [];

    for i = 1:populationSize

        % each chromosome has its own random length (always has to be dividable by four!)
        % if mod(maxChromosomeLength, 4) ~= 0 || mod(minChromosomeLength, 4) ~= 0
        %     disp('ERROR, minChromosomelength and maxChromosomelength have to be dividable by four.')
        % end

        % maximumNumberOfInstructions = maxChromosomeLength/minChromosomeLength;

        chromosomeLength = 4* randi([mininumNumberOfInstructions,maximumNumberOfInstructions]);

        chromosome = zeros(1, chromosomeLength);

        for j = 1:4:chromosomeLength
            % first gene in each instruction set is Operator
            % there's four operators 
            operator = randi([1, numberOfOperators]);
            destinationRegister = randi([1, numberOfVariableRegisters]);
            operandOne = randi([1, numberOfConstantRegisters + numberOfVariableRegisters]);
            operandTwo = randi([1, numberOfConstantRegisters + numberOfVariableRegisters]);

            chromosome(j) = operator; 
            chromosome(j+1) = destinationRegister; 
            chromosome(j+2) = operandOne; 
            chromosome(j+3) = operandTwo; 
        end

        individual = struct('Chromosome',chromosome);

        population = [population individual];
    end
    
end