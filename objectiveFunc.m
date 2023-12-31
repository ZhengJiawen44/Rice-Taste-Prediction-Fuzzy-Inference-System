function objectiveFunction = objectiveFunc(actualValues, predictedValues)
    
    %claculate rmse for the fis
    sse=0;
    [a,b]=size(predictedValues);
    for i = 1:a
            z = actualValues(i);  
            sse=sse+(predictedValues(i)-z)^2;
    end
    MSE=sse/a;
    objectiveFunction=sqrt(MSE);
    
end