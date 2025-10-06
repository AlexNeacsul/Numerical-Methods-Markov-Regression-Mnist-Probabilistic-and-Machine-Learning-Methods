function [Labyrinth] = parse_labyrinth(file_path)
	% file_path -> the relative path to a file that needs to
  %              be loaded_graphics_toolkits
  
  % Labyrinth -> the matrix of all encodings for the labyrinth's walls
  
  % TODO: parse_labyrinth implementation
  
  % Deschid fișierul din care citesc
  fid = fopen(file_path, "r");
  if fid == -1
      error('open failed')
  end

  % Citesc întai dimensiunile
  m = fscanf(fid, '%d', 1);
  n = fscanf(fid, '%d', 1);

  % Inițializez matricea cu 0
  Labyrinth = zeros(m , n);

  % Citesc matricea element cu element
  for i = 1:m
      for j = 1:n
          Labyrinth(i, j) = fscanf(fid, '%d', 1);
      end
  end

  % Închid fișierul
  fclose(fid);
end
