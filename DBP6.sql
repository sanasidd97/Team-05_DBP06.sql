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

10.  List of software, total number of software sold by year
 

	select s.SoftwareName,Year(I.InvoiceDate) as InvoiceYear, sum(i.QtySold) as TotalQtysold
	from Invoice i 
	join software s on s.SoftwareID = i.SoftwareID
	group by s.SoftwareName,Year(I.InvoiceDate)

Query 10 provides the list of software, total number of software sold by year.

11.  List of top 5 employees who has worked most hours? 

	select e.EmployeeFirstName,sum(HoursWorked) TotalHoursWorked
	from employee e
	join WorkLog w on e.Employeeid = w.employeeid
	group by e.EmployeeFirstName
	order by TotalHoursWorked desc
	Limit 5

Query 11 shows the list of top 5 employees who have worked the most hours.

 
12.  Which branch sells the most QTY? 

	Select b.BranchName,sum(I.QTYSold) as TotalQTYSold
	from Invoice i
	join Branch b on i.BranchId = b.BranchId
	group by b.BranchName
	Order by TotalQtySold desc
	Limit 1

Query 12 shows the branch that sells the most quantity. 

13. List of software sold on December 2019? 

	select distinct s.SoftwareName
	from Invoice i 
	join software s on s.SoftwareID = i.SoftwareID
	where year(i.InvoiceDate) = 2019 and  month(i.InvoiceDate) = (12)

Query 13 lists the software that is sold on December 2019.

14.  List of top 5 employee who sold most qty? 

	Select e.EmployeeFirstName,sum(I.QTYSold) as TotalQTYSold
	from Invoice i
	join employee e on i.EmployeeID = e.EmployeeID
	group by e.EmployeeFirstName
	Order by TotalQtySold desc
	Limit 5

Query 14 lists the top 5 employees who have sold most quantity. 

15. List of employees' name and total hours worked on a year 2019? 

	select e.EmployeeFirstName,sum(HoursWorked) TotalHoursWorked
	from employee e
	join WorkLog w on e.Employeeid = w.employeeid
	where year (w.WorkDate) = 2019
	group by e.EmployeeFirstName
	order by TotalHoursWorked desc

Query 15 shows us the list of employees' name and total hours worked on a year 2019.

16.  List of employees who worked more than 8 hours a day. 

	select Distinct e.EmployeeFirstName
	from employee e
	join WorkLog w on e.Employeeid = w.employeeid
	where HoursWorked > 8

Query 16 depicts the list of employees who worked more than 8 hours a day.

17.  How many employees worked on July 1st? 

	select Distinct e.EmployeeFirstName
	from employee e
	join WorkLog w on e.Employeeid = w.employeeid
	where month(w.hoursWorked) = 7
 	and day(w.Hoursworked) = 1

Query 17 shows how many employees worked on July 1st.


18. List of employees who getting paid less than $30 per hour? 

	select EmployeeFirstName,EmployeeLastName,WageRate
	from employee
	Where WageRate < 30

Lastly, Query 18 is related to the list of employees who getting paid less than $30 per hour.
