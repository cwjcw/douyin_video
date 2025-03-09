DECLARE @yesterdayStart DATETIME;
DECLARE @yesterdayEnd DATETIME;

-- 计算昨天的起始时间和结束时间
SET @yesterdayStart = DATEADD(day, -90, CAST(GETDATE() AS DATE)); -- 昨天的 00:00:00
SET @yesterdayEnd = DATEADD(SECOND, -1, DATEADD(DAY, DATEDIFF(DAY, 0, GETDATE()), 0));   -- 昨天的 23:59:59

-- 查看变量的值 (可以省略，用于调试)
--SELECT @yesterdayStart AS YesterdayStart, @yesterdayEnd AS YesterdayEnd;

SELECT
    CAST(cus.CreateTime AS DATE) AS createdate,
    COUNT(*) AS numbers
FROM
    bjCustomM cus
WHERE
    cus.CreateTime BETWEEN @yesterdayStart AND @yesterdayEnd
    AND cus.FromSourceId = 'B68'
GROUP BY
    CAST(cus.CreateTime AS DATE)
ORDER BY
    CAST(cus.CreateTime AS DATE) DESC



