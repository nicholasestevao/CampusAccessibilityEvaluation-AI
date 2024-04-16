pode_ir(portArq, onibus, 107.37).
pode_ir(onibus, cefer, 323.13).
pode_ir(portArq, restaurante, 707.15).
pode_ir(cefer, restaurante, 178.46).
pode_ir(restaurante, aquario, 116.78).
pode_ir(restaurante, biblioEESC, 135.96).
pode_ir(aquario, biblioEESC, 11.79).
pode_ir(aquario, icmc5, 81.68).
pode_ir(biblioEESC, icmc5, 76.11).
pode_ir(icmc5, icmc1, 139.86).
pode_ir(icmc5, icmc6, 101.3).
pode_ir(icmc1, icmc4, 116.59).
pode_ir(icmc1, icmc3, 93.84).
pode_ir(icmc3, biblioICMC, 53.17).
pode_ir(icmc1, biblioICMC, 42.20).


viagemEntre(Origem, Destino, Caminho, Custo):- caminho(Origem, [Destino], Caminho), calculaCusto(Caminho, Custo).

caminho(I, [I|Cam], [I|Cam]):- !.
caminho(I, [UltEst|CamAteAgora], Cam):- 
            pode_ir(X, UltEst, _), 
            not(pertence(X,CamAteAgora)), 
            caminho(I, [X,UltEst|CamAteAgora], Cam).

calculaCusto([_], 0).
calculaCusto([X|[Y]], Custo):- pode_ir(X,Y,Custo).
calculaCusto([X, Y|Cauda], Soma):- pode_ir(X,Y, Custo), calculaCusto([Y|Cauda], CustoCauda), Soma is Custo + CustoCauda.

%pertence(X, Lista).
pertence(X, [X|_]):- !.
pertence(X, [Y| Lista]):- X \= Y, pertence(X, Lista).

