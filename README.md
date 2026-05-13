--- 
marp: true
size: 16:9
theme: gaia
class: invert
paginate: true
headingDivider: 2 
---

<!--
_class: lead invert gaia
-->
# <!--fit-->Minicurso: Introdução ao desenvolvimento de Jogos.
###### Clique nos titulos para abrir as aulas.
 
# <!--fit-->[Aula 1: Introdução a programação de jogos](https://thiago-o-dev.github.io/courses/docs/lesson-1) 
- Ferramentas que serão utilizadas no curso;
- Diferenças entre game engines;
- Entender a base da programação orientada a objetos em jogos;
- Similaridades entre desenvolvimento de jogos e desenvolvimento BackEnd;
- Herança vs Componentização;
- Introdução a sinais/eventos.

# <!--fit-->[Aula 2: Aprofundamento em padrões de programação](https://thiago-o-dev.github.io/courses/docs/lesson-2)
#### Essa é uma aula pesada mas é conhecimento imprescindível.
- Máquinas de estado;
- Sinais complexos;
- Signal Bus; (comunicação centralizada)
- Singleton/Autoloads;
- O que é ser **stateless ou stateful**.

# <!--fit-->[Aula 3: Introduçao aos efeitos visuais](https://thiago-o-dev.github.io/courses/docs/lesson-3)
- O que são tweens;
- Matemática gráfica;
- Eases e transitions;
- Formulas comuns; (dot product, cross product, etc)
- Aplicaçoes interessantes;
- O que sao shaders;
- Entendendo a GPU e a CPU.

# <!--fit-->[Aula 4: Como planejar o seu próprio jogo?](https://thiago-o-dev.github.io/courses/docs/lesson-4)
- Recaptulação geral;
- Qual deve ser o foco ao criar o seu jogo;
- Quando criar um GDD; (Game Design Document)
- Como colocar seu jogo na itch.io;
- Como participar de Game.

# Thiago Henrique do **Rego**
- Estou no quinto termo de Ciencia da Computação;
- Trabalho **primariamente** com Backend .NET, mas faço trabalho de banco de dados, admin de sistemas, front e até devOps, sigo vivo felizmente;
- Programador de jogos Unity para empresas como Nestle e Ypê;
- Crio jogos comerciais, as vezes até como animador 2D ou 3D;
- Participo de gamejams normalmente como dev principal.

# <!--fit-->Ferramentas utilizadas na criação do minicurso:
- marp;
- mermaid;
- github pages;
- [marp-to-pages](https://github.com/robalexdev/marp-to-pages/)  (pipeline alterado para rodar aqui, pq eu não queria só renderizar gráficos em build mas em tempo real então renderizo gráficos mermaid via server-side, é um caos).

# Como rodar localmente:
- instale em https://github.com/thiago-o-dev/courses
#### Comandos
```bash
npm install
# Depois
npx marp --config marp.config.mjs --server .
```
Abra a localhost:8080, clicando no nome (não no pdf/pptx) você vai visualizar corretamente os diagramas.
