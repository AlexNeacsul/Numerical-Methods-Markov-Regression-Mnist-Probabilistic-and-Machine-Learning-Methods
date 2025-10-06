function [Theta] = gradient_descent(FeatureMatrix, Y, n, m, alpha, iter)
  % FeatureMatrix -> the matrix with all training examples
  % Y -> the vector with all actual values
  % n -> the number of predictors
  % m -> the number of trainings
  % alpha -> the learning rate
  % iter -> the number of iterations

  % Theta -> the vector of weights

  % TODO: gradient_descent implementation
  Theta = zeros(n, 1);

  for i = 1:iter
      % Calculez predicțiile
      predictions = FeatureMatrix * Theta;

      % Calculez eroarea
      error = predictions - Y;

      % Actualizez coeficienții
      gradient = (1 / m) * (FeatureMatrix' * error);
      Theta = Theta - alpha * gradient;
  end
  % Adaug Theta0 la început
  Theta = [0; Theta];
end
