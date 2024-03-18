.mode html
.headers on

SELECT
	(
		SELECT
			group_concat(strong_name, ', ') as 'Fuerte'
		FROM (
			SELECT DISTINCT
				strong.name as 'strong_name'
			FROM
				pokemon_v2_pokemontype
			INNER JOIN
				pokemon_v2_type
			ON
				pokemon_v2_pokemontype.type_id = pokemon_v2_type.id
			INNER JOIN
				pokemon_v2_typeefficacy
			ON
				pokemon_v2_type.id = pokemon_v2_typeefficacy.damage_type_id
			INNER JOIN
				pokemon_v2_type as 'strong'
			ON
				pokemon_v2_typeefficacy.target_type_id = strong.id

			WHERE
				pokemon_v2_pokemontype.pokemon_id = @id
				AND pokemon_v2_typeefficacy.damage_factor > 100
		)
	) as 'Fuerte',
	(
		SELECT
			group_concat(weak_name, ', ') as 'Débil'
		FROM (
			SELECT DISTINCT
				weak.name as 'weak_name'
			FROM
				pokemon_v2_pokemontype
			INNER JOIN
				pokemon_v2_type
			ON
				pokemon_v2_pokemontype.type_id = pokemon_v2_type.id
			INNER JOIN
				pokemon_v2_typeefficacy
			ON
				pokemon_v2_type.id = pokemon_v2_typeefficacy.damage_type_id
			INNER JOIN
				pokemon_v2_type as 'weak'
			ON
				pokemon_v2_typeefficacy.target_type_id = weak.id

			WHERE
				pokemon_v2_pokemontype.pokemon_id = @id
				AND pokemon_v2_typeefficacy.damage_factor < 100
		)
	) as 'Débil';
