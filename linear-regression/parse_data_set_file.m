function [Y, InitialMatrix] = parse_data_set_file(file_path)
  % path -> a relative path to the .txt file

  % Y -> the vector with all actual values
  % InitialMatrix -> the matrix that must be transformed
  
  % TODO: parse_data_set_file implementation

  % Deschid fișierul
  fin = fopen(file_path, 'r');
  if fin == -1
      error("open failed")
  end

  % Citesc dimensiunile matricei și o inițializez drept cell pentru a putea
  % citi toate valorile din fișier
  m = fscanf(fin, '%d', 1);
  n = fscanf(fin, '%d', 1);
  InitialMatrix = cell(m, n);
  Y = zeros(m, 1);
  
  for i = 1:m
      % Prima valoare de pe coloana citită o pun mereu in vector
      Y(i) = fscanf(fin, '%d', 1);
      for j = 1:n
          % Citesc datele si verific dacă sunt numere sau stringuri apoi le
          % pun în matrice
          data = fscanf(fin, '%s', 1);
          num = str2double(data);
          if isnan(num)
              InitialMatrix(i, j) = data;
          else
              InitialMatrix(i, j) = num;
          end
      end
  end
  fclose(fin);
end
