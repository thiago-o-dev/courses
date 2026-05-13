---
marp: true
size: 16:9
class: invert 
---
# <!--fit-->Introdução a programação de jogos
## Aula 1
---

## Ementa da aula
- Ferramentas que serão utilizadas no curso;
- Diferenças entre game engines;
- Entender a base da programação orientada a objetos em jogos;
- Similaridades entre desenvolvimento de jogos e desenvolvimento BackEnd;
- Herança vs Componentização;
- Introdução a sinais/eventos.
---

# Ferramentas do curso
* **Godot** para game engine
* Assets da **itch.io**

###### Todos os assets tem créditos no arquivo README.md mais próximo!
---

# <!--fit-->Diferenças entre game engines
## (Unity x Unreal  x Godot)

---

![width:600px bg](../img/unity_logo.png)
# Unity 
* ## A **mais famosa e mais utilizada profissionalmente**.
* ## Utiliza **C#**  para programar.
* ## Tem **foco** em desenvolvimento 3D mas faz muito bem 2D.
* ## Sistema de precificação baseado no numero de vendas do jogo/aplicação.
* ## Usada tambem para controlar robôs (bem doido).

###### Subway Surfers, Pokémon GO, Hollow Knight, Among Us, Fall Guys, Cuphead, Untitled Goose Game, Subnautica, Ultrakill...
---
![width:600px invert brightness:0.2 bg](../img/unreal_logo.png)
# Unreal
* ## Graficos estupidos de bons.
* ## Ótimo sistema de programação no code.
* ## Precificação de **5%** nos **lucros** após 1 milhão
* ## Editor pesado **pra caralho**.
###### Fortnite, Hogwarts Legacy, Final Fantasy VII Remake, Batman: Arkham Knight, PUBG, Rocket League, Black Myth: Wukong, Gears of War...
---
![width:600px brightness:0.3 bg](../img/godot_logo.png)
# Godot
* ## Iniciativa **FOSS**, sempre será gratuito.
* ## Desenvolvimento 2D muito simples.
* ## Melhorou muito no 3D, mas **ainda não** é foco de empresas AAA. (mas tem jogos [incriveis](https://store.steampowered.com/app/1963610/Road_to_Vostok/))
* ## Leve, roda em **quase** tudo (não tem suporte para consoles).
* ## É a game engine para **indies**.
###### Buckshot Roulette, Cassete Beasts, Brotato, Dog Walk (jogo do blender), Slay the Spire 2, Dome Keeper, Endoparasitic, EX-Zodiac, Gourdlets, Sonic Colors Ultimate...
---

![width:300px bg](../img/unity_logo.png)
![width:300px invert brightness:0.2 bg](../img/unreal_logo.png)
![width:300px brightness:0.3 bg](../img/godot_logo.png)

# <!--fit-->Algum é melhor que o outro?

---

![width:300px bg](../img/unity_logo.png)
![width:300px invert brightness:0.2 bg](../img/unreal_logo.png)
![width:300px brightness:0.3 bg](../img/godot_logo.png)

## <!--fit-->São **ferramentas**, cada uma vai facilitar **um processo diferente**.
* ## **Unity** tem um asset store estupido de grande.
* ## **Unreal** tem shaders incriveis e ótimos gráficos.
* ## **Godot** é ótimo para projetos 2D e código leve.

---

![width:300px bg brightness:0.1](../img/unity_logo.png)
![width:300px brightness:0.1 bg](../img/unreal_logo.png)
![width:300px brightness:0.05 bg](../img/godot_logo.png)

## <!--fit-->Escolha com base no **seu problema** e **suas capacidades**.

---

# <!--fit-->Entendendo a base do **POO** em jogos
## (Herança e componentização)

---

# <!--fit-->**Por que** jogos usam Programação orientada a objetos?

## É uma forma mais facil de interpretar um jogo, que normalmente terá muitas entidades junto de seus atributos.

* ## entidades: **(personagens, mapas, construções, etc...)**
* ## atributos: **(cor do modelo, vida, velocidade, etc)**

---

## Visto isso, entidades tem atributos.

# <!--fit-->Mas um atributo **pode ser** uma entidade?

---

## <!--fit-->Sim, **isso é a ideia de componentização**.

## Ao invés de seguirmos com o que a herança faz, recebendo todos os atributos de uma classe e se tornando filha da mesma, na componentização colocamos **"uma entidade" como atributo**.

---

# Quando isso é usado?

* ## É o principal conceito necessário para o isolamento de código de um jogo.  **Sem a componentização, se torna quase impossivel criar sistemas complexos a longo prazo**.

* ## Eu deveria então sempre usar a componentização? Certos momentos será mais util usar os conceitos de herança e abstração, o objetivo é **sempre pegar o caminho mais facil**.

---

# <!--fit-->Vamos ver **na prática**.

---

# Aulas e códigos **disponíveis** no github: 
## <!--fit--> https://github.com/thiago-o-dev
- (me sigam lá)
# Site buildado:
## <!--fit--> https://thiago-o-dev.github.io/courses/

