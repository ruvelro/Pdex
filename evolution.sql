.mode html
.headers on

SELECT
	pokemon_from.name as 'from',
	pokemon_from_evolution_trigger.name as 'from trigger',
	pokemon_id.name as 'id',
	pokemon_id_evolution_trigger.name as 'id trigger',
	pokemon_to.name as 'to',
	pokemon_to_evolution_trigger.name as 'to trigger'
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
	pokemon_v2_pokemonevolution as pokemon_from_evolution
ON
	pokemon_from.id = pokemon_from_evolution.evolved_species_id
LEFT JOIN
	pokemon_v2_evolutiontriggername as pokemon_from_evolution_trigger
ON
	pokemon_from_evolution.evolution_trigger_id = pokemon_from_evolution_trigger.evolution_trigger_id

LEFT JOIN
	pokemon_v2_pokemon as pokemon_id
ON
	pokemon_v2_pokemonspecies.id = pokemon_id.id
LEFT JOIN
	pokemon_v2_pokemonevolution as pokemon_id_evolution
ON
	pokemon_id.id = pokemon_id_evolution.evolved_species_id
LEFT JOIN
	pokemon_v2_evolutiontriggername as pokemon_id_evolution_trigger
ON
	pokemon_id_evolution.evolution_trigger_id = pokemon_id_evolution_trigger.evolution_trigger_id

LEFT JOIN
	pokemon_v2_pokemon as pokemon_to
ON
	pokemon_v2_pokemonspecies_2.id = pokemon_to.id
LEFT JOIN
	pokemon_v2_pokemonevolution as pokemon_to_evolution
ON
	pokemon_to.id = pokemon_to_evolution.evolved_species_id
LEFT JOIN
	pokemon_v2_evolutiontriggername as pokemon_to_evolution_trigger
ON
	pokemon_to_evolution.evolution_trigger_id = pokemon_to_evolution_trigger.evolution_trigger_id

WHERE
	pokemon_v2_pokemonspecies.id = @id
	AND (pokemon_from_evolution_trigger.language_id IS NULL
		OR pokemon_from_evolution_trigger.language_id = @lang
	)
	AND (pokemon_id_evolution_trigger.language_id IS NULL
		OR pokemon_id_evolution_trigger.language_id = @lang
	)
	AND (pokemon_to_evolution_trigger.language_id IS NULL
		OR pokemon_to_evolution_trigger.language_id is @lang
	);
