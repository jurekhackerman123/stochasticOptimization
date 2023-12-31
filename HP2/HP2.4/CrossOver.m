function [newIndividual1, newIndividual2] = CrossOver(individual1, individual2)
    
    chromosomeLength1 = length(individual1);
    chromosomeLength2 = length(individual2);

    if chromosomeLength1 == 4
        upperLimit1 = 1; 
    else
        upperLimit1 = chromosomeLength1/4 -1;
    end

    if chromosomeLength2 == 4
        upperLimit2 = 1; 
    else 
        upperLimit2 = chromosomeLength2/4 -1; 
    end

    crossoverPoint1Chromosome1 = 4 * randi([1, upperLimit1]);
    crossoverPoint2Chromosome1 = 4 * randi([1, upperLimit1]);

    % make sure secondPoint is larger than first point 
    if crossoverPoint2Chromosome1 < crossoverPoint1Chromosome1
        tempPoint = crossoverPoint2Chromosome1; 
        crossoverPoint2Chromosome1 = crossoverPoint1Chromosome1; 
        crossoverPoint1Chromosome1 = tempPoint; 
    end

    

    crossoverPoint1Chromosome2 = 4 * randi([1, upperLimit2]);
    crossoverPoint2Chromosome2 = 4 * randi([1, upperLimit2]);

    if crossoverPoint2Chromosome2 < crossoverPoint1Chromosome2
        tempPoint = crossoverPoint2Chromosome2; 
        crossoverPoint2Chromosome2 = crossoverPoint1Chromosome2; 
        crossoverPoint1Chromosome2 = tempPoint; 
    end

    % cutSectionChromosome1 = crossoverPoint2Chromosome1 - crossoverPoint1Chromosome1;
    % cutSectionChromosome2 = crossoverPoint2Chromosome2 - crossoverPoint1Chromosome2;

    partI = individual1(1:crossoverPoint1Chromosome1);
    partII = individual2(crossoverPoint1Chromosome2+1 : crossoverPoint2Chromosome2);
    partIII = individual1(crossoverPoint2Chromosome1+1 : end);


    if crossoverPoint1Chromosome2 == crossoverPoint2Chromosome2
        newIndividual1 = [partI, partIII]; 
    else
        newIndividual1 = [partI, partII, partIII]; 

    end

    partI = individual2(1:crossoverPoint1Chromosome2); 
    partII = individual1(crossoverPoint1Chromosome1+1 : crossoverPoint2Chromosome1);
    partIII = individual2(crossoverPoint2Chromosome2+1 : end);


    if crossoverPoint1Chromosome1 == crossoverPoint2Chromosome1
        newIndividual2 = [partI, partIII]; 
    else
        newIndividual2 = [partI, partII, partIII]; 
    end


end
