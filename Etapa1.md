

# Variação de desempenho de subsistema no Emulador RPCS3 por variação de paralelização, extensões vetoriais e arquiteturas diversas

## Integrantes:
Erick Schultz Ceresa, Miguel Abichequer, Victor Furusho Vally

## Objeto computacional:
Emulador RPCS3 emulando arquitetura Cell Broadband Engine dos Playstation 3 em CPUs x86_64.

### A Cell Broadband Engine
A CPU do Playstation 3 é chamada de Cell Broadband Engine. Ela consiste em um processador principal, chamado de Power Processing Unit ou PPU e oito Synergistic Processing Elements, ou SPEs.
A PPU é responsável por comandar as SPEs, que são especializadas em tarefas vetoriais de banda larga (até 128 bits).

![CellBE](https://upload.wikimedia.org/wikipedia/commons/3/34/CELL_BE_processor_PS3_board.jpg)

### RPCS3
O RPCS3 é um emulador de código aberto desenvolvido para processadores x86_64.
Para emular a Cell Broadband Engine, é necessário a utilização de artifícios modernos da arquitetura x86_64, visto que a CPU sendo emulada é muito exótica.

![RPCS3](https://upload.wikimedia.org/wikipedia/commons/1/1d/RPCS3_vector_logo.svg)

## Objetivos:
Medir o desempenho da emulação de um Playstation 3 usando o emulador RPCS3.
Verificar o escalonamento da performance em relação ao número de núcleos, extensões vetoriais (AVX512) e arquitetura de processador host (AMD Zen5, Intel Comet Lake, Intel Coffee Lake, Intel Broadwell).

<!--newpage-->
## Métricas
Medição das seguintes métricas:
- Tempo de execução de PPU e SPEs usando biblioteca chrono (modificação do código fonte).
- Frametime em ms total.
- Porcentagem velocidade da emulação (100% = Tempo real)

## Métodos de análise:
- Modificação do código fonte para fazer output de métricas de tempo e frametime
- Testes em arquiteturas variadas (Intel, AMD)
- Testes com número de núcleos variádos
- Testes com AVX512 vs AVX256

Jogo: The Last of Us (Mais pesado na CPU)
- 5 execuções para cada área fixa
- Compartilhamento de save-states se possível

![TLOU](https://upload.wikimedia.org/wikipedia/en/a/a6/The_Last_of_Us_Listen_Mode.jpg)

## Métodos de registro e cálculo
Fork do emulador (RPCS3) modificado
- Output de métricas do emulador para um arquivo

Sistema operacional NixOS
- Script de setup (Nix e buid do emulador)

Notebook para processamento dos dados e geração de gráficos junto com anotações

### Uso de IA:
Sugestão de jogo com workload intenso e reprodutível (ChatGPT 5 Free)
