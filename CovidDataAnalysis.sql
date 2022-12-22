SELECT *
FROM [Portfolio Project]..CovidDeathsUpdated
WHERE continent IS NOT NULL
ORDER BY 3,4

--SELECT *
--FROM [Portfolio Project]..CovidVaccinations
--ORDER BY 3,4

-- Select Data that I will use

SELECT Location, date, total_cases, new_cases, total_deaths, population
FROM [Portfolio Project]..CovidDeathsUpdated
WHERE continent IS NOT NULL
ORDER BY 1,2 

--Looking at Total Cases vs Total Deaths
--Showing the likelinhood of dying if you contract covid in your country

SELECT Location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 AS DeathPercentage
FROM [Portfolio Project]..CovidDeathsUpdated
WHERE continent IS NOT NULL
ORDER BY 1,2 


--Looking at the Total Cases vs Population
--Shows what percentage of population got covid
SELECT Location, date, population, total_cases,(total_cases/population)*100 AS PercentagePopulationInfected
FROM [Portfolio Project]..CovidDeathsUpdated
WHERE continent IS NOT NULL
ORDER BY 1,2 

--Looking at coutries with highest infection rate
SELECT location, population, MAX(total_cases) AS HigestInfectionCases, 
MAX((total_cases/population))*100 AS PercentagePopulationInfected
FROM [Portfolio Project]..CovidDeathsUpdated
WHERE continent IS NOT NULL
GROUP BY location,population
ORDER BY PercentagePopulationInfected DESC

-- BREAKING THINGS DOWN
---Showing countries with the higest death count per population

SELECT continent, MAX(CAST(total_deaths AS int)) AS HigestDeathCounts
FROM [Portfolio Project]..CovidDeathsUpdated
WHERE continent IS NOT NULL
GROUP BY continent
ORDER BY HigestDeathCounts DESC 

--GLOBAL NUMBERS

SELECT SUM(new_cases) AS Total_Cases, SUM(CAST(new_deaths AS int)) AS Total_Deaths, 
SUM(CAST(new_deaths AS int))/SUM(new_cases)*100 AS DeathPercentage
FROM [Portfolio Project]..CovidDeathsUpdated
WHERE continent IS NOT NULL						

SELECT new_cases, new_deaths
FROM [Portfolio Project]..CovidDeathsUpdated


