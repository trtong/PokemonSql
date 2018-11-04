# What are all the types of pokemon that a pokemon can have
SELECT name
FROM pokemon.types;

# Pokemon ID #45
SELECT name
FROM pokemon.pokemons
WHERE id = 45;

# how many pokemon
SELECT COUNT(*) as "Total Pokemon"
from pokemon.pokemons;

# how many types
SELECT COUNT(*) as "Total types"
from pokemon.types;

# how many pokemon with secondary type
SELECT COUNT(secondary_type) as "Pokemon w secondary types"
from pokemon.pokemons;