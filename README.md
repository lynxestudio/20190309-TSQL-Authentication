# User Identification and Authentication with Transact-SQL

Doing user authentication in SQL Server can be customized; you can use all kinds of data from a database to authenticate users. Every application needs to deal with security, making sure that sensitive data cannot be accessed by the wrong users. You can write your own custom logic to verify user names and passwords and make sure the information is stored.

Fig 1. The database diagram.


In the database under a secure account with a password that couldn't easily be guessed by a user. The easiest way to accomplish this is to one-way encrypt user passwords on store procedure.

A simple but fully functional example is shown below.

Fig 2. The T-SQL code.


This code will insert one row, corresponding to the new user, in the users table. The SQL Server way to store passwords is by wrapping them in a built-in encrypting function called HASHBYTES .

Download example source code.
