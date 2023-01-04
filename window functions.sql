/*
*  Show the population per continent
*  Database: World
*  Table: Country
*/

select 
distinct "continent", 
SUM(population) OVER w1 as "continent population"
from country
window w1 as (partition by continent);

/*
*  To the previous query add on the ability to calculate the percentage of the world population
*  What that means is that you will divide the population of that continent by the total population and multiply by 100 to get a percentage.
*  Make sure you convert the population numbers to float using `population::float` otherwise you may see zero pop up
*  Try to use CONCAT AND ROUND to make the data look pretty
*
*  Database: World
*  Table: Country
*/

select 
    distinct "continent", 
    SUM(population) OVER w1 as "continent population",
    concat(
    ROUND(
        (
            SUM( population::float ) OVER w1 / 
            SUM( population::float ) OVER()
        ) * 100
        ), '%') as "percent"
from country
window w1 as (partition by continent);


/*
*  Count the number of towns per region
*
*  Database: France
*  Table: Regions (Join + Window function)
*/

SELECT 
DISTINCT r.id, 
r."name", 
COUNT(t.id) OVER (
    PARTITION BY r.id
    ORDER BY r."name"
) AS "# of towns"
FROM regions AS r
JOIN departments AS d ON r.code = d.region 
JOIN towns AS t ON d.code = t.department
ORDER BY r.id;
