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

Update configuration

Init the database
```sh
make initdb
```
```
-----------------------------
Database host...........: mangosdb
Database port...........: 3306
MySQL user..............: mangos (password is defined in InstallFullDB.config)
MySQL user IP access....: mangosdb
MySQL binary path.......: /usr/bin/mysql
MySQL dump binary path..: /usr/bin/mysqldump
Core path...............: /home/mangos/server
World database name.....: classicmangos
Character database name.: classiccharacters
Realm database name.....: classicrealmd
Logs database name......: classiclogs
LOCALES.................: YES
DEV_UPDATES.............: NO
AHBOT...................: YES
PLAYERBOTS_DB...........: YES
```

/usr/local/bin/
/home/mangos/build
