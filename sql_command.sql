--http://stackoverflow.com/questions/6841605/get-top-1-row-of-each-group
-- get first record of group by records

;WITH cte AS
(
   SELECT *,
         ROW_NUMBER() OVER (PARTITION BY DocumentID ORDER BY DateCreated DESC) AS rn
   FROM DocumentStatusLogs
)
SELECT *
FROM cte
WHERE rn = 1

-- http://stackoverflow.com/questions/2112618/finding-duplicate-rows-in-sql-server
-- get duplicate records

select o.orgName, oc.dupeCount, o.id
from organizations o
inner join (
    SELECT orgName, COUNT(*) AS dupeCount
    FROM organizations
    GROUP BY orgName
    HAVING COUNT(*) > 1
) oc on o.orgName = oc.orgName

-- http://stackoverflow.com/questions/7887011/how-to-drop-a-table-if-it-exists-in-sql-server
-- dorp a table if it exists

--Instead, for a permanent table you can use
IF OBJECT_ID('dbo.Scores', 'U') IS NOT NULL 
  DROP TABLE dbo.Scores; 
--temporary table you can use
IF OBJECT_ID('tempdb.dbo.#T', 'U') IS NOT NULL
  DROP TABLE #T; 
  
-- http://stackoverflow.com/questions/10153648/correct-use-of-transactions-in-sql-server-2008
-- transaction in ms sql server

BEGIN TRANSACTION [Tran1]

BEGIN TRY

INSERT INTO [Test].[dbo].[T1]
  ([Title], [AVG])
VALUES ('Tidd130', 130), ('Tidd230', 230)

UPDATE [Test].[dbo].[T1]
  SET [Title] = N'az2' ,[AVG] = 1
WHERE [dbo].[T1].[Title] = N'az'


COMMIT TRANSACTION [Tran1]

END TRY
BEGIN CATCH
  ROLLBACK TRANSACTION [Tran1]
END CATCH  

GO

-- http://stackoverflow.com/questions/224732/sql-update-from-one-table-to-another-based-on-a-id-match
-- SQL update from one Table to another based on a ID match

UPDATE
    Sales_Import
SET
    Sales_Import.AccountNumber = RAN.AccountNumber
FROM
    Sales_Import SI
INNER JOIN
    RetrieveAccountNumber RAN
ON 
    SI.LeadID = RAN.LeadID;
