function y_prime = SigmoidPrime(x)
    y_prime = Sigmoid(x)*(1-Sigmoid(x));
end