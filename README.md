# Classic-Wow-Database
Open Source Repository for Classic WoW Database in PHP | SQL | Smarty | Dbsimple
Current Author: @BrianSQL
------------
![logo](images/logo2.png)


## Build Status
![uses badges](https://forthebadge.com/images/badges/built-by-developers.svg)

## Introduction

Classic WoW Database is an open source tool for WoW patch 1.12.1 (modeled off of the open source aowow project for WoW v3.3.5)
It has been heavily ported since then, and is in a stable state for anyone to use | learn from. 

## Included Project Components

* DB Engine       - DBSimple http://dklab.ru/lib/DbSimple/
* Template Parser - Smarty http://www.smarty.net/

## Requirements

+ Webserver running ( PHP 5.6.34 (Stable)) including PHP extensions:
  + SimpleXML
  + GD
  + Mysqli
  + mbString
  + MySQL ≥ 5.5.30


## Install

#### 1. Download the repostiory or clone it.
`git clone https://github.com/BrianSQL/Classic-Wow-Database`

#### 2. Configure configs/config.php
        Set MangosDB to be your world Database
        Set realmd to be your account Database
        
#### 3. Import tools/sql/aowow/world_1.12_AUG08_2017.sql into your world Database
        If SQL Size Restrictions -> Use SQLDumbSplitter to split your .sql file 
       
#### 4. Import the remaining SQL files from /tools/sql/aowow into your world Database    

#### 5. Import the realmd database from /tools/sql/realmd into your account Database

#### 6. CHMOD your cache file to 777

#### 7. Installation Complete
