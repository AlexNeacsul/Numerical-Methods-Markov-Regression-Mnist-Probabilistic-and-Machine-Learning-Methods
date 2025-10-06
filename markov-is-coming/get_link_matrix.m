function [Link] = get_link_matrix (Labyrinth)
	% Labyrinth -> the matrix of all encodings
  
  % Link -> the link matrix associated to the given labyrinth
  
  % TODO: get_link_matrix implementation
  
  % Salvez dimensiunile matricei și matricea de adiacență
  [m, n] = size(Labyrinth);
  adj_size = m * n + 2;
  vec = zeros(1, adj_size);
  Adj = full(get_adjacency_matrix(Labyrinth));

  % Număr câte valori sunt pe fiecare rând și le salvez într-un vector
  for i = 1:adj_size
      for j = 1:adj_size
          if Adj(i, j) == 1
              vec(i) = vec(i) + 1;
          end
      end
  end
    
  % Pe fiecare linie din matricea de adiacență împart la numarul de valori
  % corespunzător
  for i = 1:adj_size
      for j = 1:adj_size
          Adj(i, j) = Adj(i, j) / vec(i);
      end
  end
    
  % Salvez matricea sub forma unei matrici rare
  Link = sparse(Adj);
end
