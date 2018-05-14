---
title: "BAM-featureCount"
author: "Sehrish Kanwal"
date: "Mon 2018-May-14"
output: 
  html_document: 
    keep_md: yes
editor_options: 
  chunk_output_type: console
---



Required packages


```r
library(purrr)
library(repurrrsive)
library(listviewer)
```

```
## Warning: package 'listviewer' was built under R version 3.4.4
```

`listviewer` is an interactive way to explore objects vs `str`. `wesanderson` is a list from repurrrsive


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

<!--html_preserve--><div id="htmlwidget-c32a952bebb84da79ebc" style="width:672px;height:480px;" class="jsonedit html-widget"></div>
<script type="application/json" data-for="htmlwidget-c32a952bebb84da79ebc">{"x":{"data":{"GrandBudapest":["#F1BB7B","#FD6467","#5B1A18","#D67236"],"Moonrise1":["#F3DF6C","#CEAB07","#D5D5D3","#24281A"],"Royal1":["#899DA4","#C93312","#FAEFD1","#DC863B"],"Moonrise2":["#798E87","#C27D38","#CCC591","#29211F"],"Cavalcanti":["#D8B70A","#02401B","#A2A475","#81A88D","#972D15"],"Royal2":["#9A8822","#F5CDB4","#F8AFA8","#FDDDA0","#74A089"],"GrandBudapest2":["#E6A0C4","#C6CDF7","#D8A499","#7294D4"],"Moonrise3":["#85D4E3","#F4B5BD","#9C964A","#CDC08C","#FAD77B"],"Chevalier":["#446455","#FDD262","#D3DDDC","#C7B19C"],"Zissou":["#3B9AB2","#78B7C5","#EBCC2A","#E1AF00","#F21A00"],"FantasticFox":["#DD8D29","#E2D200","#46ACC8","#E58601","#B40F20"],"Darjeeling":["#FF0000","#00A08A","#F2AD00","#F98400","#5BBCD6"],"Rushmore":["#E1BD6D","#EABE94","#0B775E","#35274A","#F2300F"],"BottleRocket":["#A42820","#5F5647","#9B110E","#3F5151","#4E2A1E","#550307","#0C1707"],"Darjeeling2":["#ECCBAE","#046C9A","#D69C4E","#ABDDDE","#000000"]},"options":{"mode":"view","modes":["code","form","text","tree","view"]}},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->
