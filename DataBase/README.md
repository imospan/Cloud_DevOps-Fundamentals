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
Then I've added id columns into main table and connected to other tables with `ALTER TABLE professions ADD CONSTRAINT FK_professions_races FOREIGN KEY (id_race) REFERENCES races (id);`

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

11.Delete the table and/or part of the data in the table.

12.Restore your database.

13.Transfer your local database to RDS AWS.

14.Connect to your database.

15.Execute SELECT operator similar step 6.

16.Create the dump of your database.

