.mode html
.headers on

SELECT DISTINCT
	pokemon_v2_locationname.name as 'Localización'
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
INNER JOIN
	pokemon_v2_version
ON
	pokemon_v2_version.id = pokemon_v2_encounter.version_id
INNER JOIN
	pokemon_v2_versiongroup
ON
	pokemon_v2_versiongroup.id = pokemon_v2_version.version_group_id
WHERE
	pokemon_v2_encounter.pokemon_id = @id
	AND pokemon_v2_versiongroup.generation_id = @gen
	AND pokemon_v2_locationname.language_id = @lang;
