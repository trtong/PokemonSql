# Pokemon Name	Trainer Name	Level	Primary Type	Secondary Type
# Rank pokemon by strongest
# In all of my pokemon adventures, I strived for the fastest pokemon with the best attack (sp or norm)
# So I ranked them by level and then added the speed, sp atk and atk together!
SELECT p.name as "Pokemon's Name", t.trainername as "Trainer's Name", pt.pokelevel as "Level",
      ANY_VALUE(ty.name) as "Primary Type", ANY_VALUE(ty.name) as "Secondary Type"

FROM pokemon.pokemon_trainer pt
      JOIN pokemon.pokemons p
        on p.id = pt.pokemon_id
      JOIN pokemon.trainers t
        on pt.trainerID = t.trainerID
      JOIN pokemon.trainers tt
        on pt.trainerID = tt.trainerID
      JOIN pokemon.types ty
        on ty.id = p.primary_type
      JOIN pokemon.types ty2
        on ty2.id = p.secondary_type
GROUP BY p.name, t.trainername, pokelevel

ORDER BY pt.pokelevel DESC,
         SUM(pt.speed + pt.spatk + pt.attack) DESC;