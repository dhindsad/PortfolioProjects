CREATE DATABASE IF NOT EXISTS PORTFOLIOPROJECTS;

Select * 
From PortfolioProjects.CovidDeaths
where continent is not null;


-- Select * 
-- From PortfolioProjects.CovidVaccinations;


Select Location, date, total_cases, new_cases, total_deaths, population
From PortfolioProjects.CovidDeaths
where continent is not null;


-- Total cases vs Total Deaths

Select Location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 as Deathpercentage
From PortfolioProjects.CovidDeaths
Where location = 'Canada' and continent is not null;


-- Total cases vs population

Select Location, date, Population, total_cases,(total_cases/population)*100 as Casepercentage
From PortfolioProjects.CovidDeaths
Where location = 'Canada' and continent is not null;


-- Country with highest COVID cases

Select Location, Population, MAX(total_cases) as HighestInfectionCount, MAX((total_cases/population))*100 as Infectedpercentage
From PortfolioProjects.CovidDeaths
where continent is not null
Group by Location, Population
order by Infectedpercentage desc;

-- Country with highest death counts

Select Location, MAX(cast(total_deaths as signed)) as TotalDeathcount
From PortfolioProjects.CovidDeaths
where continent is not null
Group by  Location
order by TotalDeathcount desc;

-- BY continent
Select continent, MAX(cast(total_deaths as signed)) as ContinentDeathcount
From PortfolioProjects.CovidDeaths
where continent is not null
Group by  continent
order by ContinentDeathcount desc;

-- Global numbers

Select date, SUM(new_cases) as Total_cases, SUM(cast(new_deaths as signed)) as Total_Deaths, SUM(cast(new_deaths as signed))/SUM(new_cases)*100 as GlobalDeathPercentage
From PortfolioProjects.CovidDeaths
Where continent is not null
Group by date
Order by GlobalDeathPercentage desc;


-- COVIDVACCINATIONS
-- Total population vs Vaccinations
-- USE CTE

With PopvsVac (Continent, Location, Date, Population,New_Vaccinations, peoplevaccinated)
as(
Select dea.continent, dea.Location, dea.date, dea.population, vac.new_vaccinations,
SUM(vac.new_vaccinations) OVER (Partition by dea.Location order by dea.location, dea.Date) as peoplevaccinated
From PortfolioProjects.CovidDeaths dea
Join PortfolioProjects.CovidVaccinations vac
	On dea.location = vac.location
    and dea.date = vac.date
where dea.continent is not null
)

Select *, (peoplevaccinated/population)*100
From PopvsVac;

-- TEMP TABLE

Create Table #PercentpopulationVaccinated (
Continent nvarchar(255),
Location nvarchar(255),
Date datetime,
Population numeric,
New_vaccinations numeric,
peoplevaccinated numeric
)


INSERT into  #PercentpopulationVaccinated
Select dea.continent, dea.Location, dea.date, dea.population, vac.new_vaccinations,
SUM(vac.new_vaccinations) OVER (Partition by dea.Location order by dea.location, dea.Date) as peoplevaccinated
From PortfolioProjects.CovidDeaths dea
Join PortfolioProjects.CovidVaccinations vac
	On dea.location = vac.location
    and dea.date = vac.date
where dea.continent is not null

Select *, (peoplevaccinated/population)*100
From #PercentpopulationVaccinated;

-- Creating View to store data

Create View PercentpopulationVaccinated as
Select dea.continent, dea.Location, dea.date, dea.population, vac.new_vaccinations,
SUM(vac.new_vaccinations) OVER (Partition by dea.Location order by dea.location, dea.Date) as peoplevaccinated
From PortfolioProjects.CovidDeaths dea
Join PortfolioProjects.CovidVaccinations vac
	On dea.location = vac.location
    and dea.date = vac.date
where dea.continent is not null


Select* 
From PercentpopulationVaccinated;
