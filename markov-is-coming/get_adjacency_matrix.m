function [Adj] = get_adjacency_matrix (Labyrinth)
	% Labyrinth -> the matrix of all encodings
  
  % Adj -> the adjacency matrix associated to the given labyrinth
  
  % TODO: get_adjacency_matrix implementation

  % Salvez dimensiunile matricei și inițializez matricea de adiacență
  [m, n] = size(Labyrinth);
  Adj = zeros(m * n + 2);
  
  % Mă asigur că WIN si LOSE sunt adiacente cu ele
  Adj(m * n + 1, m * n + 1) = 1;
  Adj(m * n + 2, m * n + 2) = 1;
    
  for i = 1:m
      for j = 1:n
          % Salvez nodul curent și decodez valoarea lui în biți
          node = (i - 1) * n + j;
          bits = dec2bin(Labyrinth(i, j), 4) - '0';
          
          % Verific pentru fiecare bit valoarea și tratez corner case-urile
          if bits(1) == 0
              if i == 1
                  Adj(node, m * n + 1) = 1;
              else
                  ngh = node - n;
                  Adj(node, ngh) = 1;
                  Adj(ngh, node) = 1;
              end
          end
    
          if bits(2) == 0
              if i == m
                  Adj(node, m * n + 1) = 1;
              else
                  ngh = node + n;
                  Adj(node, ngh) = 1;
                  Adj(ngh, node) = 1;
              end
          end
    
          if bits(3) == 0
              if j == n
                  Adj(node, m * n + 2) = 1;
              else
                  ngh = node + 1;
                  Adj(node, ngh) = 1;
                  Adj(ngh, node) = 1;
              end
          end
    
          if bits(4) == 0
              if j == 1
                  Adj(node, m * n + 2) = 1;
              else
                  ngh = node - 1;
                  Adj(node, ngh) = 1;
                  Adj(ngh, node) = 1;
              end
          end
      end
  end
  % Transform matricea într-o matrice rară
  Adj = sparse(Adj);
end
