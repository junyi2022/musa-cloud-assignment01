/*
    What is the percent change in trips in Q3 2022 as compared to Q3 2021?

    Using only the tables from Q3 2021 and Q3 2022 (i.e. not directly using the
    number calculated in the previous question), find the percent change in the
    number of trips in Q3 2022 as compared to 2021. Round your answer to two
    decimal places and name the resulting field `perc_change`.

    Remember you can do calculations in the select clause.
*/

-- Enter your SQL query here

WITH year_2021 AS (
    SELECT COUNT(*) AS trip21
    FROM indego.trips_2021_q3
)

SELECT ROUND(100 * (year_2022.trip22 * 1.00 - year_2021.trip21) / year_2021.trip21, 2)::text || '%' AS perc_change
FROM (
    SELECT COUNT(*) AS trip22
    FROM indego.trips_2022_q3
) AS year_2022 CROSS JOIN year_2021;


/*
    If you want to get fancier here, you can cast the result to a string and
    concatenate a '%' to the end. For example:

        (10 + 3.2)::text || '%' AS perc_change

    This uses the type casting (number to string) and string concatenation
    operator (`||`, double pipes) that's essentially a `+` for strings.
*/
