function [Y, InitialMatrix] = parse_csv_file(file_path)
  % path -> a relative path to the .csv file
  
  % Y -> the vector with all actual values
  % InitialMatrix -> the matrix that must be transformed

  % TODO: parse_csv_file implementation

  % Deschid fișierul
  fid = fopen(file_path, 'r');
  if fid == -1
      error("open failed")
  end

  % Trec peste prima linie din fișier
  fgetl(fid);

  % Inițializez matricea și vectorul
  i = 1;
  InitialMatrix = {};
  Y = [];

  while ~feof(fid)
      line = fgetl(fid);
      if isempty(line), continue; end
      cells = strsplit(line, ',');
      
      % Pun în vector prima valoare din cells și in matrice restul valorilor
      Y(i, 1) = str2double(cells{1});

      InitialMatrix(i, :) = cells(2:end);
      i = i + 1;
  end
  fclose(fid);
end
