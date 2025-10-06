function [Error] = linear_regression_cost_function(Theta, Y, FeatureMatrix)
  % Theta -> the vector of weights
  % Y -> the vector with all actual values
  % FeatureMatrix -> the matrix with all training examples

  % Error -> the error of the regularized cost function

  % TODO: linear_regression_cost_function implementation
  m = size(Y, 1);
  
  % Calculez predicțiile
  predictions = FeatureMatrix * Theta(2:size(Theta, 1));

  % Calculez erorile pătrate
  errors = (predictions - Y).^2;
  total_err = 0;
  for i = 1:m
      total_err = total_err + errors(i);
  end

  % Costul
  Error = total_err / (2 * m);
end
