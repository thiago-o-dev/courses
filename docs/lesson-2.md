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

# Máquinas de estado:
* Forma diferente de pensar nas ações;
* Pensamos não no quê fazer a todo momento, mas em:
    * O que ocorre se estamos em um estado;
    * Da onde podemos ir apartir deste estado.

---

# Isso dá as máquinas de estado uma aparência facilmente representavel por **fluxogramas**
---

# Exemplos:

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

# teste

---

wip

---

# <!--fit-->Vamos ver **na prática**.

---

# Aulas e códigos **disponiveis** no github: 
## <!--fit--> https://github.com/thiago-o-dev
- (me sigam lá)
# Site buildado:
## <!--fit--> https://thiago-o-dev.github.io/courses/