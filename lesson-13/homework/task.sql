SET DATEFIRST 7;
go
-- Step 1: Create a table-valued function to generate a calendar
CREATE FUNCTION dbo.calendar (@date DATE)
RETURNS @calendar_table TABLE (
    Sunday INT, 
    Monday INT, 
    Tuesday INT, 
    Wednesday INT, 
    Thursday INT, 
    Friday INT, 
    Saturday INT
)
AS
BEGIN

    -- Define the input parameters (Year and Month)
    DECLARE @Year INT = YEAR(@date);
    DECLARE @Month INT = MONTH(@date);

    -- Calculate the first and last days of the month
    DECLARE @FirstDayOfMonth DATE = DATEFROMPARTS(@Year, @Month, 1);
    DECLARE @LastDayOfMonth DATE = EOMONTH(@FirstDayOfMonth);

    -- Find the first Sunday before
    DECLARE @FirstSunday DATE = DATEADD(DAY, -((DATEPART(WEEKDAY, @FirstDayOfMonth) + 6) % 7), @FirstDayOfMonth);

    -- Find the last Saturday after or on the last day of the month
    DECLARE @LastSaturday DATE = DATEADD(DAY, (6 - (DATEPART(WEEKDAY, @LastDayOfMonth) % 7)), @LastDayOfMonth);

    -- Generate the date sequence from the first Sunday to the last Saturday
    ;WITH DateSequence AS (
        SELECT @FirstSunday AS CalendarDate
        UNION ALL
        SELECT DATEADD(DAY, 1, CalendarDate)
        FROM DateSequence
        WHERE CalendarDate < @LastSaturday
    ),
    -- Calculate the day of the week and week number
    DateWithInfo AS (
        SELECT 
            CalendarDate,
            DATEPART(WEEKDAY, CalendarDate) AS DayOfWeek, 
            (DATEDIFF(DAY, @FirstSunday, CalendarDate) / 7) + 1 AS WeekNumber,
            -- Check if the date belongs to the specified month
            CASE 
                WHEN MONTH(CalendarDate) = @Month THEN DAY(CalendarDate) 
                ELSE NULL 
            END AS DisplayDate
        FROM DateSequence
    )
   
    INSERT INTO @calendar_table
    SELECT 
        MAX(CASE WHEN DayOfWeek = 1 THEN DisplayDate END) AS Sunday,
        MAX(CASE WHEN DayOfWeek = 2 THEN DisplayDate END) AS Monday,
        MAX(CASE WHEN DayOfWeek = 3 THEN DisplayDate END) AS Tuesday,
        MAX(CASE WHEN DayOfWeek = 4 THEN DisplayDate END) AS Wednesday,
        MAX(CASE WHEN DayOfWeek = 5 THEN DisplayDate END) AS Thursday,
        MAX(CASE WHEN DayOfWeek = 6 THEN DisplayDate END) AS Friday,
        MAX(CASE WHEN DayOfWeek = 7 THEN DisplayDate END) AS Saturday
    FROM DateWithInfo
    GROUP BY WeekNumber
    ORDER BY WeekNumber;

    RETURN;
END;
GO

SELECT * FROM dbo.calendar('2025-07-19');
