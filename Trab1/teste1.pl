% Mapeamento da Area 1 incluindo trechos sem acessibilidade

%pode_ir(? Origem, ? Destino, - Custo)
pode_ir(saidaArq, onibus, 107.37).
    pode_ir(onibus, cefer, 323.13).
        pode_ir(cefer, degrauRestaurante, 100.92).
            pode_ir(degrauRestaurante, restaurante, 45.55).
        pode_ir(cefer, sel, 71.4).
        pode_ir(cefer, campoEscada1, 144.01).

pode_ir(saidaArq, iqsc, 305.76).
    pode_ir(iqsc, cefer, 216.67). %medida passando pelo centrinho
    pode_ir(iqsc, campoEscada1, 89.52).
        pode_ir(campoEscada1, campoEscada2, 225.29). %Por dentro do campo
            pode_ir(campoEscada2, degrauRestaurante, 80.65).
            pode_ir(campoEscada2, escadaSel, 94.78).
                pode_ir(escadaSel, sel, 21.2).
                pode_ir(escadaSel, restaurante, 168.98).
            pode_ir(campoEscada2, restaurante, 134.53).

pode_ir(matematica, biblioICMC, 196.85).
pode_ir(matematica, biblioEESC, 149.93).
pode_ir(matematica, restaurante, 260.91).
    pode_ir(restaurante, biblioEESC, 137.0).
        pode_ir(biblioEESC, biblioICMC, 294.95).
        pode_ir(biblioEESC, escadaBloco5, 54.12).
            pode_ir(escadaBloco5, biblioICMC, 114.92).

podeIr(X,Z, C) :- pode_ir(X,Z, C) | pode_ir(Z,X, C).



%----%
%CAMINHOS ACESSÍVEIS
pode_ir(saidaArq, onibus, 107.37).
pode_ir(onibus, cefer, 323.13).
pode_ir(cefer, restaurante, 178.46). %caminho por fora
pode_ir(saidaArq, iqsc, 305.76).
pode_ir(iqsc, cefer, 200.47). %caminho pela praça
pode_ir(iqsc, restaurante, 463.49). %caminho por fora
pode_ir(cefer, sel, 71.44).
pode_ir(restaurante, biblioEESC, 137.00).
pode_ir(restaurante, matematica, 260.91).
pode_ir(biblioEESC, matematica, 149.93).
pode_ir(biblioICMC, matematica, 196.85).
pode_ir(restaurante, biblioICMC, 362.99). %Subindo a rua da praça.


%CAMINHOS NÃO ACESSIVEIS:

pode_ir(iqsc, degrauRestaurante, 432.1). %caminho por fora e pelo degrau do restaurante.
pode_ir(escadaSel, degrauRestaurante, 68.64).
pode_ir(escadaSel, campoEscada1, 335.7).

pode_ir(escadaSel, iqsc, 461.64).
pode_ir(campoEscada1, restaurante, 367.32). %Contornando por fora do campo e indo por fora do restaurante
pode_ir(campoEscada1, degrauRestaurante, 319.03).

 %Por fora do campo
pode_ir(campoEscada2, cefer, 190.88). %Por dentro do campo
pode_ir(campoEscada2, iqsc, 363.06). %Contornando por fora do campo.



%GERA REDUNDANCIA:
%cefer-campoEscada1-restaurante.
%iqsc-campoEscada1-restaurante.



podeIr(X,Z, C) :- pode_ir(X,Z, C) | pode_ir(Z,X, C).
