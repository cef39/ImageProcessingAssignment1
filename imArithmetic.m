function [ g ] = imArithmetic(f1, f2, op)

switch op
    case 'add'
        g = f1 + f2;
    case 'subtract'
        g = f1 - f2;
    case 'multiply'
        g = f1 .* f2;
    case 'divide'
        g = f1 ./ f2;
    otherwise
        disp('Not a supported function. Please use "add", "subtract", "multiply", or "divide"')
        g = zeros(size(f1));
        return;
end

% min(g) return array of min values in each column so need to calculate min
% again to find min of matrix

gm = g - min(min(g));

% scale image
gs = 255*(gm./max(max(gm)));

g = gs;

        