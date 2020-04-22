1.	List of customer name, software name and qty they purchased
         
      	 select c.CustomerFirstName,c.CustomerLastName,s.SoftwareName, sum(i.QTYSold) TotalQtySold
         from Customer c 
         Join Invoice i on c.CustomerId = i.customerid
         join software s on s.SoftwareID = i.SoftwareID
         Group by c.CustomerFirstName,c.CustomerLastName,s.SoftwareName;
Query 1 describes the list of customer name, software name and quantity they purchased so that we know about the customer data



2.     List of software name, total number of qty sold where total software sold is more than 30.

	select s.SoftwareName,sum(i.qtysold) TotalQTYSold
        from Invoice i 
        join software s on s.SoftwareID = i.SoftwareID
         group by s.SoftwareName
         Having TotalQTYSold > 30
Query 2 describes the name of the software and shows result on how many total quantities of product is sold.
 
3.     List of customers who purshased software Krish? 
        
 	select c.CustomerFirstName,c.CustomerLastName,s.SoftwareName
 	from Customer c 
	Join Invoice i on c.CustomerId = i.customerid
	join software s on s.SoftwareID = i.SoftwareID
	where s.SoftwareName = 'Krish'

Query 3 shows the result on which customer bought the software named Krish


4.    Which software has sold more than 100 units? 
      
	select s.SoftwareName
	from Invoice i 
	join software s on s.SoftwareID = i.SoftwareID
	group by s.SoftwareName
	Having sum(QtySold) > 100

 Query 4 shows the result related to the software that has sold more than 100 units. 

5.    Which software is the best-selling software in Chicago? 

	select s.SoftwareName,b.BranchName,sum(QtySold) as TotalQTYSold
	from Invoice i 
	join software s on s.SoftwareID = i.SoftwareID
	join Branch b on i.BranchId = b.branchId
	Where BranchName = 'Chicago'
	group by s.SoftwareName,b.BranchName
	Order by TotalQtySold desc
	Limit 1;

Query 5 describes about the software that is the best-selling software in Chicago

6.     Total number of software were sold over the summer months (May to August)? 
	select s.SoftwareName,Sum(QtySold) as TotalQTYSold
	from Invoice i 
	join software s on s.SoftwareID = i.SoftwareID
	where month(i.InvoiceDate)  in (5,6,7,8)
	group by  s.SoftwareName

Query 6 answers this question: Total number of software were sold over the summer months (May to August)?

7.    List of employees making more than $30 per hour? 

	select EmployeeFirstName,EmployeeLastName,WageRate
	from employee
	Where WageRate > 30

Query 7: Output shows the list of employees making more than $30 per hour.

8.    Which company ordered software ID 3? 

	select distinct c.CustomerFirstName,C.CustomerLastName,i.softwareId
	from Customer c
	join invoice i on c.customerId = i.CustomerId
	where i.softwareId = 3

Query 8: Which company ordered software ID 3? 

9.    Which state is using the most marketing software no 4? 

	select c.CustomerState,count(*) as TotalNumber
	from Customer c
	join invoice i on c.customerId = i.CustomerId
	where i.softwareId = 4
	group by c.CustomerState
	order by TotalNumber desc

Query 9: Which state is using the most marketing software no 4? 
