/*

HASAN KAPADIA
H00289018

F29AI Coursework: Part 1

This coursework consists of us making the basics mechanics of the popular game pokemon in Prolog. 
Below written is the code to complete the task diveded in categories. 

*/

% 1. Below is the basic code which contains all the types,monsters,abilities, and type effectiveness.

/* Type labels all the different types the pokemon can be  */

type(t).

type(fire).
type(grass).
type(water).
type(electric).
type(normal).

/* 

Monster labels two variables: M and TM, Where M classifies all the different monsters 
and TM classifies the different types of the pokemons as mentioned above.

*/

monster(m,tm).

monster(charmander,fire).
monster(bulbasaur,grass).
monster(squirtle,water).
monster(pikachu,electric).
monster(eevee,normal).

/* 

Ability also labels two variables: A and TA, Where A classifies all the different abilities the pokemons can posses 
and TA classifies the different attributes the abilities can have.

*/

ability(a,ta).

ability(scratch,normal).
ability(tackle,normal).
ability(bodyslam,normal).
ability(bite,normal).
ability(lastresort,normal).

ability(firefang,fire).
ability(firepunch,fire).
ability(sunnyday,fire).

ability(thunderpunch,electric).
ability(thunderbolt,electric).

ability(vinewhip,grass).
ability(razorleaf,grass).
ability(solarbeam,grass).
ability(grassknot,grass).

ability(waterpulse,water).
ability(aquatail,water).
ability(surf,water).
ability(raindance,water).

/* 

MonsterAbility also labels two variables: M and A, Where M classifies all the different abilities pokemons 
and TA classifies the different abilities the pokemons have.

*/

monsterability(m,a).

monsterability(charmander,scratch).
monsterability(charmander,firefang).
monsterability(charmander,firepunch).
monsterability(charmander,thunderpunch).

monsterability(bulbasaur,tackle).
monsterability(bulbasaur,vinewhip).
monsterability(bulbasaur,razorleaf).
monsterability(bulbasaur,solarbeam).

monsterability(squirtle,tackle).
monsterability(squirtle,waterpulse).
monsterability(squirtle,aquatail).
monsterability(squirtle,bodyslam).

monsterability(eevee,raindance).
monsterability(eevee,sunnyday).
monsterability(eevee,bite).
monsterability(eevee,lastresort).

/* 

TypeEffectiveness takes three variables: TA,TM, and E, Where TA and TM classifies The ability types, and
E classifies the effectiveness of each type against each other.

*/

typeeffectiveness(ta,tm,e).

typeeffectiveness(normal,fire,ordinary).
typeeffectiveness(normal,water,ordinary).
typeeffectiveness(normal,electric,ordinary).
typeeffectiveness(normal,grass,ordinary).
typeeffectiveness(normal,normal,ordinary).

typeeffectiveness(fire,fire,weak).
typeeffectiveness(fire,water,weak).
typeeffectiveness(fire,electric,ordinary).
typeeffectiveness(fire,grass,super).
typeeffectiveness(fire,normal,ordinary).

typeeffectiveness(water,fire,super).
typeeffectiveness(water,water,weak).
typeeffectiveness(water,electric,ordinary).
typeeffectiveness(water,grass,weak).
typeeffectiveness(water,normal,ordinary).

typeeffectiveness(electric,fire,ordinary).
typeeffectiveness(electric,water,super).
typeeffectiveness(electric,electric,weak).
typeeffectiveness(electric,grass,weak).
typeeffectiveness(electric,normal,ordinary).

typeeffectiveness(grass,fire,weak).
typeeffectiveness(grass,water,super).
typeeffectiveness(grass,electric,ordinary).
typeeffectiveness(grass,grass,weak).
typeeffectiveness(grass,normal,ordinary).

abilityEffectiveness(A,M,E) :- monster(M,tm), ability(M,A), typeEffectiveness(A,tm,E).