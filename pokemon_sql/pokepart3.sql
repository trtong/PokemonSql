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
# concat inner join one to many
# Select is the outcome
SELECT t.trainername as "Trainer", group_concat(p.name) as "Pokemons"
# the names from pokemon.pokemons
FROM pokemon.pokemons p
    # we join to the pokemon_trainer table (so the pokmons have names with their ids
  join pokemon.pokemon_trainer pt
  on pt.pokemon_id = p.id
    # Then we do the same for the trainers, to match their names to IDs
JOIN pokemon.trainers t
on pt.trainerID = t.trainerID
# on this specific trainer
WHERE t.trainerID = 303
# group by the trainer name
group by t.trainername;

# pt shows ownership
# using trainer and pokemon table to pull the names of the ids on the pt table

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

# get trainer ID
# counting the pokemon level where =plevel = 100 group by trainerID
SELECT pt.trainerID, count(pt.pokelevel)
from pokemon.pokemon_trainer pt
where (pokelevel = 100)
group by (pt.trainerID);




# How many pokemon only belong to one trainer and no other?
# many to many
# but we only want the ones with 1 pokemon
# count pokemon ID
SELECT count(1) from
(SELECT distinct Count(pt.trainerID), pt.pokemon_id
from pokemon.pokemon_trainer pt
#count the pokemon with distinct trainer ID
#group by is what the count/sum/avg etc is working on
GROUP BY pt.pokemon_id
having Count(*) = 1) pokemons

# look for trainers who only have 1 pokemon that no other trainers have





