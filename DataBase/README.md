Task DataBase Administration
==========
Part 1
----------------
1. Download MySQL server for your OS on VM.
I've used CentOS 7 installation guide from [here](https://www.digitalocean.com/community/tutorials/how-to-install-mysql-on-centos-7)
2. Install MySQL server on VM.\
Commands used for installation:
```
curl -sSLO https://dev.mysql.com/get/mysql80-community-release-el7-5.noarch.rpm
sudo rpm -ivh mysql80-community-release-el7-5.noarch.rpm
sudo yum install mysql-server
sudo systemctl start mysqld
sudo grep 'temporary password' /var/log/mysqld.log
sudo mysql_secure_installation
```
3. Select a subject area and describe the database schema, (minimum 3 tables).

I've created a small sample DB with some Lineage2 professions, their RPG classes, races and used weapons as tables.

4. Create a database on the server through the console.
![db1](https://user-images.githubusercontent.com/106439773/215357274-c7a46a7d-706f-492f-8deb-4be20355cd4a.png)
5. Fill in tables.\
![db2](https://user-images.githubusercontent.com/106439773/215443620-0c3c2322-d09c-4beb-9348-d0a12c8140a5.png)
![db3](https://user-images.githubusercontent.com/106439773/215443634-8ff47197-8790-43b3-9c90-691c766c0806.png)\
Then I've added id columns into main table and connected to other tables with\ `ALTER TABLE professions ADD CONSTRAINT FK_professions_races FOREIGN KEY (id_race) REFERENCES races (id);`

6. Construct and execute SELECT operator with WHERE, GROUP BY and ORDER BY.
![db4](https://user-images.githubusercontent.com/106439773/215456627-7a6eae29-76f8-4c9b-a763-e0e47286b962.png)

7. Execute other different SQL queries DDL, DML, DCL.\
DDL and DML command could be seen on previous steps, DCL commands shown on the next screens.
8. Create a database of new users with different privileges. Connect to the database as a new user and verify that the privileges allow or deny certain actions.
![db5](https://user-images.githubusercontent.com/106439773/215456694-6d2c7f0a-b794-42e5-8f60-c6c539e81f72.png)
![db6](https://user-images.githubusercontent.com/106439773/215456705-947dc91c-57bb-436c-aa53-5ea6382d0b04.png)

9. Make a selection from the main table DB MySQL.
![db7](https://user-images.githubusercontent.com/106439773/215456721-8a5c7e91-be16-4aa2-944a-cc195be90bce.png)

Part 2
--------------------
10.Make backup of your database.
![db8](https://user-images.githubusercontent.com/106439773/215462616-aa9956ba-0aec-4941-ad5e-1f8bbcd525a7.png)

11.Delete the table and/or part of the data in the table.
![db9](https://user-images.githubusercontent.com/106439773/215462633-ba21cb2f-2449-4340-8b43-dba63f804072.png)

12.Restore your database.
![db10](https://user-images.githubusercontent.com/106439773/215462643-49468e7e-ba36-46df-b15a-dfedee9aed34.png)
![db11](https://user-images.githubusercontent.com/106439773/215462658-59fa51df-bfe4-4139-b826-a55ef41799e5.png)

13.Transfer your local database to RDS AWS.
![db12](https://user-images.githubusercontent.com/106439773/215476713-92459cdf-8d0a-4b01-924e-715089c66f82.png)
I've created Amazon RDS via console and restored my DB from dump with\
```[mosya@localhost ~]$ mysql -h database-1.cbmjjuwmuqqv.us-east-1.rds.amazonaws.com -P 3306 -u admin -p lineage2<lineage2.sql```

14.Connect to your database. & 15.Execute SELECT operator similar step 6.
![db13](https://user-images.githubusercontent.com/106439773/215477017-4893083f-259c-4842-81eb-9329e5563e83.png)

16.Create the dump of your database.
![db14](https://user-images.githubusercontent.com/106439773/215477050-11550eef-da03-4aab-b703-8044a68e6b78.png)

