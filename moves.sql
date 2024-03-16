.mode html
.headers on

SELECT
	DISTINCT pokemon_v2_movename.name as 'Movimiento',
	pokemon_v2_pokemonmove.level as 'Nivel'
FROM 
	pokemon_v2_pokemonmove
INNER JOIN
	pokemon_v2_movename
ON
	pokemon_v2_movename.move_id = pokemon_v2_pokemonmove.move_id
WHERE
	pokemon_v2_pokemonmove.pokemon_id = @id AND
	pokemon_v2_pokemonmove.version_group_id in(1, 2) AND
	pokemon_v2_pokemonmove.move_learn_method_id = 1 AND
	pokemon_v2_movename.language_id = 9;
