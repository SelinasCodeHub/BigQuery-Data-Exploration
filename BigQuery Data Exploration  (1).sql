/*The top 3 Continuum of Care areas (CoC_Name in the table) with the highest number of unaccompanied homeless youth under 18 in the year 2018.*/

SELECT CoC_Name,
Homeless_Unaccompanied_Youth_Under_18
FROM `merit-america-data-project-sg.Exploration_Project.homelessness`
WHERE Count_Year = 2018
ORDER BY Homeless_Unaccompanied_Youth_Under_18 DESC
LIMIT 100

/* In Delaware (state abbreviation is “DE”), the number of unsheltered homeless people has been increasing over the past 7 years, True or False? */
SELECT Unsheltered_Homeless, Count_Year
FROM `merit-america-data-project-sg.Exploration_Project.homelessness`
WHERE State = "DE"
ORDER BY Count_Year DESC
LIMIT 100

/*In 2018, how many different locations had at least 1 person as a Sheltered_SH?*/
SELECT COUNT(DISTINCT CoC_Name) AS Num_Locations
FROM `merit-america-data-project-sg.Exploration_Project.homelessness`
WHERE Count_Year = 2018 AND Sheltered_SH_Homeless > 0

/*In 2018, what was the CoC_Name of the top 3 locations in terms of number of Sheltered_SH? */
SELECT CoC_Name AS Locations_2018, Sheltered_SH_Homeless AS Num_SH_Homeless
FROM `merit-america-data-project-sg.Exploration_Project.homelessness`
WHERE Count_Year = 2018 AND Sheltered_SH_Homeless > 0
ORDER BY Sheltered_SH_Homeless DESC
Limit 3

/*What are the top 7 states in terms of Overall Homeless population in the year 2018?*/
SELECT State, SUM(Overall_Homeless) AS Total_Overall_Homeless
FROM `merit-america-data-project-sg.Exploration_Project.homelessness`
WHERE Count_Year = 2018
GROUP BY State
ORDER BY Total_Overall_Homeless DESC
Limit 7

/*Generate a list of all locations, in 2018, that have more than 1000 Overall Homeless, but less than 100 unsheltered homeless.*/ 
SELECT CoC_Name , Overall_Homeless, Unsheltered_Homeless
FROM `merit-america-data-project-sg.Exploration_Project.homelessness`
WHERE Count_Year = 2018 AND Overall_Homeless > 1000 AND Unsheltered_Homeless < 100
ORDER BY Overall_Homeless DESC

/*From that same list, in which locations do Unsheltered Homeless account for less than 2% of the Overall Homeless population?*/
SELECT CoC_Name , Overall_Homeless, Unsheltered_Homeless
FROM `merit-america-data-project-sg.Exploration_Project.homelessness`
WHERE Count_Year = 2018 AND Overall_Homeless > 1000 AND Unsheltered_Homeless < 100 AND (Unsheltered_Homeless/Overall_Homeless * 100) < 2
ORDER BY Overall_Homeless



