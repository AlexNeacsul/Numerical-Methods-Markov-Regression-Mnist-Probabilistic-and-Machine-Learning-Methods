function [Theta] = normal_equation(FeatureMatrix, Y, tol, iter)
  % FeatureMatrix -> the matrix with all training examples
  % Y -> the vector with all actual values
  % tol -> the learning rate
  % iter -> the number of iterations
  % tol -> the tolerance level for convergence of the conjugate gradient method

  % Theta -> the vector of weights
  
  % TODO: normal_equation implementation

  % Salvez dimensiunile matricei
  [m, n] = size(FeatureMatrix);

    % Construiesc sistemul A * Theta = b
    A = FeatureMatrix' * FeatureMatrix;
    b = FeatureMatrix' * Y;

    % Verific dacă A este pozitiv definită
    if any(eig(A) <= 0)
        Theta = zeros(n, 1);
        return;
    end

    % Inițializări pentru metoda gradientului conjugat
    Theta = zeros(n, 1);
    r = b - A * Theta;
    p = r;
    rs_old = r' * r;

    % Aplic algoritmul
    for i = 1:iter
        Ap = A * p;
        alpha = rs_old / (p' * Ap);

        Theta = Theta + alpha * p;
        r = r - alpha * Ap;

        rs_new = r' * r;

        if sqrt(rs_new) < tol
            break;
        end

        beta = rs_new / rs_old;
        p = r + beta * p;
        rs_old = rs_new;
    end

    % Inserez Theta0 la început
    Theta = [0; Theta];
end
