---
title: "BAM-featureCount"
author: "Sehrish Kanwal"
date: "Thu 2018-May-17"
output: 
  html_document: 
    keep_md: yes
editor_options: 
  chunk_output_type: console
---



## Required packages


```r
library(purrr)
library(repurrrsive)
library(listviewer)
```

```
## Warning: package 'listviewer' was built under R version 3.4.4
```

```r
library(tibble)
library(jsonlite)
```

```
## 
## Attaching package: 'jsonlite'
```

```
## The following object is masked from 'package:purrr':
## 
##     flatten
```

```r
library(dplyr)
```

```
## 
## Attaching package: 'dplyr'
```

```
## The following objects are masked from 'package:stats':
## 
##     filter, lag
```

```
## The following objects are masked from 'package:base':
## 
##     intersect, setdiff, setequal, union
```

```r
library(stringr)
library(lubridate)
```

```
## Warning: package 'lubridate' was built under R version 3.4.4
```

```
## 
## Attaching package: 'lubridate'
```

```
## The following object is masked from 'package:base':
## 
##     date
```

```r
library(here)
```

```
## here() starts at /Users/kanwals/Documents/UMCCR/Play/Play
```

```
## 
## Attaching package: 'here'
```

```
## The following object is masked from 'package:lubridate':
## 
##     here
```

`listviewer` is an interactive way to explore objects vs `str`. 
`wesanderson`, `got_chars` and `gh_users` are lists from library `repurrrsive`. 

# Exploring data


```r
str(wesanderson)
```

```
## List of 15
##  $ GrandBudapest : chr [1:4] "#F1BB7B" "#FD6467" "#5B1A18" "#D67236"
##  $ Moonrise1     : chr [1:4] "#F3DF6C" "#CEAB07" "#D5D5D3" "#24281A"
##  $ Royal1        : chr [1:4] "#899DA4" "#C93312" "#FAEFD1" "#DC863B"
##  $ Moonrise2     : chr [1:4] "#798E87" "#C27D38" "#CCC591" "#29211F"
##  $ Cavalcanti    : chr [1:5] "#D8B70A" "#02401B" "#A2A475" "#81A88D" ...
##  $ Royal2        : chr [1:5] "#9A8822" "#F5CDB4" "#F8AFA8" "#FDDDA0" ...
##  $ GrandBudapest2: chr [1:4] "#E6A0C4" "#C6CDF7" "#D8A499" "#7294D4"
##  $ Moonrise3     : chr [1:5] "#85D4E3" "#F4B5BD" "#9C964A" "#CDC08C" ...
##  $ Chevalier     : chr [1:4] "#446455" "#FDD262" "#D3DDDC" "#C7B19C"
##  $ Zissou        : chr [1:5] "#3B9AB2" "#78B7C5" "#EBCC2A" "#E1AF00" ...
##  $ FantasticFox  : chr [1:5] "#DD8D29" "#E2D200" "#46ACC8" "#E58601" ...
##  $ Darjeeling    : chr [1:5] "#FF0000" "#00A08A" "#F2AD00" "#F98400" ...
##  $ Rushmore      : chr [1:5] "#E1BD6D" "#EABE94" "#0B775E" "#35274A" ...
##  $ BottleRocket  : chr [1:7] "#A42820" "#5F5647" "#9B110E" "#3F5151" ...
##  $ Darjeeling2   : chr [1:5] "#ECCBAE" "#046C9A" "#D69C4E" "#ABDDDE" ...
```

```r
listviewer::jsonedit(wesanderson, mode = "view")
```

<!--html_preserve--><div id="htmlwidget-9d4d17912d75ef2eef87" style="width:672px;height:480px;" class="jsonedit html-widget"></div>
<script type="application/json" data-for="htmlwidget-9d4d17912d75ef2eef87">{"x":{"data":{"GrandBudapest":["#F1BB7B","#FD6467","#5B1A18","#D67236"],"Moonrise1":["#F3DF6C","#CEAB07","#D5D5D3","#24281A"],"Royal1":["#899DA4","#C93312","#FAEFD1","#DC863B"],"Moonrise2":["#798E87","#C27D38","#CCC591","#29211F"],"Cavalcanti":["#D8B70A","#02401B","#A2A475","#81A88D","#972D15"],"Royal2":["#9A8822","#F5CDB4","#F8AFA8","#FDDDA0","#74A089"],"GrandBudapest2":["#E6A0C4","#C6CDF7","#D8A499","#7294D4"],"Moonrise3":["#85D4E3","#F4B5BD","#9C964A","#CDC08C","#FAD77B"],"Chevalier":["#446455","#FDD262","#D3DDDC","#C7B19C"],"Zissou":["#3B9AB2","#78B7C5","#EBCC2A","#E1AF00","#F21A00"],"FantasticFox":["#DD8D29","#E2D200","#46ACC8","#E58601","#B40F20"],"Darjeeling":["#FF0000","#00A08A","#F2AD00","#F98400","#5BBCD6"],"Rushmore":["#E1BD6D","#EABE94","#0B775E","#35274A","#F2300F"],"BottleRocket":["#A42820","#5F5647","#9B110E","#3F5151","#4E2A1E","#550307","#0C1707"],"Darjeeling2":["#ECCBAE","#046C9A","#D69C4E","#ABDDDE","#000000"]},"options":{"mode":"view","modes":["code","form","text","tree","view"]}},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

```r
str(got_chars, list.len = 3)
```

```
## List of 30
##  $ :List of 18
##   ..$ url        : chr "https://www.anapioficeandfire.com/api/characters/1022"
##   ..$ id         : int 1022
##   ..$ name       : chr "Theon Greyjoy"
##   .. [list output truncated]
##  $ :List of 18
##   ..$ url        : chr "https://www.anapioficeandfire.com/api/characters/1052"
##   ..$ id         : int 1052
##   ..$ name       : chr "Tyrion Lannister"
##   .. [list output truncated]
##  $ :List of 18
##   ..$ url        : chr "https://www.anapioficeandfire.com/api/characters/1074"
##   ..$ id         : int 1074
##   ..$ name       : chr "Victarion Greyjoy"
##   .. [list output truncated]
##   [list output truncated]
```

```r
listviewer::jsonedit(got_chars, mode = "view")
```

<!--html_preserve--><div id="htmlwidget-d440a999e5b16960c5d4" style="width:672px;height:480px;" class="jsonedit html-widget"></div>
<script type="application/json" data-for="htmlwidget-d440a999e5b16960c5d4">{"x":{"data":[{"url":"https://www.anapioficeandfire.com/api/characters/1022","id":1022,"name":"Theon Greyjoy","gender":"Male","culture":"Ironborn","born":"In 278 AC or 279 AC, at Pyke","died":"","alive":true,"titles":["Prince of Winterfell","Captain of Sea Bitch","Lord of the Iron Islands (by law of the green lands)"],"aliases":["Prince of Fools","Theon Turncloak","Reek","Theon Kinslayer"],"father":"","mother":"","spouse":"","allegiances":"House Greyjoy of Pyke","books":["A Game of Thrones","A Storm of Swords","A Feast for Crows"],"povBooks":["A Clash of Kings","A Dance with Dragons"],"tvSeries":["Season 1","Season 2","Season 3","Season 4","Season 5","Season 6"],"playedBy":"Alfie Allen"},{"url":"https://www.anapioficeandfire.com/api/characters/1052","id":1052,"name":"Tyrion Lannister","gender":"Male","culture":"","born":"In 273 AC, at Casterly Rock","died":"","alive":true,"titles":["Acting Hand of the King (former)","Master of Coin (former)"],"aliases":["The Imp","Halfman","The boyman","Giant of Lannister","Lord Tywin's Doom","Lord Tywin's Bane","Yollo","Hugor Hill","No-Nose","Freak","Dwarf"],"father":"","mother":"","spouse":"https://www.anapioficeandfire.com/api/characters/2044","allegiances":"House Lannister of Casterly Rock","books":["A Feast for Crows","The World of Ice and Fire"],"povBooks":["A Game of Thrones","A Clash of Kings","A Storm of Swords","A Dance with Dragons"],"tvSeries":["Season 1","Season 2","Season 3","Season 4","Season 5","Season 6"],"playedBy":"Peter Dinklage"},{"url":"https://www.anapioficeandfire.com/api/characters/1074","id":1074,"name":"Victarion Greyjoy","gender":"Male","culture":"Ironborn","born":"In 268 AC or before, at Pyke","died":"","alive":true,"titles":["Lord Captain of the Iron Fleet","Master of the Iron Victory"],"aliases":"The Iron Captain","father":"","mother":"","spouse":"","allegiances":"House Greyjoy of Pyke","books":["A Game of Thrones","A Clash of Kings","A Storm of Swords"],"povBooks":["A Feast for Crows","A Dance with Dragons"],"tvSeries":"","playedBy":""},{"url":"https://www.anapioficeandfire.com/api/characters/1109","id":1109,"name":"Will","gender":"Male","culture":"","born":"","died":"In 297 AC, at Haunted Forest","alive":false,"titles":"","aliases":"","father":"","mother":"","spouse":"","allegiances":[],"books":"A Clash of Kings","povBooks":"A Game of Thrones","tvSeries":"","playedBy":"Bronson Webb"},{"url":"https://www.anapioficeandfire.com/api/characters/1166","id":1166,"name":"Areo Hotah","gender":"Male","culture":"Norvoshi","born":"In 257 AC or before, at Norvos","died":"","alive":true,"titles":"Captain of the Guard at Sunspear","aliases":"","father":"","mother":"","spouse":"","allegiances":"House Nymeros Martell of Sunspear","books":["A Game of Thrones","A Clash of Kings","A Storm of Swords"],"povBooks":["A Feast for Crows","A Dance with Dragons"],"tvSeries":["Season 5","Season 6"],"playedBy":"DeObia Oparei"},{"url":"https://www.anapioficeandfire.com/api/characters/1267","id":1267,"name":"Chett","gender":"Male","culture":"","born":"At Hag's Mire","died":"In 299 AC, at Fist of the First Men","alive":false,"titles":"","aliases":"","father":"","mother":"","spouse":"","allegiances":[],"books":["A Game of Thrones","A Clash of Kings"],"povBooks":"A Storm of Swords","tvSeries":"","playedBy":""},{"url":"https://www.anapioficeandfire.com/api/characters/1295","id":1295,"name":"Cressen","gender":"Male","culture":"","born":"In 219 AC or 220 AC","died":"In 299 AC, at Dragonstone","alive":false,"titles":"Maester","aliases":"","father":"","mother":"","spouse":"","allegiances":[],"books":["A Storm of Swords","A Feast for Crows"],"povBooks":"A Clash of Kings","tvSeries":"Season 2","playedBy":"Oliver Ford"},{"url":"https://www.anapioficeandfire.com/api/characters/130","id":130,"name":"Arianne Martell","gender":"Female","culture":"Dornish","born":"In 276 AC, at Sunspear","died":"","alive":true,"titles":"Princess of Dorne","aliases":"","father":"","mother":"","spouse":"","allegiances":"House Nymeros Martell of Sunspear","books":["A Game of Thrones","A Clash of Kings","A Storm of Swords","A Dance with Dragons"],"povBooks":"A Feast for Crows","tvSeries":"","playedBy":""},{"url":"https://www.anapioficeandfire.com/api/characters/1303","id":1303,"name":"Daenerys Targaryen","gender":"Female","culture":"Valyrian","born":"In 284 AC, at Dragonstone","died":"","alive":true,"titles":["Queen of the Andals and the Rhoynar and the First Men, Lord of the Seven Kingdoms","Khaleesi of the Great Grass Sea","Breaker of Shackles/Chains","Queen of Meereen","Princess of Dragonstone"],"aliases":["Dany","Daenerys Stormborn","The Unburnt","Mother of Dragons","Mother","Mhysa","The Silver Queen","Silver Lady","Dragonmother","The Dragon Queen","The Mad King's daughter"],"father":"","mother":"","spouse":"https://www.anapioficeandfire.com/api/characters/1346","allegiances":"House Targaryen of King's Landing","books":"A Feast for Crows","povBooks":["A Game of Thrones","A Clash of Kings","A Storm of Swords","A Dance with Dragons"],"tvSeries":["Season 1","Season 2","Season 3","Season 4","Season 5","Season 6"],"playedBy":"Emilia Clarke"},{"url":"https://www.anapioficeandfire.com/api/characters/1319","id":1319,"name":"Davos Seaworth","gender":"Male","culture":"Westeros","born":"In 260 AC or before, at King's Landing","died":"","alive":true,"titles":["Ser","Lord of the Rainwood","Admiral of the Narrow Sea","Hand of the King"],"aliases":["Onion Knight","Davos Shorthand","Ser Onions","Onion Lord","Smuggler"],"father":"","mother":"","spouse":"https://www.anapioficeandfire.com/api/characters/1676","allegiances":["House Baratheon of Dragonstone","House Seaworth of Cape Wrath"],"books":"A Feast for Crows","povBooks":["A Clash of Kings","A Storm of Swords","A Dance with Dragons"],"tvSeries":["Season 2","Season 3","Season 4","Season 5","Season 6"],"playedBy":"Liam Cunningham"},{"url":"https://www.anapioficeandfire.com/api/characters/148","id":148,"name":"Arya Stark","gender":"Female","culture":"Northmen","born":"In 289 AC, at Winterfell","died":"","alive":true,"titles":"Princess","aliases":["Arya Horseface","Arya Underfoot","Arry","Lumpyface","Lumpyhead","Stickboy","Weasel","Nymeria","Squan","Saltb","Cat of the Canaly","Bets","The Blind Girh","The Ugly Little Girl","Mercedenl","Mercye"],"father":"","mother":"","spouse":"","allegiances":"House Stark of Winterfell","books":[],"povBooks":["A Game of Thrones","A Clash of Kings","A Storm of Swords","A Feast for Crows","A Dance with Dragons"],"tvSeries":["Season 1","Season 2","Season 3","Season 4","Season 5","Season 6"],"playedBy":"Maisie Williams"},{"url":"https://www.anapioficeandfire.com/api/characters/149","id":149,"name":"Arys Oakheart","gender":"Male","culture":"Reach","born":"At Old Oak","died":"In 300 AC, at the Greenblood","alive":false,"titles":"Ser","aliases":"","father":"","mother":"","spouse":"","allegiances":"House Oakheart of Old Oak","books":["A Game of Thrones","A Clash of Kings","A Storm of Swords","A Dance with Dragons"],"povBooks":"A Feast for Crows","tvSeries":"","playedBy":""},{"url":"https://www.anapioficeandfire.com/api/characters/150","id":150,"name":"Asha Greyjoy","gender":"Female","culture":"Ironborn","born":"In 275 AC or 276 AC, at Pyke","died":"","alive":true,"titles":["Princess","Captain of the Black Wind","Conqueror of Deepwood Motte"],"aliases":["Esgred","The Kraken's Daughter"],"father":"","mother":"","spouse":"https://www.anapioficeandfire.com/api/characters/1372","allegiances":["House Greyjoy of Pyke","House Ironmaker"],"books":["A Game of Thrones","A Clash of Kings"],"povBooks":["A Feast for Crows","A Dance with Dragons"],"tvSeries":["Season 2","Season 3","Season 4"],"playedBy":"Gemma Whelan"},{"url":"https://www.anapioficeandfire.com/api/characters/168","id":168,"name":"Barristan Selmy","gender":"Male","culture":"Westeros","born":"In 237 AC","died":"","alive":true,"titles":["Ser","Hand of the Queen"],"aliases":["Barristan the Bold","Arstan Whitebeard","Ser Grandfather","Barristan the Old","Old Ser"],"father":"","mother":"","spouse":"","allegiances":["House Selmy of Harvest Hall","House Targaryen of King's Landing"],"books":["A Game of Thrones","A Clash of Kings","A Storm of Swords","A Feast for Crows","The World of Ice and Fire"],"povBooks":"A Dance with Dragons","tvSeries":["Season 1","Season 3","Season 4","Season 5"],"playedBy":"Ian McElhinney"},{"url":"https://www.anapioficeandfire.com/api/characters/2066","id":2066,"name":"Varamyr","gender":"Male","culture":"Free Folk","born":"At a village Beyond the Wall","died":"In 300 AC, at a village Beyond the Wall","alive":false,"titles":"","aliases":["Varamyr Sixskins","Haggon","Lump"],"father":"","mother":"","spouse":"","allegiances":[],"books":"A Storm of Swords","povBooks":"A Dance with Dragons","tvSeries":"","playedBy":""},{"url":"https://www.anapioficeandfire.com/api/characters/208","id":208,"name":"Brandon Stark","gender":"Male","culture":"Northmen","born":"In 290 AC, at Winterfell","died":"","alive":true,"titles":"Prince of Winterfell","aliases":["Bran","Bran the Broken","The Winged Wolf"],"father":"","mother":"","spouse":"","allegiances":"House Stark of Winterfell","books":"A Feast for Crows","povBooks":["A Game of Thrones","A Clash of Kings","A Storm of Swords","A Dance with Dragons"],"tvSeries":["Season 1","Season 2","Season 3","Season 4","Season 6"],"playedBy":"Isaac Hempstead-Wright"},{"url":"https://www.anapioficeandfire.com/api/characters/216","id":216,"name":"Brienne of Tarth","gender":"Female","culture":"","born":"In 280 AC","died":"","alive":true,"titles":"","aliases":["The Maid of Tarth","Brienne the Beauty","Brienne the Blue"],"father":"","mother":"","spouse":"","allegiances":["House Baratheon of Storm's End","House Stark of Winterfell","House Tarth of Evenfall Hall"],"books":["A Clash of Kings","A Storm of Swords","A Dance with Dragons"],"povBooks":"A Feast for Crows","tvSeries":["Season 2","Season 3","Season 4","Season 5","Season 6"],"playedBy":"Gwendoline Christie"},{"url":"https://www.anapioficeandfire.com/api/characters/232","id":232,"name":"Catelyn Stark","gender":"Female","culture":"Rivermen","born":"In 264 AC, at Riverrun","died":"In 299 AC, at the Twins","alive":false,"titles":"Lady of Winterfell","aliases":["Catelyn Tully","Lady Stoneheart","The Silent Sistet","Mother Mercilesr","The Hangwomans"],"father":"","mother":"","spouse":"https://www.anapioficeandfire.com/api/characters/339","allegiances":["House Stark of Winterfell","House Tully of Riverrun"],"books":["A Feast for Crows","A Dance with Dragons"],"povBooks":["A Game of Thrones","A Clash of Kings","A Storm of Swords"],"tvSeries":["Season 1","Season 2","Season 3"],"playedBy":"Michelle Fairley"},{"url":"https://www.anapioficeandfire.com/api/characters/238","id":238,"name":"Cersei Lannister","gender":"Female","culture":"Westerman","born":"In 266 AC, at Casterly Rock","died":"","alive":true,"titles":["Light of the West","Queen Dowager","Protector of the Realm","Lady of Casterly Rock","Queen Regent"],"aliases":[],"father":"","mother":"","spouse":"https://www.anapioficeandfire.com/api/characters/901","allegiances":"House Lannister of Casterly Rock","books":["A Game of Thrones","A Clash of Kings","A Storm of Swords"],"povBooks":["A Feast for Crows","A Dance with Dragons"],"tvSeries":["Season 1","Season 2","Season 3","Season 4","Season 5","Season 6"],"playedBy":"Lena Headey"},{"url":"https://www.anapioficeandfire.com/api/characters/339","id":339,"name":"Eddard Stark","gender":"Male","culture":"Northmen","born":"In 263 AC, at Winterfell","died":"In 299 AC, at Great Sept of Baelor in King's Landing","alive":false,"titles":["Lord of Winterfell","Warden of the North","Hand of the King","Protector of the Realm","Regent"],"aliases":["Ned","The Ned","The Quiet Wolf"],"father":"","mother":"","spouse":"https://www.anapioficeandfire.com/api/characters/232","allegiances":"House Stark of Winterfell","books":["A Clash of Kings","A Storm of Swords","A Feast for Crows","A Dance with Dragons","The World of Ice and Fire"],"povBooks":"A Game of Thrones","tvSeries":["Season 1","Season 6"],"playedBy":["Sean Bean","Sebastian Croft","Robert Aramayo"]},{"url":"https://www.anapioficeandfire.com/api/characters/529","id":529,"name":"Jaime Lannister","gender":"Male","culture":"Westerlands","born":"In 266 AC, at Casterly Rock","died":"","alive":true,"titles":["Ser","Lord Commander of the Kingsguard","Warden of the East (formerly)"],"aliases":["The Kingslayer","The Lion of Lannister","The Young Lion","Cripple"],"father":"","mother":"","spouse":"","allegiances":"House Lannister of Casterly Rock","books":["A Game of Thrones","A Clash of Kings"],"povBooks":["A Storm of Swords","A Feast for Crows","A Dance with Dragons"],"tvSeries":["Season 1","Season 2","Season 3","Season 4","Season 5"],"playedBy":"Nikolaj Coster-Waldau"},{"url":"https://www.anapioficeandfire.com/api/characters/576","id":576,"name":"Jon Connington","gender":"Male","culture":"Stormlands","born":"In or between 263 AC and 265 AC","died":"","alive":true,"titles":["Lord of Griffin's Roost","Hand of the King","Hand of the True King"],"aliases":"Griffthe Mad King's Hand","father":"","mother":"","spouse":"","allegiances":["House Connington of Griffin's Roost","House Targaryen of King's Landing"],"books":["A Storm of Swords","A Feast for Crows","The World of Ice and Fire"],"povBooks":"A Dance with Dragons","tvSeries":"","playedBy":""},{"url":"https://www.anapioficeandfire.com/api/characters/583","id":583,"name":"Jon Snow","gender":"Male","culture":"Northmen","born":"In 283 AC","died":"","alive":true,"titles":"Lord Commander of the Night's Watch","aliases":["Lord Snow","Ned Stark's Bastard","The Snow of Winterfell","The Crow-Come-Over","The 998th Lord Commander of the Night's Watch","The Bastard of Winterfell","The Black Bastard of the Wall","Lord Crow"],"father":"","mother":"","spouse":"","allegiances":"House Stark of Winterfell","books":"A Feast for Crows","povBooks":["A Game of Thrones","A Clash of Kings","A Storm of Swords","A Dance with Dragons"],"tvSeries":["Season 1","Season 2","Season 3","Season 4","Season 5","Season 6"],"playedBy":"Kit Harington"},{"url":"https://www.anapioficeandfire.com/api/characters/60","id":60,"name":"Aeron Greyjoy","gender":"Male","culture":"Ironborn","born":"In or between 269 AC and 273 AC, at Pyke","died":"","alive":true,"titles":["Priest of the Drowned God","Captain of the Golden Storm (formerly)"],"aliases":["The Damphair","Aeron Damphair"],"father":"","mother":"","spouse":"","allegiances":"House Greyjoy of Pyke","books":["A Game of Thrones","A Clash of Kings","A Storm of Swords","A Dance with Dragons"],"povBooks":"A Feast for Crows","tvSeries":"Season 6","playedBy":"Michael Feast"},{"url":"https://www.anapioficeandfire.com/api/characters/605","id":605,"name":"Kevan Lannister","gender":"Male","culture":"","born":"In 244 AC","died":"In 300 AC, at King's Landing","alive":false,"titles":["Ser","Master of laws","Lord Regent","Protector of the Realm"],"aliases":"","father":"","mother":"","spouse":"https://www.anapioficeandfire.com/api/characters/327","allegiances":"House Lannister of Casterly Rock","books":["A Game of Thrones","A Clash of Kings","A Storm of Swords","A Feast for Crows"],"povBooks":"A Dance with Dragons","tvSeries":["Season 1","Season 2","Season 5","Season 6"],"playedBy":"Ian Gelder"},{"url":"https://www.anapioficeandfire.com/api/characters/743","id":743,"name":"Melisandre","gender":"Female","culture":"Asshai","born":"At Unknown","died":"","alive":true,"titles":"","aliases":["The Red Priestess","The Red Woman","The King's Red Shadow","Lady Red","Lot Seven"],"father":"","mother":"","spouse":"","allegiances":[],"books":["A Clash of Kings","A Storm of Swords","A Feast for Crows"],"povBooks":"A Dance with Dragons","tvSeries":["Season 2","Season 3","Season 4","Season 5","Season 6"],"playedBy":"Carice van Houten"},{"url":"https://www.anapioficeandfire.com/api/characters/751","id":751,"name":"Merrett Frey","gender":"Male","culture":"Rivermen","born":"In 262 AC","died":"In 300 AC, at Near Oldstones","alive":false,"titles":"","aliases":"Merrett Muttonhead","father":"","mother":"","spouse":"https://www.anapioficeandfire.com/api/characters/712","allegiances":"House Frey of the Crossing","books":["A Game of Thrones","A Clash of Kings","A Feast for Crows","A Dance with Dragons"],"povBooks":"A Storm of Swords","tvSeries":"","playedBy":""},{"url":"https://www.anapioficeandfire.com/api/characters/844","id":844,"name":"Quentyn Martell","gender":"Male","culture":"Dornish","born":"In 281 AC, at Sunspear, Dorne","died":"In 300 AC, at Meereen","alive":false,"titles":"Prince","aliases":["Frog","Prince Frog","The prince who came too late","The Dragonrider"],"father":"","mother":"","spouse":"","allegiances":"House Nymeros Martell of Sunspear","books":["A Game of Thrones","A Clash of Kings","A Storm of Swords","A Feast for Crows"],"povBooks":"A Dance with Dragons","tvSeries":"","playedBy":""},{"url":"https://www.anapioficeandfire.com/api/characters/954","id":954,"name":"Samwell Tarly","gender":"Male","culture":"Andal","born":"In 283 AC, at Horn Hill","died":"","alive":true,"titles":"","aliases":["Sam","Ser Piggy","Prince Pork-chop","Lady Piggy","Sam the Slayer","Black Sam","Lord of Ham"],"father":"","mother":"","spouse":"","allegiances":"House Tarly of Horn Hill","books":["A Game of Thrones","A Clash of Kings","A Dance with Dragons"],"povBooks":["A Storm of Swords","A Feast for Crows"],"tvSeries":["Season 1","Season 2","Season 3","Season 4","Season 5","Season 6"],"playedBy":"John Bradley-West"},{"url":"https://www.anapioficeandfire.com/api/characters/957","id":957,"name":"Sansa Stark","gender":"Female","culture":"Northmen","born":"In 286 AC, at Winterfell","died":"","alive":true,"titles":"Princess","aliases":["Little bird","Alayne Stone","Jonquil"],"father":"","mother":"","spouse":"https://www.anapioficeandfire.com/api/characters/1052","allegiances":["House Baelish of Harrenhal","House Stark of Winterfell"],"books":"A Dance with Dragons","povBooks":["A Game of Thrones","A Clash of Kings","A Storm of Swords","A Feast for Crows"],"tvSeries":["Season 1","Season 2","Season 3","Season 4","Season 5","Season 6"],"playedBy":"Sophie Turner"}],"options":{"mode":"view","modes":["code","form","text","tree","view"]}},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

```r
str(gh_users, max.level = 1)
```

```
## List of 6
##  $ :List of 30
##  $ :List of 30
##  $ :List of 30
##  $ :List of 30
##  $ :List of 30
##  $ :List of 30
```

```r
listviewer::jsonedit(gh_users, mode = "view")
```

<!--html_preserve--><div id="htmlwidget-406cab9eae14aaa23c8b" style="width:672px;height:480px;" class="jsonedit html-widget"></div>
<script type="application/json" data-for="htmlwidget-406cab9eae14aaa23c8b">{"x":{"data":[{"login":"gaborcsardi","id":660288,"avatar_url":"https://avatars.githubusercontent.com/u/660288?v=3","gravatar_id":"","url":"https://api.github.com/users/gaborcsardi","html_url":"https://github.com/gaborcsardi","followers_url":"https://api.github.com/users/gaborcsardi/followers","following_url":"https://api.github.com/users/gaborcsardi/following{/other_user}","gists_url":"https://api.github.com/users/gaborcsardi/gists{/gist_id}","starred_url":"https://api.github.com/users/gaborcsardi/starred{/owner}{/repo}","subscriptions_url":"https://api.github.com/users/gaborcsardi/subscriptions","organizations_url":"https://api.github.com/users/gaborcsardi/orgs","repos_url":"https://api.github.com/users/gaborcsardi/repos","events_url":"https://api.github.com/users/gaborcsardi/events{/privacy}","received_events_url":"https://api.github.com/users/gaborcsardi/received_events","type":"User","site_admin":false,"name":"Gábor Csárdi","company":"Mango Solutions, @MangoTheCat ","blog":"http://gaborcsardi.org","location":"Chippenham, UK","email":"csardi.gabor@gmail.com","hireable":[],"bio":[],"public_repos":52,"public_gists":6,"followers":303,"following":22,"created_at":"2011-03-09T17:29:25Z","updated_at":"2016-10-11T11:05:06Z"},{"login":"jennybc","id":599454,"avatar_url":"https://avatars.githubusercontent.com/u/599454?v=3","gravatar_id":"","url":"https://api.github.com/users/jennybc","html_url":"https://github.com/jennybc","followers_url":"https://api.github.com/users/jennybc/followers","following_url":"https://api.github.com/users/jennybc/following{/other_user}","gists_url":"https://api.github.com/users/jennybc/gists{/gist_id}","starred_url":"https://api.github.com/users/jennybc/starred{/owner}{/repo}","subscriptions_url":"https://api.github.com/users/jennybc/subscriptions","organizations_url":"https://api.github.com/users/jennybc/orgs","repos_url":"https://api.github.com/users/jennybc/repos","events_url":"https://api.github.com/users/jennybc/events{/privacy}","received_events_url":"https://api.github.com/users/jennybc/received_events","type":"User","site_admin":false,"name":"Jennifer (Jenny) Bryan","company":"University of British Columbia","blog":"https://twitter.com/JennyBryan","location":"Vancouver, BC, Canada","email":[],"hireable":[],"bio":"prof at UBC, humane #rstats, statistics, teach @STAT545-UBC, leadership of @rOpenSci, @rsheets, academic director @ubc-mds","public_repos":168,"public_gists":54,"followers":780,"following":34,"created_at":"2011-02-03T22:37:41Z","updated_at":"2016-10-24T07:20:26Z"},{"login":"jtleek","id":1571674,"avatar_url":"https://avatars.githubusercontent.com/u/1571674?v=3","gravatar_id":"","url":"https://api.github.com/users/jtleek","html_url":"https://github.com/jtleek","followers_url":"https://api.github.com/users/jtleek/followers","following_url":"https://api.github.com/users/jtleek/following{/other_user}","gists_url":"https://api.github.com/users/jtleek/gists{/gist_id}","starred_url":"https://api.github.com/users/jtleek/starred{/owner}{/repo}","subscriptions_url":"https://api.github.com/users/jtleek/subscriptions","organizations_url":"https://api.github.com/users/jtleek/orgs","repos_url":"https://api.github.com/users/jtleek/repos","events_url":"https://api.github.com/users/jtleek/events{/privacy}","received_events_url":"https://api.github.com/users/jtleek/received_events","type":"User","site_admin":false,"name":"Jeff L.","company":[],"blog":"http://biostat.jhsph.edu/~jleek/","location":"Baltimore,MD","email":[],"hireable":[],"bio":[],"public_repos":67,"public_gists":12,"followers":3958,"following":6,"created_at":"2012-03-24T18:16:43Z","updated_at":"2016-10-05T13:03:04Z"},{"login":"juliasilge","id":12505835,"avatar_url":"https://avatars.githubusercontent.com/u/12505835?v=3","gravatar_id":"","url":"https://api.github.com/users/juliasilge","html_url":"https://github.com/juliasilge","followers_url":"https://api.github.com/users/juliasilge/followers","following_url":"https://api.github.com/users/juliasilge/following{/other_user}","gists_url":"https://api.github.com/users/juliasilge/gists{/gist_id}","starred_url":"https://api.github.com/users/juliasilge/starred{/owner}{/repo}","subscriptions_url":"https://api.github.com/users/juliasilge/subscriptions","organizations_url":"https://api.github.com/users/juliasilge/orgs","repos_url":"https://api.github.com/users/juliasilge/repos","events_url":"https://api.github.com/users/juliasilge/events{/privacy}","received_events_url":"https://api.github.com/users/juliasilge/received_events","type":"User","site_admin":false,"name":"Julia Silge","company":[],"blog":"juliasilge.com","location":"Salt Lake City, UT","email":[],"hireable":[],"bio":"Data science and visualization, #rstats, parenthood, reading, food/wine/coffee, #NASADatanauts.","public_repos":26,"public_gists":4,"followers":115,"following":10,"created_at":"2015-05-19T02:51:23Z","updated_at":"2016-10-20T10:41:43Z"},{"login":"leeper","id":3505428,"avatar_url":"https://avatars.githubusercontent.com/u/3505428?v=3","gravatar_id":"","url":"https://api.github.com/users/leeper","html_url":"https://github.com/leeper","followers_url":"https://api.github.com/users/leeper/followers","following_url":"https://api.github.com/users/leeper/following{/other_user}","gists_url":"https://api.github.com/users/leeper/gists{/gist_id}","starred_url":"https://api.github.com/users/leeper/starred{/owner}{/repo}","subscriptions_url":"https://api.github.com/users/leeper/subscriptions","organizations_url":"https://api.github.com/users/leeper/orgs","repos_url":"https://api.github.com/users/leeper/repos","events_url":"https://api.github.com/users/leeper/events{/privacy}","received_events_url":"https://api.github.com/users/leeper/received_events","type":"User","site_admin":false,"name":"Thomas J. Leeper","company":"London School of Economics","blog":"http://www.thomasleeper.com","location":"London, United Kingdom","email":[],"hireable":true,"bio":"Political scientist and R hacker. Interested in open science, public opinion research, surveys, experiments, crowdsourcing, and cloud computing.","public_repos":99,"public_gists":46,"followers":213,"following":230,"created_at":"2013-02-07T21:07:00Z","updated_at":"2016-10-20T10:36:25Z"},{"login":"masalmon","id":8360597,"avatar_url":"https://avatars.githubusercontent.com/u/8360597?v=3","gravatar_id":"","url":"https://api.github.com/users/masalmon","html_url":"https://github.com/masalmon","followers_url":"https://api.github.com/users/masalmon/followers","following_url":"https://api.github.com/users/masalmon/following{/other_user}","gists_url":"https://api.github.com/users/masalmon/gists{/gist_id}","starred_url":"https://api.github.com/users/masalmon/starred{/owner}{/repo}","subscriptions_url":"https://api.github.com/users/masalmon/subscriptions","organizations_url":"https://api.github.com/users/masalmon/orgs","repos_url":"https://api.github.com/users/masalmon/repos","events_url":"https://api.github.com/users/masalmon/events{/privacy}","received_events_url":"https://api.github.com/users/masalmon/received_events","type":"User","site_admin":false,"name":"Maëlle Salmon","company":"ISGlobal","blog":"https://masalmon.github.io/","location":"Barcelona, Spain","email":[],"hireable":[],"bio":"I use R for getting, preparing, visualizing and analyzing data mostly about air quality & public health.","public_repos":31,"public_gists":0,"followers":34,"following":38,"created_at":"2014-08-05T08:10:04Z","updated_at":"2016-10-24T09:54:57Z"}],"options":{"mode":"view","modes":["code","form","text","tree","view"]}},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

# map(): Extract elements

A template for basic map() usage is `map(YOUR_LIST, YOUR_FUNCTION)`


```r
# Extract elements with name "name" - restrict to first few elements
map(got_chars[1:4], "name")
```

```
## [[1]]
## [1] "Theon Greyjoy"
## 
## [[2]]
## [1] "Tyrion Lannister"
## 
## [[3]]
## [1] "Victarion Greyjoy"
## 
## [[4]]
## [1] "Will"
```

```r
# Extract elements on the basis of integer values
map(got_chars[5:8], 3)
```

```
## [[1]]
## [1] "Areo Hotah"
## 
## [[2]]
## [1] "Chett"
## 
## [[3]]
## [1] "Cressen"
## 
## [[4]]
## [1] "Arianne Martell"
```

```r
# Using the pipe %>%
got_chars[1:4] %>% 
  map("name")
```

```
## [[1]]
## [1] "Theon Greyjoy"
## 
## [[2]]
## [1] "Tyrion Lannister"
## 
## [[3]]
## [1] "Victarion Greyjoy"
## 
## [[4]]
## [1] "Will"
```

```r
got_chars[5:8] %>% 
  map(3)
```

```
## [[1]]
## [1] "Areo Hotah"
## 
## [[2]]
## [1] "Chett"
## 
## [[3]]
## [1] "Cressen"
## 
## [[4]]
## [1] "Arianne Martell"
```

In summary, are two shortcuts for making the .f function that map() will apply:

  - provide “TEXT” to extract the element named “TEXT”
         equivalent to function(x) x[["TEXT"]]
  - provide i to extract the i-th element
         equivalent to function(x) x[[i]]

## Exercises

Use names() to inspect the names of the list elements associated with a single character. What is the index or position of the playedBy element? Use the character and position shortcuts to extract the playedBy elements for all characters.


```r
map(got_chars[1:4], "playedBy")
```

```
## [[1]]
## [1] "Alfie Allen"
## 
## [[2]]
## [1] "Peter Dinklage"
## 
## [[3]]
## [1] ""
## 
## [[4]]
## [1] "Bronson Webb"
```

```r
map(got_chars[1:4], 18)
```

```
## [[1]]
## [1] "Alfie Allen"
## 
## [[2]]
## [1] "Peter Dinklage"
## 
## [[3]]
## [1] ""
## 
## [[4]]
## [1] "Bronson Webb"
```

What happens if you use the character shortcut with a string that does not appear in the lists’ names?


```r
map(got_chars[1:4], "namess")
```

```
## [[1]]
## NULL
## 
## [[2]]
## NULL
## 
## [[3]]
## NULL
## 
## [[4]]
## NULL
```

## Type-specific map

map() always returns a list, even if all the elements have the same flavor and are of length one. But in that case, you might prefer a simpler object: an atomic vector.


```r
#returns a list
map(got_chars[9:12], "name")
```

```
## [[1]]
## [1] "Daenerys Targaryen"
## 
## [[2]]
## [1] "Davos Seaworth"
## 
## [[3]]
## [1] "Arya Stark"
## 
## [[4]]
## [1] "Arys Oakheart"
```

```r
#returns atomic vector
map_chr(got_chars[9:12], "name")
```

```
## [1] "Daenerys Targaryen" "Davos Seaworth"     "Arya Stark"        
## [4] "Arys Oakheart"
```

## Extract multiple values


```r
got_chars[[3]][c("name", "culture", "gender", "born")]
```

```
## $name
## [1] "Victarion Greyjoy"
## 
## $culture
## [1] "Ironborn"
## 
## $gender
## [1] "Male"
## 
## $born
## [1] "In 268 AC or before, at Pyke"
```

```r
#using map
x <- map(got_chars, `[`, c("name", "culture", "gender", "born"))
str(x[16:17])
```

```
## List of 2
##  $ :List of 4
##   ..$ name   : chr "Brandon Stark"
##   ..$ culture: chr "Northmen"
##   ..$ gender : chr "Male"
##   ..$ born   : chr "In 290 AC, at Winterfell"
##  $ :List of 4
##   ..$ name   : chr "Brienne of Tarth"
##   ..$ culture: chr ""
##   ..$ gender : chr "Female"
##   ..$ born   : chr "In 280 AC"
```

```r
#using extract from magrittr
library(magrittr)
```

```
## 
## Attaching package: 'magrittr'
```

```
## The following object is masked from 'package:purrr':
## 
##     set_names
```

```r
x <- map(got_chars, extract, c("name", "culture", "gender", "born"))
str(x[18:19])
```

```
## List of 2
##  $ :List of 4
##   ..$ name   : chr "Catelyn Stark"
##   ..$ culture: chr "Rivermen"
##   ..$ gender : chr "Female"
##   ..$ born   : chr "In 264 AC, at Riverrun"
##  $ :List of 4
##   ..$ name   : chr "Cersei Lannister"
##   ..$ culture: chr "Westerman"
##   ..$ gender : chr "Female"
##   ..$ born   : chr "In 266 AC, at Casterly Rock"
```

## Data frame output

Above, we extrcated lists from `map` list. However, we can stack-up these results row-wise 


```r
map_df(got_chars, extract, c("name", "culture", "gender", "id", "born", "alive"))
```

```
## # A tibble: 30 x 6
##    name               culture  gender    id born                     alive
##    <chr>              <chr>    <chr>  <int> <chr>                    <lgl>
##  1 Theon Greyjoy      Ironborn Male    1022 In 278 AC or 279 AC, at… TRUE 
##  2 Tyrion Lannister   ""       Male    1052 In 273 AC, at Casterly … TRUE 
##  3 Victarion Greyjoy  Ironborn Male    1074 In 268 AC or before, at… TRUE 
##  4 Will               ""       Male    1109 ""                       FALSE
##  5 Areo Hotah         Norvoshi Male    1166 In 257 AC or before, at… TRUE 
##  6 Chett              ""       Male    1267 At Hag's Mire            FALSE
##  7 Cressen            ""       Male    1295 In 219 AC or 220 AC      FALSE
##  8 Arianne Martell    Dornish  Female   130 In 276 AC, at Sunspear   TRUE 
##  9 Daenerys Targaryen Valyrian Female  1303 In 284 AC, at Dragonsto… TRUE 
## 10 Davos Seaworth     Westeros Male    1319 In 260 AC or before, at… TRUE 
## # ... with 20 more rows
```

Notice how the variables have been automatically type converted. It’s a beautiful thing. Until it’s not. When programming, it is safer, but more cumbersome, to explicitly specify type and build your data frame the usual way.


```r
got_chars %>% {
  tibble(
    name <- map_chr(., "name"),
    culture <- map_chr(., "culture"),
    gender <- map_chr(., "gender"),
    id <- map_int(., "id"),
    born <- map_chr(., "born"),
    alive <- map_lgl(., "alive")
  )
}
```

```
## # A tibble: 30 x 6
##    `name <- map_chr… `culture <- map_c… `gender <- map_c… `id <- map_int(…
##    <chr>             <chr>              <chr>                        <int>
##  1 Theon Greyjoy     Ironborn           Male                          1022
##  2 Tyrion Lannister  ""                 Male                          1052
##  3 Victarion Greyjoy Ironborn           Male                          1074
##  4 Will              ""                 Male                          1109
##  5 Areo Hotah        Norvoshi           Male                          1166
##  6 Chett             ""                 Male                          1267
##  7 Cressen           ""                 Male                          1295
##  8 Arianne Martell   Dornish            Female                         130
##  9 Daenerys Targary… Valyrian           Female                        1303
## 10 Davos Seaworth    Westeros           Male                          1319
## # ... with 20 more rows, and 2 more variables: `born <- map_chr(.,
## #   "born")` <chr>, `alive <- map_lgl(., "alive")` <lgl>
```

# Simplifying data

A great use of purrr’s map() functions is to dig information out of a non-rectangular data structure and create a neat data frame. 

## Name and position shortcuts

Who are these GitHub users?

We need to reach into each user’s list and pull out the element that holds the user’s name or, maybe, username. How?


```r
map(gh_users, "login")
```

```
## [[1]]
## [1] "gaborcsardi"
## 
## [[2]]
## [1] "jennybc"
## 
## [[3]]
## [1] "jtleek"
## 
## [[4]]
## [1] "juliasilge"
## 
## [[5]]
## [1] "leeper"
## 
## [[6]]
## [1] "masalmon"
```

# Specifying the function in map()

Let's now work on three more ways to specify general `.f` function in map():

  - an existing function
  - an anonymous function, defined on-the-fly, as usual
  - a formula: this is unique to purrr and provides a very concise way to define an anonymous function
  
In Game of Thrones character list, got_chars, each character can have aliases, which are stored in a vector in each character’s component. We pull out the aliases for three characters to use as our demo.


```r
aliases <- set_names(map(got_chars, "aliases"), map_chr(got_chars, "name"))
aliases <- aliases[c("Theon Greyjoy", "Asha Greyjoy", "Brienne of Tarth")]
```

## Existing function

Use a pre-existing function. Or, as here, define one ourselves, which gives a nice way to build-in our specification for the  collapse argument.


```r
my_fun <- function(x)
  paste(x, collapse = " | ")

map(aliases, my_fun)
```

```
## $`Theon Greyjoy`
## [1] "Prince of Fools | Theon Turncloak | Reek | Theon Kinslayer"
## 
## $`Asha Greyjoy`
## [1] "Esgred | The Kraken's Daughter"
## 
## $`Brienne of Tarth`
## [1] "The Maid of Tarth | Brienne the Beauty | Brienne the Blue"
```


## Anonymous function, conventional

Define an anonymous function on-the-fly, in the conventional way. Here we put our desired value for the collapse argument into the function defintion itself.


```r
map(aliases, function(x) paste(x, collapse = " | ")) 
```

```
## $`Theon Greyjoy`
## [1] "Prince of Fools | Theon Turncloak | Reek | Theon Kinslayer"
## 
## $`Asha Greyjoy`
## [1] "Esgred | The Kraken's Daughter"
## 
## $`Brienne of Tarth`
## [1] "The Maid of Tarth | Brienne the Beauty | Brienne the Blue"
```

## Anonymous function, formula

We saved possibly the best for last.

purrr provides a very concise way to define an anonymous function: as a formula. This should start with the ~ symbol and then look like a typical top-level expression, as you might write in a script. Use .x to refer to the input, i.e. an individual element of the primary vector or list.


```r
map(aliases, ~ paste(.x, collapse = " | "))
```

```
## $`Theon Greyjoy`
## [1] "Prince of Fools | Theon Turncloak | Reek | Theon Kinslayer"
## 
## $`Asha Greyjoy`
## [1] "Esgred | The Kraken's Daughter"
## 
## $`Brienne of Tarth`
## [1] "The Maid of Tarth | Brienne the Beauty | Brienne the Blue"
```

# List columns

Getting and preparing data


```r
load("trump_tweets_df.rda")
#glimpse(trump_tweets_df)

tweets <- trump_tweets_df$text
tweets %>% head() %>% strtrim(70)
```

```
## [1] "My economic policy speech will be carried live at 12:15 P.M. Enjoy!"   
## [2] "Join me in Fayetteville, North Carolina tomorrow evening at 6pm. Ticke"
## [3] "#ICYMI: \"Will Media Apologize to Trump?\" https://t.co/ia7rKBmioA"    
## [4] "Michael Morell, the lightweight former Acting Director of C.I.A., and "
## [5] "The media is going crazy. They totally distort so many things on purpo"
## [6] "I see where Mayor Stephanie Rawlings-Blake of Baltimore is pushing Cro"
```

```r
tweets <- tweets[c(1, 2, 5, 6, 198, 347, 919)]
tweets %>% strtrim(70)
```

```
## [1] "My economic policy speech will be carried live at 12:15 P.M. Enjoy!"   
## [2] "Join me in Fayetteville, North Carolina tomorrow evening at 6pm. Ticke"
## [3] "The media is going crazy. They totally distort so many things on purpo"
## [4] "I see where Mayor Stephanie Rawlings-Blake of Baltimore is pushing Cro"
## [5] "Bernie Sanders started off strong, but with the selection of Kaine for"
## [6] "Crooked Hillary Clinton is unfit to serve as President of the U.S. Her"
## [7] "The Cruz-Kasich pact is under great strain. This joke of a deal is fal"
```

