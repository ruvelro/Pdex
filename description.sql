.mode html
.headers on

SELECT
	pokemon_v2_pokemon.id as 'ID',
	pokemon_v2_pokemon.name as 'Nombre',
	GROUP_CONCAT(pokemon_v2_type.name, ", ") as 'Tipo',
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
INNER JOIN
	pokemon_v2_pokemontype
ON
	pokemon_v2_pokemontype.pokemon_id = pokemon_v2_pokemon.id
INNER JOIN
	pokemon_v2_type
ON
	pokemon_v2_pokemontype.type_id = pokemon_v2_type.id
WHERE
	pokemon_v2_pokemon.id = @id AND
	pokemon_v2_pokemonspeciesname.language_id = @lang;

SELECT
	REPLACE(pokemon_v2_pokemonspeciesflavortext.flavor_text, '', ' ') as 'Descripción'
FROM
	pokemon_v2_pokemonspeciesflavortext
INNER JOIN
	pokemon_v2_version
ON
	pokemon_v2_version.id = pokemon_v2_pokemonspeciesflavortext.version_id
INNER JOIN
	pokemon_v2_versiongroup
ON
	pokemon_v2_versiongroup.id = pokemon_v2_version.version_group_id
WHERE
	pokemon_v2_pokemonspeciesflavortext.pokemon_species_id = @id
	AND pokemon_v2_versiongroup.generation_id = @gen
	AND pokemon_v2_pokemonspeciesflavortext.language_id = @lang
LIMIT 1;
