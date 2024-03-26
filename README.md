# Pdex
![build status](https://img.shields.io/badge/build-passing-green)
![deploy status](https://img.shields.io/badge/deploy-passing-green)
![License](https://img.shields.io/github/license/ruvelro/Pdex.svg)

Pdex, la Pokédex que te hubiera gustado tener en el año 2000

### Instalación
```console
git clone https://github.com/ruvelro/Pdex.git

git clone https://github.com/PokeAPI/pokeapi.git
cd pokeapi
make build-db
make make-migrations
make migrate
cp db.sqlite3 ../Pdex
```

### Ejecución
```console
sqlite3 db.sqlite3 < <(./bundle)
```

### Benchmarks
```console
time sqlite3 db.sqlite3 < <(./bundle -n 151)

real    0m0,394s
user    0m0,336s
sys     0m0,056s
```

```console
./bundle -n 151 | grep SELECT | wc -l
1979
```
