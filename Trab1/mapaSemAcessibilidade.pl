% Mapeamento da Area 1 incluindo trechos sem acessibilidade

%pode_ir(? Origem, ? Destino, - Custo)
pode_ir(saidaArq, onibus, 107.37).
    pode_ir(onibus, cefer, 323.13).
        pode_ir(cefer, degrauRestaurante, 100.92).
            pode_ir(degrauRestaurante, restaurante, 45.55).
        pode_ir(cefer, sel, 71.4).
        pode_ir(cefer, campoEscada1, 144.01).

pode_ir(saidaArq, iqsc, 305.76).
    pode_ir(iqsc, cefer, 200.47). %medida passando pelo centrinho
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
