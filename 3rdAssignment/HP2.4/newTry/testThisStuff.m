clearvars, clc; 

tournamentProbability = 0.75;
crossoverProbability = 0.8;  
mutationProbability = 0.02;


populationSize = 10;

numberOfVariableRegisters = 3; 
numberOfConstantRegisters = 3; 

numberOfOperators = 4; 


data = LoadFunctionData();

population = InitializePopulation(populationSize, 16, 4, numberOfOperators, numberOfVariableRegisters, numberOfConstantRegisters)
% works

fitnessList = zeros(1, populationSize);

for i = 1:populationSize
     chromosome = population(i).Chromosome;
     fitnessList(i) = EvaluateIndividual(chromosome, data, numberOfVariableRegisters, numberOfConstantRegisters);
end



% evaluate individual works

% Now, for Tournamentselection, CrossOver and Mutation

temporaryPopulation = population;  
for i = 1:2:populationSize
    i1 = TournamentSelect(fitnessList,tournamentProbability,2);
    i2 = TournamentSelect(fitnessList,tournamentProbability,2);
    r = rand;
    if (r < crossoverProbability) 
        individual1 = population(i1).Chromosome;
        individual2 = population(i2).Chromosome;
        [newIndividual1, newIndividual2] = Cross(individual1, individual2);
        temporaryPopulation(i).Chromosome = newIndividual1;
        temporaryPopulation(i+1).Chromosome = newIndividual2;
    else
        temporaryPopulation(i).Chromosome = population(i1).Chromosome;
        temporaryPopulation(i+1).Chromosome = population(i2).Chromosome;     
    end
end


% temporaryPopulation(1,:) = population(iBestIndividual,:);
for i = 1:populationSize
    tempIndividual = Mutate(temporaryPopulation(i).Chromosome, mutationProbability, numberOfOperators, numberOfVariableRegisters, numberOfConstantRegisters);
    temporaryPopulation(i).Chromosome = tempIndividual;
end
population = temporaryPopulation;




