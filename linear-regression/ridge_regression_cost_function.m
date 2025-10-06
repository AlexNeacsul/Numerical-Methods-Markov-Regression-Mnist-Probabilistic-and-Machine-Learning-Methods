function [Error] = ridge_regression_cost_function(Theta, Y, FeatureMatrix, lambda)
  % Theta -> the vector of weights
  % Y -> the vector with all actual values
  % FeatureMatrix -> the matrix with all training examples
  % lambda -> regularization parameter that controls the amount of 
  %           shrinkage applied to the regression coefficients

  % Error -> the error of the regularized cost function

  % TODO: ridge_regression_cost_function implementation
  m = size(Y, 1);
  n = size(Theta, 1);

  % Calculez predicțiile
  predictions = FeatureMatrix * Theta(2:size(Theta, 1));

  % Calculez erorile pătrate
  errors = (Y - predictions).^2;
  total_err = 0;
  for i = 1:m
      total_err = total_err + errors(i);
  end

  % Calculez pătratele pentru vectorul de weights
  theta_sum = 0;
  for j = 2:n
      theta_sum = theta_sum + Theta(j).^2; 
  end

  % Costul
  Error = (total_err / (2 * m)) + lambda * theta_sum;
end
