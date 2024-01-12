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

### Platform Designer
 L'architecture sous Platform Designer (**QSYS**) est donc la suivante :
 
![qsys_lab1](https://github.com/ESN2024/marimoutou_lab1/assets/97475510/1b976335-796f-4a10-b4dd-a33a51d6ed2f)

### Quartus 
Sur quartus on vient ensuite rédigé notre fichier *toplevel.vhd* et réaliser le pin assignements dans le **pin planner** ou en modifiant le fichier *.qsf*
On réalise ensuite la compilation compléte de notre design et si il n'y a aucune erreur nous pouvons flasher l'archihtecture sur notre carte.

### Nios2 Flow
A partir du terminal Nios2 on vient alors créer notre **Makefile** et générer notre **bsp**.
Une fois cela fait, nous pouvons écrire nos scripts C, les compiler et les téléverser sur notre carte.

## Travail effectué
J'ai ensuite créer 3 scripts C, chacun réalisant une étape bien précise :

### Chenillard seule
La première à était de réaliser un chenillard simple pour ce faire dans une boucle while nous avons 2 autres boucle réalisant des décalage à gauche et à droite lorsque l'on atteint les extremums de nos Leds(resp. 0 et 7).

### Chenillard actionné par un bouton
La 2éme étape à était de réaliser un chenillard actionné par un bouton, pour ce faire on utilise un interruption. Au début j'ai rencontré avec la fonction *alt_isr_register()* qui ne fonctionné pas.
Aprés avoir regarder le documents mise à disposition sur la forge j'ai remarqué la définition suivante **ALT_ENHANCED_INTERRUPT_API_PRESENT** qui apparaissait également dans le documents du moodle. J'ai donc utilisé la fonction *alt_ic_isr_register()* qui elle fonctionne.

![api_register](https://github.com/ESN2024/marimoutou_lab1/assets/97475510/0a3df57c-7b70-4865-b838-63d73492a675)

<u>Remarques</u> : A priori cela viendrai de la déclaration de la bibliothéque l'utilisation des chevrons ou des guillemets modifie le comportements de l'appel à la fonction *alt_isr_register()*.

### Chenillard controlé en vitesse

Les interruptions étant validé, la derniére étape à était de rajouter les switches 1 à 8 à notre design QSYS et d'utiliser un masque dans la partie software.
On vient directement lire la valeurs des switches afin de contrôler la variable **time** qui vient directement agir sur la vitesse.

#### Demonstration

https://github.com/ESN2024/marimoutou_lab1/assets/97475510/e23a3ad3-5032-4189-825d-c4b39b10f966


## Conclusion

En conclusion, ce TP nous a permis de prendre en main les outils de conception conjointe. C'est un projet réel dans lequel nous avons pu utiliser les interruptions. Globalement une fois l'utilisation des interruptions avec le bouton comprise le reste se déroule naturellement pour les switch.
