.mode html
.headers on

SELECT
	DISTINCT pokemon_v2_locationname.name as 'Localización'
FROM
	pokemon_v2_encounter
LEFT JOIN
	pokemon_v2_locationarea
ON
	pokemon_v2_encounter.location_area_id = pokemon_v2_locationarea.id
LEFT JOIN
	pokemon_v2_locationname
ON
	pokemon_v2_locationarea.location_id = pokemon_v2_locationname.location_id
WHERE
	pokemon_v2_encounter.pokemon_id = @id AND
	pokemon_v2_locationname.language_id = 9 AND
	pokemon_v2_encounter.version_id IN(1, 2);
