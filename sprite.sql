.mode list
.headers off

SELECT
	'<html><img src="https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/' || @id || '.png"></img><div><table>';

SELECT
	'<html><img src="https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/' || pokemon_v2_generation.name || '/' || pokemon_v2_versiongroup.name || '/' || @id || '.png"></img><div><table>'
FROM
	pokemon_v2_generation
INNER JOIN
	pokemon_v2_versiongroup
ON
	pokemon_v2_versiongroup.generation_id = pokemon_v2_generation.id
WHERE
	pokemon_v2_generation.id = @gen
LIMIT 1;

SELECT
	'<audio controls><source src="https://raw.githubusercontent.com/PokeAPI/cries/main/cries/pokemon/legacy/' || @id || '.ogg" type="audio/ogg"></audio>';
