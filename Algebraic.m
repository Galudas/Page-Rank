% RATA, Andrei, 313CD

function R = Algebraic(nume, d)
	% Functia care calculeaza vectorul PageRank folosind varianta algebrica de calcul.
	% Intrari: 
	%	-> nume: numele fisierului in care se scrie;
	%	-> d: probabilitatea ca un anumit utilizator sa continue navigarea la o pagina urmatoare.
	% Iesiri:
	%	-> R: vectorul de PageRank-uri acordat pentru fiecare pagina.
  
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
     valoare_noua = 1/(number_iteration(i)-1);
     for j = 1:number_iteration(i)
       inserat = A(i,j);
        if k < p
         if i == special(k) 
            valoare = valoare_noua;
            k = k+1;
         endif
         endif     
      
      
          M(i,inserat) = valoare;
       
     endfor
     M(i,i) = 0;
   endfor
   
   %pana aici se creaza din nou matricea M ca la iterative
  
   
   vect_col = ones(number_nodes,1);
   A = eye(size(M)) - d * M';
   B = GramSchmidt(A);
   R = B*[(1-d)/number_nodes]*vect_col;
   
   val1 = fscanf(file, "%f", 1);
   val2 = fscanf(file, "%f", 1);
   
  
   
    
    
    fclose(file);
endfunction