% Definindo a estrutura de dados da fila de prioridades
% fila_vazia([]) define que uma lista vazia é uma fila vazia.
% inserir_na_fila(Estado, [], [Estado]) define que inserir um Estado em uma fila vazia
% resulta em uma fila contendo apenas esse Estado.
% inserir_na_fila(Estado, [Estado1|Resto], [Estado, Estado1|Resto]) define que, se o Estado
% é menor que o primeiro estado na fila (Estado1), então o Estado é inserido no início da fila.
% inserir_na_fila(Estado, [Estado1|Resto], [Estado1|Resto1]) define que, se o Estado não é
% menor que o primeiro estado na fila (Estado1), então o Estado é inserido na posição correta
% na fila.
fila_vazia([]).
inserir_na_fila(Estado, [], [Estado]).
inserir_na_fila(Estado, [Estado1|Resto], [Estado, Estado1|Resto]) :- 
    menor_que(Estado, Estado1), !.
inserir_na_fila(Estado, [Estado1|Resto], [Estado1|Resto1]) :- 
    inserir_na_fila(Estado, Resto, Resto1).

% Comparando o terceiro elemento das tuplas
% menor_que((_, _, Custo1, _), (_, _, Custo2, _)) é verdadeiro se Custo1 é menor que Custo2.
% Isso é usado para ordenar os estados na fila de prioridades.
menor_que((_, _, Custo1, _), (_, _, Custo2, _)) :- Custo1 < Custo2.

% Seu algoritmo A*
% a_estrela(Inicio, Meta, Caminho, CustoTotal) é verdadeiro se existe um Caminho do Inicio à Meta com CustoTotal.
% O algoritmo começa com uma fila de prioridades contendo apenas o estado inicial e um conjunto fechado vazio.
% Em cada passo, ele remove o estado com o menor custo da fila de prioridades, expande esse estado para 
% encontrar todos os estados vizinhos, e insere esses estados na fila de prioridades.
% O algoritmo termina quando a Meta é alcançada.
a_estrela(Inicio, Meta, Caminho, CustoTotal) :-
    fila_vazia(FilaVazia),
    inserir_na_fila((Inicio, [Inicio], 0, 0), FilaVazia, Aberto),
    a_estrela(Aberto, [], Meta, CaminhoReverso, CustoTotal),
    reverse(CaminhoReverso, Caminho).

a_estrela([(Meta, Caminho, Custo, _)|_], _, Meta, Caminho, Custo).
a_estrela([(No, Caminho, Custo, _)|Resto], ConjuntoFechado, Meta, CaminhoFinal, CustoFinal) :-
    findall(
        (Filho, [Filho|Caminho], NovoCusto, CustoTotal),
        (podeir(No, Filho, CustoAresta), \+ member(Filho, Caminho), 
            NovoCusto is Custo + CustoAresta, heuristica(Filho, Meta, Heuristica), 
            CustoTotal is NovoCusto + Heuristica),
        Filhos
    ),
    inserir_todos(Filhos, Resto, NovoAberto),
    a_estrela(NovoAberto, [No|ConjuntoFechado], Meta, CaminhoFinal, CustoFinal).

% Inserindo todos os estados na fila de prioridades
% inserir_todos([Estado|Estados], Aberto, NovoAberto) é verdadeiro se, após inserir todos os Estados na fila 
% de prioridades Aberto, a nova fila de prioridades é NovoAberto.
inserir_todos([Estado|Estados], Aberto, NovoAberto) :-
    inserir_na_fila(Estado, Aberto, Temp),
    inserir_todos(Estados, Temp, NovoAberto).
inserir_todos([], Aberto, Aberto).