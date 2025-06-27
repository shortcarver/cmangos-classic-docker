#!/bin/bash

cp /usr/local/bin/tools/* /home/mangos/gamedata/
cd /home/mangos/gamedata
chmod a+x ExtractResources.sh
chmod a+x MoveMapGen.sh
cd /home/mangos/gamedata
sh /home/mangos/gamedata/ExtractResources.sh

mv maps /usr/local/gamedata/
mv dbc /usr/local/gamedata/
mv vmaps /usr/local/gamedata/
mv mmaps /usr/local/gamedata/
# mv CreatureModels /usr/local/gamedata/
# mv Cameras /usr/local/gamedata/

