function [decoded_path] = decode_path (path, lines, cols)
	% path -> vector containing the order of the states that arrived
	% 		 to a winning position
	% lines -> numeber of lines
	% cols -> number of columns
	
	% decoded_path -> vector of pairs (line_index, column_index)
  %                 corresponding to path states
  % hint: decoded_path does not contain indices for the WIN state

  % TODO: decode_path implementation

  decoded_path = zeros(size(path) - 1, 2);
  for i = 1:size(path) - 1
      % Verific dacă indexul din path este un multiplu al lui cols, dacă da
      % atunci ne aflăm pe ultima coloană iar rândul este câtul împărțirii
      if path(i) / cols == floor(path(i) / cols)
          decoded_path(i, :) = [path(i) / cols, cols];
      else
          % Dacă nu este multiplu atunci coloana este restul împarțirii iar
          % randul este aproximarea câtului plus 1
          decoded_path(i, :) = [floor(path(i) / cols) + 1, mod(path(i), cols)];
      end
  end
end
