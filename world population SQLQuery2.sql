
select * 
From [world population].[dbo]. world_population$
order by Rank;

--continents with the highest population over the years
select Distinct Continent 
From [world population].[dbo]. world_population$;

select continent, Sum([2022 Population]) as [2022 totalpopulation], 
 Sum([2020 population]) as [2020 totalpopulation],
 Sum([2015 population]) as [2015 totalpopulation],
 Sum([2010 population]) as [2010 totalpopulation],
 Sum([2000 population]) as [2000 totalpopulation],
 Sum([1990 population]) as [1990 totalpopulation],
 Sum([1980 population]) as [1980 totalpopulation],
 Sum([1970 population]) as [1970 totalpopulation]
From [world population].[dbo]. world_population$
where continent IN ('Asia', 'Africa','Europe','North America', 'Oceania', 'South America')
group by Continent
order by [2022 totalpopulation] DESC


-- Country with the highest growth rate

select Rank, country,continent, [Growth Rate]
From [world population].[dbo]. world_population$
order by [Growth Rate] desc;

-- population Density (per km²) 
select country,continent,[2022 Population], [Density (per kmÂ²)],[Area (kmÂ²)]
From [world population].[dbo]. world_population$
order by [Density (per kmÂ²)]  desc;

-- 2022 population percentage by countries and continents

select Sum([2022 Population]) as [World population]
From [world population].[dbo]. world_population$
where continent IN ('Asia', 'Africa','Europe','North America', 'Oceania', 'South America');


select country, continent, [2022 Population] * 100 /(
select Sum([2022 Population]) as [World population]
From [world population].[dbo]. world_population$) as [population percentage]
From [world population].[dbo]. world_population$
where continent IN ('Asia', 'Africa','Europe','North America', 'Oceania', 'South America')
order by Continent;


select continent, Sum([2022 Population]) as [2022 totalpopulation], (sum([2022 population]) * 100)/ sum(sum([2022 Population])) over() as [world percentage]
from [world population].[dbo]. world_population$
where continent IN ('Asia', 'Africa','Europe','North America', 'Oceania', 'South America')
group by continent
order by [world percentage] desc;