% Mapeamento da Area 1 incluindo trechos sem acessibilidade

%pode_ir(? Origem, ? Destino, - Custo)
pode_ir(saidaArq, onibus, 107.37).
    pode_ir(onibus, cefer, 323.13).
        pode_ir(cefer, restaurante, 178.46).
        pode_ir(cefer,sel, 71.4).
pode_ir(saidaArq, iqsc, 305.76).
    pode_ir(iqsc, cefer, 216.67). %medida passando pelo centrinho
    pode_ir(iqsc, restaurante, 463.49).

pode_ir(matematica, biblioICMC, 196.85).
pode_ir(matematica, biblioEESC, 149.93).
pode_ir(matematica, restaurante, 260.91).
    pode_ir(restaurante, biblioEESC, 137.0).
        pode_ir(biblioEESC, biblioICMC, 294.95).

podeIr(X,Z, C) :- pode_ir(X,Z, C) | pode_ir(Z,X, C).

%pode_ir(saidaFisica, ifsc, 422.90). %medida da saida ate o %predio administrativo do ifsc passando pela escada do E1
%pode_ir(ifsc, e1, 105.37).
%pode_ir(e1, restaurante, 196.54).
%pode_ir(e1, biblioEESC, 205.57).
%pode_ir(e1, biblioICMC, 253.22).
%pode_ir(e1, campoEscada2, 306.05). %medida ate o topo da escada para descer pro campoEscada2
%pode_ir(saidaProd, ifsc, 345.26).
%pode_ir(iqsc, campoEscada2, 288.27). %medida ate o topo da escada %para descer pro campoEscada2
%pode_ir(campoEscada2, restaurante, 119.81).
%pode_ir(sel, iqsc, 255.64).
%pode_ir(sel, campoEscada2, 95.78).
%pode_ir(sel, restaurante, 124.68). %passando pelo degrau do lado do bandeco


