
DECLARE @MENU TABLE (ID INT, PARENTID INT, TEXT VARCHAR(100))
INSERT INTO @MENU (ID, PARENTID, TEXT)
VALUES 
	(1, 0, 'File'),
	(2, 1, 'New'),
	(3, 1, 'Open'),
	(4, 1, 'Open recent'),
	(5, 1, 'Exit'),
	(6, 0, 'Edit'),
	(7, 6, 'Cut'),
	(8, 6, 'Copy'),
	(9, 6, 'Paste'),
	(10, 6, 'Find'),
	(11, 10, 'In file'),
	(12, 10, 'In folder'),
	(13, 4, 'Recent 1'),
	(14, 4, 'Recent 2'),
	(15, 4, 'Recent 3')


;WITH CTE AS (
    SELECT ID AS MENUID, ID, PARENTID, TEXT FROM @MENU
    
    UNION ALL

    SELECT C.MENUID, M.ID, M.PARENTID, M.TEXT
    FROM @MENU M
    INNER JOIN CTE C ON M.PARENTID = C.ID
)
SELECT * FROM CTE WHERE MENUID=6 -- READ MENU#6 AND ALL OF ITS CHILDREN
