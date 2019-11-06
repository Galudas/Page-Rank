% RATA, ANDREI, 313CD

function R = Iterative(nume, d, eps)
  
   file = fopen(nume);
   number_nodes = fscanf(file ,"%d", 1);

   for i =1:number_nodes
     node(i) = fscanf(file, "%d", 1);
     number_iteration(i) = fscanf(file, "%d", 1);
     for j = 1:number_iteration(i)
        A(i,j) = fscanf(file, "%d", 1);
     endfor
   endfor
   p = 1;
   %pana aici se realizeaza citirea matricii de adiacenta 
   maxim = max(number_iteration);
   for m = 1:number_nodes
     for n = 1:maxim
       if m == A(m,n)
         special(p) = A(m,n);
         p = p+1;
        endif
      endfor
     endfor
    
    k = 1;
   for i = 1:number_nodes
     valoare = 1/number_iteration(i);
     valoare_noua = 1/(number_iteration(i)-1); % in cazul in care o pagina pointeaza 
                                                %catre ea insasi
     for j = 1:number_iteration(i)
       inserat = A(i,j);
        if k < p
         if i == special(k) 
           
            valoare = valoare_noua;
            k = k+1;
            %aici se verifica la fiecare iteratie daca pagina curenta 
            %pointeaza catre ea insasi, in vectorul 'special ' 
            %fiind paginile de acest gen
         endif
         endif     
   
          M(i,inserat) = valoare;
       
     endfor
     M(i,i) = 0; % 0 pe diagonala pentru a respecta conditiile 
   endfor
   
   val1 = fscanf(nume, "%f");
   val2 = fscanf(nume, "%f");
   for i = 1:number_nodes
    R(i,1) = 1/number_nodes;
   endfor;
   vect_col = ones(number_nodes,1);
   R_pas_anterior = R;
  
   do 
     
        R_pas_anterior = R;
        R = d*M'*R_pas_anterior + [(1-d)/number_nodes]*vect_col; % aici am pus M' deoarece eu am facut din greseala ca suma pe linii sa fie 1 

        norma = norm(R-R_pas_anterior);
    until abs(norma) < eps
    R = R_pas_anterior;
    
    fclose(file);
endfunction
	% Functia care calculeaza matricea R folosind algoritmul iterativ.
	% Intrari:
	%	-> nume: numele fisierului din care se citeste;
	%	-> d: coeficentul d, adica probabilitatea ca un anumit navigator sa continue navigarea (0.85 in cele mai multe cazuri)
	%	-> eps: eruarea care apare in algoritm.
	% Iesiri:
	%	-> R: vectorul de PageRank-uri acordat pentru fiecare pagina.
	