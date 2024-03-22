# Pdex
![build status](https://img.shields.io/badge/build-passing-green)
![deploy status](https://img.shields.io/badge/deploy-passing-green)
![License](https://img.shields.io/github/license/ruvelro/Pdex.svg)

Pdex, la Pokédex que te hubiera gustado tener en el año 2000

### Instalación
``` bash
git clone https://github.com/ruvelro/Pdex.git

git clone https://github.com/PokeAPI/pokeapi.git
cd pokeapi
make build-db
make make-migrations
make migrate
cp db.sqlite3 ../Pdex
```

### Ejecución
``` Bash
sqlite3 db.sqlite3 < <(./bundle)
```
