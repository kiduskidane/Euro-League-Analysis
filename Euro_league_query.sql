--- create copy table 
create table `Euro.premier_league2` as
select Name,Club,Position,Nationality,Age,Appearances,Wins,Losses,Goals,
        Tackles,Assists,Passes,Crosses,Fouls,Offsides,Interceptions, `Jersey Number`, `Yellow cards`, `Red cards`, `Own goals`
from `Euro.premier_league` 


--- Analyze Club with top 10 most apperances
select Club, Appearances, Nationality
from `Euro.premier_league2`
order by Appearances desc
limit 10

---- Analyze how many times the nationality appearance in PL
select Nationality, count(Nationality) as Nationality_Appearance
from `Euro.premier_league2`
group by Nationality
order by Nationality_Appearance desc

--- Top goal scorer in the PL 
select Name, Goals
from `Euro.premier_league2`
order by Goals desc
Limit 1 

--- Total Club goal in PL
select Club, SUM(Goals) AS Total_Goal
from `Euro.premier_league2`
group by Club 
order by Total_Goal desc

--- Oldest players in the PL 
Select Name, Age
from `Euro.premier_league2`
group by Name,Age 
order by Age desc
limit 2

--- Youngest players in the PL
Select Name, Age
from `Euro.premier_league2`
group by Name,Age 
order by Age ASC
limit 3

--- Most wins by club 
select Club, Wins
from `Euro.premier_league2`
group by club,Wins
order by Wins desc

---Most loses by Club 
select Club, losses
from `Euro.premier_league2`
group by Club, losses
order by losses desc

--- Most foul commiting player
select Name, Fouls 
from `Euro.premier_league2`
group by Name, Fouls
order by Fouls desc
limit 1

--- Player with most red cards
Select Name, `Red Cards`
from `Euro.premier_league2`
group by Name, `Red Cards`
order by `Red Cards` desc
limit 1 

--- Player with most yellow cards
Select Name, `Yellow Cards`
from `Euro.premier_league2`
group by Name, `Yellow Cards`
order by `Yellow Cards` desc
limit 1

--- player with the most assists
select Name, Assists
from `Euro.premier_league2`
group by Name, Assists
order by Assists desc
limit 1 

---relationship bn tackles, yellow cards and red cards per player1
SELECT name, SUM(`yellow cards`) AS total_yellow_cards, SUM(`red cards`) AS total_red_cards, sum(Tackles) as total_tackles
FROM `Euro.premier_league2`
GROUP BY name
ORDER BY total_yellow_cards DESC, total_red_cards DESC, total_tackles Desc
LIMIT 10;

