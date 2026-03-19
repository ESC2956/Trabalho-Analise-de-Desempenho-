# Trabalho Análise de Desempenho

**Integrantes:**
Erick Schultz Ceresa, Miguel Abichequer


---

**Objeto Computacional:RPCS3**
O RPCS3 é um emulador e debbuger de plataforma múltipla e open-source escrito em C++ do Plastation 3. 

É altamente dependente da CPU.


---

**Métodos de análise**
Utilizar ferramenta própria do RPCS3 chamada de Performace Overlay: Mostra informações de PPU SPU FPS.


---

**Métricas**

Medir tempo de execução da emulação da PPU e das SPUs relativo ao escalonamento por core.

Teste com AVX 512 ligado vs desligado e teste de escalonamento por core em Intel vs AMD