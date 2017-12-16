function [y, y_prime] = Sigmoid(x)
    y = 1/(1+exp(-x));
    y_prime = y*(1-y);
end