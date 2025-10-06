function [G, c] = get_Jacobi_parameters (Link)
	% Link -> the link matrix (edge with probabilities matrix)
	
  % G -> iteration matrix
	% c -> iteration vector
	
  % TODO: get_Jacobi_parameters

  % Salvez dimensiunile matricei și salvez matricea și vectorul de iterație
  % conform cerinței
  [m, n] = size(Link);
  A = full(Link);
  G = A(1:m - 2,1: n - 2);
  c = A(1:m - 2, n - 1);
  G = sparse(G);
  c = sparse(c);
end
