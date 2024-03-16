.mode html
.headers on

SELECT
	DISTINCT pokemon_v2_movename.name as 'Movimiento',
	IIF(pokemon_v2_pokemonmove.level = 0, 
		NULL, 
		pokemon_v2_pokemonmove.level
	) as 'Nivel',
	pokemon_v2_typename.name as 'Tipo',
	pokemon_v2_movelearnmethodname.name as 'Origen'
FROM 
	pokemon_v2_pokemonmove
INNER JOIN
	pokemon_v2_movename
ON
	pokemon_v2_movename.move_id = pokemon_v2_pokemonmove.move_id
INNER JOIN
	pokemon_v2_movelearnmethodname
ON
	pokemon_v2_movelearnmethodname.move_learn_method_id = pokemon_v2_pokemonmove.move_learn_method_id
INNER JOIN
	pokemon_v2_move
ON
	pokemon_v2_move.id = pokemon_v2_pokemonmove.move_id
INNER JOIN
	pokemon_v2_typename
ON
	pokemon_v2_move.type_id = pokemon_v2_typename.type_id
WHERE
	pokemon_v2_pokemonmove.pokemon_id = @id
	AND pokemon_v2_pokemonmove.version_group_id in(1, 2)
	AND pokemon_v2_movelearnmethodname.language_id = 9
	AND pokemon_v2_movename.language_id = 9
	AND pokemon_v2_typename.language_id = 9
ORDER BY
	pokemon_v2_pokemonmove.level DESC;
