% RATA, Andrei, 313CD

function B = GramSchmidt(A)
	% Functia care calculeaza inversa matricii A folosind factorizari Gram-Schmidt
	% Se va inlocui aceasta linie cu descrierea algoritmului de inversare
  [m n]=size(A);
  B = zeros(m);
	Q = A;
	R = zeros(m,n);
	for k = 1:n
		R(k,k) = norm(Q(1:m,k));
		Q(1:m,k) = Q(1:m,k) / R(k,k);
	   for j = k+1:n
		R(k,j) = Q(1:m,k)' * Q(1:m,j);
		Q(1:m,j) = Q(1:m,j) - Q(1:m,k) * R(k,j);
	   endfor
	endfor 
 %pana aici este GramSchmidt
  I = eye(m);
  x = zeros(m,1);
  Q = Q';
  b = zeros(m,1);
  for k = 1:n
    b = Q*I(:,k);
  for l = m : -1 : 1
    s = 0;
    for c = n: -1 :(i + 1)
       s = s + R(l,c)*x(c);
    endfor
    x(l) = (b(l) - s)/ R(l,l);    
    %aici rezolv un sistem superior triunghiular folosind formula specifica;
  endfor
  B(:,k)= x;
  x = zeros(m,1);
  endfor
endfunction  