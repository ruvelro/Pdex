.mode html
.headers on

SELECT
	pokemon_v2_versiongroup.generation_id as 'Generación',
	GROUP_CONCAT(pokemon_v2_version.name, ', ') as 'Nombre'
FROM
	pokemon_v2_version
INNER JOIN
	pokemon_v2_versiongroup
ON
	pokemon_v2_version.version_group_id = pokemon_v2_versiongroup.id
GROUP BY
	pokemon_v2_versiongroup.generation_id;
