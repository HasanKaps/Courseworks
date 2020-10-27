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

typeEffectiveness(ta,tm,e).

typeEffectiveness(normal,fire,ordinary).
typeEffectiveness(normal,water,ordinary).
typeEffectiveness(normal,electric,ordinary).
typeEffectiveness(normal,grass,ordinary).
typeEffectiveness(normal,normal,ordinary).

typeEffectiveness(fire,fire,weak).
typeEffectiveness(fire,water,weak).
typeEffectiveness(fire,electric,ordinary).
typeEffectiveness(fire,grass,super).
typeEffectiveness(fire,normal,ordinary).

typeEffectiveness(water,fire,super).
typeEffectiveness(water,water,weak).
typeEffectiveness(water,electric,ordinary).
typeEffectiveness(water,grass,weak).
typeEffectiveness(water,normal,ordinary).

typeEffectiveness(electric,fire,ordinary).
typeEffectiveness(electric,water,super).
typeEffectiveness(electric,electric,weak).
typeEffectiveness(electric,grass,weak).
typeEffectiveness(electric,normal,ordinary).

typeEffectiveness(grass,fire,weak).
typeEffectiveness(grass,water,super).
typeEffectiveness(grass,electric,ordinary).
typeEffectiveness(grass,grass,weak).
typeEffectiveness(grass,normal,ordinary).

abilityEffectiveness(A,M,E) :- monster(M,TM),ability(A,TA),typeEffectiveness(TA,TM,E).

superAbility(M1,A,M2) :- monster(M1,X),monster(M2,TM),ability(A,TA),monsterability(M1,A),typeEffectiveness(TA,TM,E). 

typeAbility(M,A) :- monster(M,TM),ability(A,TA),monsterability(M,A).

moreEffectiveAbility(A1,A2,T) :- ability(A1,TA),ability(A2,TX),typeEffectiveness(TA,TM,T),typeEffectiveness(TX,TM,T).

counterAbility(M1,A1,M2,A2) :- monster(M1,TM),monster(M2,TX),ability(A1,TA),ability(A2,TB),monsterability(M1,A1),monsterability(M2,A2),typeEffectiveness(A2,A1,E).