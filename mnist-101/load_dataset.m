function [X, y] = load_dataset(path)
  % path -> a relative path to the .mat file that must be loaded
  
  % X, y -> the training examples (X) and their corresponding labels (y)
  
  % TODO: load_dataset implementation
  
  % Încărcăm datele din path in data apoi în fiecare output
  data = load(path);
  X = data.X;
  y = data.y;
end
