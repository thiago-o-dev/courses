---
marp: true
size: 16:9
class: invert 
---
![opacity:0.05 bg](../img/godot_logo.png)

# <!--fit-->Aprofundamento em **padrões de programação**
## Aula 2
---

## Ementa da aula:
- Máquinas de estado;
- Sinais complexos;
- Signal Bus; (famosa lista encadeada)
- Singleton/Autoloads;
- O que é ser **stateless ou stateful**.
---

# Como vimos na ultima aula **todo padrão acaba indo atrás de aplicar principios gerais da programação**.

---
# <!--fit-->Citando um, os principios **S.O.L.I.D.**
* ### **Single Responsibility**: Uma classe deve ter apenas uma responsabilidade.
* ### **Open/Closed**: Entidades de software (classes, módulos, funções) devem estar abertas para extensão, mas fechadas para modificação.
* ### **Liskov Substitution**: Objetos de uma **subclasse** devem poder substituir objetos da **superclasse** sem quebrar a aplicação.
* ### **Interface Segregation**: Uma classe não deve ser forçada a implementar interfaces e métodos que não utiliza **(esse o godot não tem 100%)**.
* ### **Dependency Inversion**: Dependa de abstrações (interfaces) e não de implementações concretas **(esse tbm)**.
---
# Então agora quando formos aplicar:
- # **maquinas de estado**;
- # **componetização**; 
# Sabemos que elas servem para deixar esses **principios integros no nosso projeto**. 
# Deixando ele assim...
---
# **Manutenível**
### Suscetível de ser mantido; que mantém a posse de alguma coisa.

###### Etimologia (origem da palavra manutenível). Do latim manutenibilis / manutenere.
---
# Máquinas de estado:
* Forma diferente de pensar nas ações;
* Pensamos não no quê fazer a todo momento, mas em:
    * O que ocorre se estamos em um estado;
    * Da onde podemos ir apartir deste estado.

---

# Isso dá as máquinas de estado uma aparência facilmente representavel por **fluxogramas**.
---

### Vamos pensar então no movimento de um personagem
<br>
<br>

```mermaid
flowchart LR 
    %% Estados
    P([Parado])
    A([Andando])
    C([Correndo])

    %% Transições normais
    P -->|Começar a andar| A
    A -->|Parar| P
    A -->|Acelerar| C
    C -->|Diminuir velocidade| A

    %% Transição especial
    C -.->|Parada brusca| P
```

---

###### Agora podemos pensar nas ações dentro de cada etapa
<br>

```mermaid
%%{init: {
    "themeVariables": {
        "fontSize": "24px"
    }
}}%%
stateDiagram-v2
    %% Estados
    P: Parado
    A: Andando
    C: Correndo

    note right of P
        Aqui nos preocupamos em dissipar a velocidade do player
    end note

    note right of A
        Aqui nos preocupamos em levar a velocidade do player até um valor
    end note

    note right of C
        Aqui nos preocupamos em levar a velocidade do player até **outro** valor
    end note
```

---
```mermaid
flowchart LR 
    A([Andando])
    C([Correndo])

    A <-.->|Mesmo movimento essensialmente| C
```
<br>

### Dessa forma podemos até dizer que **andando e correndo** tem essencialmente a **mesma função de movimento**, mas com variaveis diferentes e algumas transições diferentes.

---

```mermaid
flowchart LR 
    A([Andando])
    C([Correndo])
    Z([CalculadoraMovimento])

    A -->|Velocidade 200, vetor de input e delta| Z -.->|Resposta da velocidade| A
    C -->|Velocidade 400, vetor de input e delta| Z -.->|Resposta da velocidade| C
```

### Nesses casos podemos deixar **o calculo de movimento** em comum **em uma função estática** para evitarmos nos repetir e nos estados **ligar somente para as transições**.

---

# <!--fit-->Vamos ver **na prática**.

---

# Aulas e códigos **disponiveis** no github: 
## <!--fit--> https://github.com/thiago-o-dev
- (me sigam lá)
# Site buildado:
## <!--fit--> https://thiago-o-dev.github.io/courses/