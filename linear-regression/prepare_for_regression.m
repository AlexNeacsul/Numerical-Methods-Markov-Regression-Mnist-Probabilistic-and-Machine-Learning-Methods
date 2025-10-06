function [FeatureMatrix] = prepare_for_regression(InitialMatrix)
  % InitialMatrix -> the matrix that must be transformed

  % FeatureMatrix -> the matrix with all training examples
  
  % TODO: prepare_for_regression implementation

  % Salvez dimensiunile matricei și inițializez matricea
  [m, n] = size(InitialMatrix);
  FeatureMatrix = [];

  for i = 1:m
      row = [];
      for j = 1:n
          % Verific valoarea din matricea inițială și daca este un număr
          % atunci pun direc valoarea in matrice dacă nu pun codificarea
          % specifică
          val = InitialMatrix{i, j};
          num = str2double(val);
          if isnumeric(val)
              row = [row, val];
          elseif ~isnan(num)
              row = [row, num];
          elseif strcmp(val, "yes")
              row = [row, 1];
          elseif strcmp(val, "no")
              row = [row, 0];
          elseif strcmp(val, "furnished")
              row = [row, 0, 0];
          elseif strcmp(val, "unfurnished")
              row = [row, 0, 1];
          elseif strcmp(val, "semi-furnished")
              row = [row, 1, 0];
          end
      end
      FeatureMatrix = [FeatureMatrix; row];
  end
end
