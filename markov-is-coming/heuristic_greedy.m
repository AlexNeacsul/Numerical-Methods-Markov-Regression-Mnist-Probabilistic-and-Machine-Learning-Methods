    function [path] = heuristic_greedy (start_position, probabilities, Adj)
	% start_position -> the starting point in the labyrinth
	% probabilities -> vector of associated probabilities: including WIN and LOSE
	% Adj -> adjacency matrix
	
	% path -> the states chosen by the algorithm
  
  % TODO: heuristic_greedy implementation

  % Salvez dimensiunea matricei si inițializez vectorul de visited cu false
  n = size(Adj, 1);
  visited = false(1, n);
    
  % Inițializez path cu 0 si setez poziția de start
  path = zeros(1, n);
  path(1) = start_position;
  idx = 1;
    
  % Modific starea poziției de start in visited
  visited(start_position) = true;
    
  WIN = n - 1;
  position = start_position;
    
  while position ~= WIN
      % Salvez toți vecinii nevizitați
      neighbors = find(Adj(position, :) > 0 & ~visited);
        
      % Dacă nu avem vecini intoarcem path-ul
      if isempty(neighbors)
          path = path(1:idx);
          return;
      end
        
      % Selectăm vecinul cu cea mai mare probabilitate
      [~, neighbor_idx] = max(probabilities(neighbors));
      next_node = neighbors(neighbor_idx);
        
      visited(next_node) = true;
      idx = idx + 1;
      path(idx) = next_node;
      position = next_node;
  end
    
  path = path(1:idx);
  path = path';
end
