************************************************
SORU 1                                         |
------------------------------------------------
SELECT FirstName, LastName, Salary
FROM Employees;

-- From komutunu ile hangi tabloyu kullanacağımızı belirleyip select ile istediğimiz bilgileri çekiyoruz.
************************************************
SORU 2                                         |
------------------------------------------------
SELECT Distinct departmentid
FROM Employees;

-- distinct komutu ile tüm departmanları yazdırdım.
************************************************
SORU 3                                         |
------------------------------------------------
SELECT * FROM Employees
WHERE departmentid = 1;

-- WHERE komutu ile belli bir departmentidye sahip olanları seçtim. Tabloya göre IT tarafının id'si 1
************************************************
SORU 4                                         |
------------------------------------------------
SELECT FirstName, LastName, Salary
FROM Employees
ORDER BY Salary DESC;

-- Desc ile büyükten küçüğe göre sıraladım.
************************************************
SORU 5                                         |
------------------------------------------------
SELECT FirstName || ' ' || LastName AS Tümisim, Salary
FROM Employees;

--  || ile sütunları birleştirip ismini Tümisim koydum.
