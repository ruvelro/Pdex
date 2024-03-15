-- SQLite
.output dist/index.html

SELECT
	'<input list="urls" id="urlInput">
<datalist id="urls">' as '';
SELECT 
	'<option value="' || name || '" data-url="' || pokemon_species_id || '">' AS ''
FROM
	pokemon_v2_pokemon;

SELECT 
	'</datalist>

<button id="goButton">Go</button>

<script>
	const goToSelectedUrl = () => {
		const input = document.getElementById("urlInput");
		const selectedOption = input.value;
		const datalist = document.getElementById("urls");
		const options = Array.from(datalist.querySelectorAll("option"));
		const selectedUrl = options.find(option => option.value === selectedOption)?.getAttribute("data-url");
		if (selectedUrl) {
			window.location.href = selectedUrl;
		}
	};

	document.getElementById("goButton").addEventListener("click", goToSelectedUrl);
</script>' as '';
