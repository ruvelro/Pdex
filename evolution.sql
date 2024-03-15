.mode html
.headers on

SELECT
	-- pokemon_v2_pokemonspecies.evolves_from_species_id as 'from',
	-- pokemon_v2_pokemonspecies.id as 'id',
	-- pokemon_v2_pokemonspecies_2.id as 'to'
	pokemon_from.name as 'from',
	pokemon_id.name as 'id',
	pokemon_to.name as 'to'
FROM
	pokemon_v2_pokemonspecies
LEFT JOIN
	pokemon_v2_pokemonspecies as pokemon_v2_pokemonspecies_2
ON
	pokemon_v2_pokemonspecies_2.evolves_from_species_id = pokemon_v2_pokemonspecies.id
LEFT JOIN
	pokemon_v2_pokemon as pokemon_from
ON
	pokemon_v2_pokemonspecies.evolves_from_species_id = pokemon_from.id
LEFT JOIN
	pokemon_v2_pokemon as pokemon_id
ON
	pokemon_v2_pokemonspecies.id = pokemon_id.id
LEFT JOIN
	pokemon_v2_pokemon as pokemon_to
ON
	pokemon_v2_pokemonspecies_2.id = pokemon_to.id
WHERE
	pokemon_v2_pokemonspecies.id = @id;
