% Nume, Prenume, Grupa

function [R1 R2] = PageRank(nume, d, eps)
	% Calculeaza indicii PageRank pentru cele 3 cerinte
	% Scrie fisierul de iesire nume.out
  file = fopen(nume, 'r');
   
   number_nodes = fscanf(file ,"%d", 1);
   for i =1:number_nodes
     node(i) = fscanf(file, "%d", 1);
     number_iteration(i) = fscanf(file, "%d", 1);
     for j = 1:number_iteration(i)
        A(i,j) = fscanf(file, "%d", 1);
     endfor
   endfor
   
   val1 = fscanf(file, "%f", 1);
   val2 = fscanf(file, "%f", 1);
   fclose(file);
  
	filename = nume;
  fid = fopen(strcat(filename, '.out'), "w");
  R1 = Iterative(nume, d, eps);
  [n m] = size(R1);
  fprintf(fid,"%d\n",n);
  R2 = Algebraic(nume,d,eps); 
  
  for i = 1:n
    fprintf(fid,"%f\n",R1(i));
  endfor
  fprintf(fid, "\n");
  [n m] = size(R2);
  
   for i = 1:n
    fprintf(fid,"%f\n",R2(i));
    vector(i) = i;
   endfor
   
   for i = 1:n-1
     for j = 1:n-1 
       if R2(j) <= R2(j+1)
         aux = R2(j);
         R2(j) = R2(j+1);
         R2(j+1) = aux;
         
         swap = vector(j);
         vector(j) = vector(j+1);
         vector(j+1) = swap;
         %sortez R2 si in acelasi timp schimb si ordinea indicilor paginilor 
       endif
       endfor
     endfor
     
     for i = 1:n
     u(i) = Apartenenta(R2(i), val1, val2);
   endfor
  
      
   
   fprintf(fid, "\n");
   
   for i = 1:n
     fprintf(fid,"%d ", i);
     fprintf(fid, "%d ", vector(i));
     fprintf(fid,"%f\n",u(i));
   endfor
   
  fclose(fid);
endfunction