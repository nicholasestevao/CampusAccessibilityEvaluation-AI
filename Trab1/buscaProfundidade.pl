%Busca em profundidade 

viagemEntre(Origem, Destino, Caminho, Custo):- caminho(Origem, [Destino], Caminho), calculaCusto(Caminho, Custo).

caminho(I, [I|Cam], [I|Cam]):- !.
caminho(I, [UltEst|CamAteAgora], Cam):- 
            podeIr(X, UltEst, _), 
            not(pertence(X,CamAteAgora)), 
            caminho(I, [X,UltEst|CamAteAgora], Cam).

calculaCusto([_], 0).
calculaCusto([X|[Y]], Custo):- podeIr(X,Y,Custo).
calculaCusto([X, Y|Cauda], Soma):- podeIr(X,Y, Custo), calculaCusto([Y|Cauda], CustoCauda), Soma is Custo + CustoCauda.

%pertence(X, Lista).
pertence(X, [X | _]) :- !.
pertence(X, [Y | Resto]) :- X \= Y, pertence(X,Resto).

