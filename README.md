# marimoutou_lab1


## Introduction
Au travers de ce cours nous allons mettre en pratique les notions de conception conjointe vu en cours, nous travaillerons avec une carte DE10-Lite qui possédent un FPGA MAX10 10M50DAF484C7G de la gamme Altera.  
Pour ce premier lab on se propose de réaliser un chenillard de leds qui sera actionnée par une interruptions et dont on pourra modifier la vitesse. Cela nous permettra de nous familiariser avec le flow de conception.

## Architecture du sytème

![lab1_arch](https://github.com/ESN2024/marimoutou_lab1/assets/97475510/6c3ca830-a887-4666-98db-a8a7b7e6ee61)

Le système est composé de l'architecture basique vu en cours dans laquelle on retrouve:
* Un processeur Nios II
* Une mémoire RAM
* Une clock
* Un port JTAG

A cela on ajoute :
 * Un PIO 8 bits pour les leds
 * Un PIO 8 bits pour les switches
 * Un PIO 1 bits pour le bouton (KEY1)

 L'architecture sous Platform Designer (QSYS) est donc la suivante :
 
![qsys_lab1](https://github.com/ESN2024/marimoutou_lab1/assets/97475510/1b976335-796f-4a10-b4dd-a33a51d6ed2f)

## Travail effectué



https://github.com/ESN2024/marimoutou_lab1/assets/97475510/e23a3ad3-5032-4189-825d-c4b39b10f966



## Conclusion
