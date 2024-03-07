
select *
from [protofolio project]..[covid death]
where continent is not null
order by 3,4



--select *
--from [protofolio project]..[covid vaccination]
--order by 3,4

select location, date, total_cases, new_cases, total_deaths, population
from [protofolio project]..[covid death]
where continent is not null
order by 1,2

--Loojing at Total Cases vs Total Deaths


select location, date, total_cases,  total_deaths, (total_deaths/total_cases)*100 as DeathPercentage
from [protofolio project]..[covid death]
where location like '%somalia%'
order by 1,2

--looking at Total Cases vs population
-- shows what percentage of population got covid

select location, date, population,total_cases,   (total_cases/population)*100 as DeathPercentage
from [protofolio project]..[covid death]
--where location like '%somalia%'
order by 1,2


-- looking at countries with highest infection rate compared to population

select Location,  Population, max(total_cases) as HigestInfectionCount ,max((total_cases/population))*100 as PercentPopulationIfected
from [protofolio project]..[covid death]
--where location like '%east africa%'
Group by Location, population
order by PercentPopulationIfected desc


-- showing countries with highest death count per population

select Location, MAX(cast(total_deaths as int)) as TotalDeathCount
from [protofolio project]..[covid death]
--where location like '%east africa%'
Where Continent is not null
Group by Location
order by TotalDeathCount desc

-- LET'S BREAK THINGS DOWN BY CONTINENT


select location, MAX(cast(total_deaths as int)) as TotalDeathCount
from [protofolio project]..[covid death]
--where location like '%east africa%'
Where location is not null
Group by location
order by TotalDeathCount desc

-- showing continenets with tdhe highest death count per population
select continent, MAX(cast(total_deaths as int)) as TotalDeathCount
from [protofolio project]..[covid death]
--where location like '%east africa%'
Where continent is not null
Group by continent
order by TotalDeathCount desc


--GLOBAL NUMBERS
select   SUM(new_cases) as total_cases, sum(cast(new_deaths as int)) as total deaths, sum(cast(new_deaths as int)) / sum(new_cases) *100 as DeathPercantage
from [protofolio project]..[covid death]
--where location like '%somalia%'
WHERE continent is not null
--GROUP BY date
order by 1,2

select *
from [protofolio project] ..[covid death] dea
join [protofolio project] ..[covid vaccination] vac
on dea.location = vac.location
and dea.date = vac.date

-- looking at total population  vs vaccination
Msg 8729, Level 16, State 1, Line 87
ORDER BY list of RANGE window frame has total size of 1020 bytes. Largest size supported is 900 bytes.

Completion time: 2024-03-07T09:23:09.2303116-08:00

-- USE CTE
with pr