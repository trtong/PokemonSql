# Part 3 - Joins and Groups

# What is each pokemon's primary type
SELECT p.name, t.name
FROM pokemon.pokemons p
JOIN pokemon.types t
on p.primary_type = t.id;


# What is Rufflet's Secondary type
SELECT p.name, t.name
FROM pokemon.pokemons p
JOIN pokemon.types t
on p.secondary_type = t.id
WHERE p.name = 'Rufflet';


# What are the names of the pokemon that belong to the trainer with trainerID 303?
#concat inner join
SELECT t.trainername as "Trainer", group_concat(p.name) as "Pokemons"
FROM pokemon.pokemons p
  join pokemon.pokemon_trainer pt
  on pt.pokemon_id = p.id
JOIN pokemon.trainers t
on pt.trainerID = t.trainerID
WHERE t.trainerID = 303
group by t.trainername;

# How many pokemon have a secondary type Poison
SELECT
sum(secondary_type = 7) as "Poison Type"
from pokemon.pokemons;

# What are all the primary types and how many pokemon have that type?
SELECT ty.name as "Type", COUNT(p.name) as "Pokemon Count"
from pokemon.types ty
JOIN pokemon.pokemons p
ON p.primary_type = ty.id
GROUP BY ty.name;

# How many pokemon at level 100 does each trainer with at least one level 100 pokemone have?
# (Hint: your query should not display a trainer
# how many trainers have at least 1 level 100 pokemon
# count num of trainers
# pokelevel = 100




# How many pokemon only belong to one trainer and no other?
SELECT count(distinct pt.trainerID)
from pokemon.pokemon_trainer pt;
