.mode html
.headers on

SELECT
	pokemon_v2_pokemon.id as 'ID',
	pokemon_v2_pokemon.name as 'Nombre',
	pokemon_v2_pokemonspeciesname.genus as 'Especie',
	pokemon_v2_pokemon.height as 'Altura',
	pokemon_v2_pokemon.weight as 'Peso',
	pokemon_v2_pokemon.base_experience as 'Exp.'
FROM
	pokemon_v2_pokemon
INNER JOIN
	pokemon_v2_pokemonspeciesname
ON
	pokemon_v2_pokemon.pokemon_species_id = pokemon_v2_pokemonspeciesname.pokemon_species_id
WHERE
	pokemon_v2_pokemon.id = @id AND
	pokemon_v2_pokemonspeciesname.language_id = 7;

SELECT
	REPLACE(pokemon_v2_pokemonspeciesflavortext.flavor_text, '', ' ') as 'Descripción'
FROM
	pokemon_v2_pokemonspeciesflavortext
WHERE
	pokemon_v2_pokemonspeciesflavortext.pokemon_species_id = @id AND
	pokemon_v2_pokemonspeciesflavortext.language_id = 7
LIMIT 1;