function [X_train, y_train, X_test, y_test] = split_dataset(X, y, percent)
  % X -> the loaded dataset with all training examples
  % y -> the corresponding labels
  % percent -> fraction of training examples to be put in training dataset
  
  % X_[train|test] -> the datasets for training and test respectively
  % y_[train|test] -> the corresponding labels
  
  % Example: [X, y] has 1000 training examples with labels and percent = 0.85
  %           -> X_train will have 850 examples
  %           -> X_test will have the other 150 examples

  % TODO: split_dataset implementation
  
  % Numărul de elemente
  m = size(X, 1);

  % Amestec datele (permutăm rândurile)
  perm = randperm(m);

  % Indicii pentru train și test
  train = perm(1:floor(m * percent));
  test = perm(floor(m * percent) + 1:end);

   %Populăm output-urile cu indicii corespunzători
  X_train = X(train, :);
  X_test = X(test, :);
  y_train = y(train);
  y_test = y(test);


end
