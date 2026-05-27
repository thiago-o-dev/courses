---
marp: true
size: 16:9
class: invert 
---

<style>
  .center {
    display: flex;
    flex-direction: column;
    justify-content: center;
    text-align: center;
  }
</style>

![opacity:0.05 bg](../img/godot_logo.png)

# <!--fit-->Introdução aos **efeitos visuais**
## Aula 3

---

## Ementa da aula:
- O que são tweens;
- Matemática gráfica;
- Eases e transitions;
- Formulas comuns; (bezier curves, dot product, cross product, etc)
- Aplicaçoes interessantes;
- O que sao shaders;
- Entendendo a GPU e a CPU.

---

# Da onde vem o termo **Tween**?
- ### O termo tween veio do processo de in-be**tween**ning, que é **preencher desenhos entre duas poses definidas**.

* ### Essa nomenclatura já era usada em **1920** pela **Disney** e os estudios **Fleischer**, sendo assim um padrão global em qualquer software hoje em dia.

---

![cover](https://github.com/user-attachments/assets/9fbd87bc-3337-4f6b-a1e3-1d7da7469293)

---
# <!--fit-->Atualmente, Tween **são calculados digitalmente**.

### <!--fit-->Um dos exemplos mais memoráveis é a **Adobe Flash**
![width:500px](../img/Tweening.gif)

---

![bg left](../img/Tweening.gif)
### Temos as **seguintes propriedades** modificadas por tweens:
* #### **Posição** da bola 
* #### **Cor** da bola
* #### **Escala** da bola

---
Abrir o projeto lá

---
Formulas comuns na matemática visual

---
# Aula baseada no video
### https://www.youtube.com/watch?v=dQw4w9WgXcQ
