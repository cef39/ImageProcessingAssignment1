function [mean, variance] = meanVariance(f)
    
    %M x N dimensions of image
    MN = size(f);
    
    % normalized histogram of image
    hn = imageHist(f, 'n');
    
    % size of histogram
    dim = size(hn);
    
    % initialize mean
    mean = 0;
    
    % loop through histogram
    % need to multiply each value by its frequency and sum then all up
    % i will be equal the the index of hist (ie the 8 bit intensity value)
    for i = 0: dim(1)-1
        mean = mean + hn(i+1)*i;
    end
       
    mean = mean ./ (MN(1)*MN(2));
    
    % calculate variance by summing up the squares of the difference of
    % each value and the mean
    for i=0: dim(1) - 1
        variance = (hn(i+1) - mean)^2;
    end
    variance = variance ./ (MN(1)*MN(2));

end