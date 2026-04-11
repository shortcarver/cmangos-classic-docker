# Mangos Server setup

The server can be built and run entirely in docker from source

Checkout the cmangos server code
```sh
git clone git@github.com:cmangos/mangos-classic.git ./server-code
```

Checkout the cmangos database-code
```sh
git clone git@github.com:cmangos/classic-db.git ./database-code
```

```sh
make init
make build-mangos-server
```

Put your client in `gamedata`

Extract gamedata
```sh
make extract-gamedata
```

Generate config files
```sh
make extract-config
```


