<h2>Iterative:</h2>
	Dupa deschiderea fisiearului, incepe citirea acestuia. Datele din fisier se citesc in aceasta ordine: numarul de pagini, numarul de linkuri si paginile care pointeaza catre pagina indice.
	
	Cu datele citite se creaza o matrice de adiacenta urmand formarea matricii M ce reprezinta un prim pas in gasirea pagerankului. Daca matricea are indicii i si j , pe coloana fiecare coloana j se pune 1/(numarul de linkuri catre pagina j) pe pozitiile i specifice . 'j' reprezinta o pagina de web , iar 'i' reprezinta o pagina care are link catre 'j'. 

	Bineinteles, se ia in considerare ca pe diagonala principala sa fie 0. In acest caz, se retine in vectorul 'special' paginile care linkuri catre ele insele, calculandu-se o 
	valoare noua egala cu 1/(numarul de linkuri catre pagina j - 1).
	
	In final, cu ajutorul recurentei din enunt se obtine pagerankul.

<h2>Algebraic:</h2>
	Se respecta aceiasi pasi ca la Iterative ,fiind diferita relatia de recurenta. Aceasta relatie implica si calculu unei inverse ce se realizeaza cu ajutorul algoritmului GramSchmidt. Cu ajutorul acestui algoritm se obtine descompunerea QR a unei matrici. In final ramane de rezolvat un sistem cu o matrice superior triunghiular, rezultatul reprezentand inversa matricii data ca input.

<h2>Apartenenta:</h2>
	Cu ajutorul lui val1 si val2 citite din fisier se calculeaza gradul de apartenenta al paginilor prin verificarea continuitatii unei anumite functii. Se presupune ca functia ar fi continua pentru obtinerea unui lui a si b .

<h2>PageRank:</h2>
	Sunt apelate functiile pentru scrierea in fisier , insa pentru Apartenenta.m, vectorul R2 este mai intai sortat folosind BubbleSort. 