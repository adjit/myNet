function y_prime = SigmoidPrime(x)
    sX = Sigmoid(x);
    y_prime = sX*(1-sX);
end