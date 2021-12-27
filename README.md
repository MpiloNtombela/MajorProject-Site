# Major Project (Milestone 3 & 4) -> [1 & 2](https://github.com/MpiloNtombela/MajorProject-Admin-FES)

Final year ISTN (Info Sys & Tech) Major Project ([**screenshots**](#some-screenshots))

A matric upgrade registration system

# Guidelines
 ![Visual Studio](https://img.shields.io/badge/Visual%20Studio-2019%7C2022-purple)
 ![Framework Version](https://img.shields.io/badge/.Net%20Framework-4.8-blue)

### project Structure

This project comes in two parts

- Main ASP.NET project
- SQL Database project

#### Main ASP.NET project (RegistrationSystem)

- This project includes the ASP.NET **Webforms** and ASP.NET **Web API 2**
- The aslo uses [LibMan](https://devblogs.microsoft.com/dotnet/library-manager-client-side-content-manager-for-web-apps/) to manage client side libraries

#### SQL Database project (MajorProjectDB)

- This project comes all the database tables and views used in the project
- > **NOTE:** You have to **[publish](https://medium.com/hitachisolutions-braintrust/create-your-first-visual-studio-database-project-e6c22e45145b)** the database to your desired SQL Server and change the connection string in web.config to match the one from your SQL-Server

# Config

- ###### (re)build application
  
  (re)building the application will install required ASP packages from NuGet
  
  and Client-Side libraries listed in the``libman.json`` file
  ![build](https://user-images.githubusercontent.com/72506370/147420060-3b16d942-6058-4858-b4b4-0c67ac33dcb2.png)

- ###### publish database
  
  - right-click on ``MajorProjectDB``
  
  ![Publish Database](https://user-images.githubusercontent.com/72506370/147419837-55412f6e-7593-4afa-a5e7-e9ab827cd2e9.jpg)
  
    A tutorial on how to manage and **[publish](https://medium.com/hitachisolutions-braintrust/create-your-first-visual-studio-database-project-e6c22e45145b)** a database project on Visual Studio
  
  > note: Database name is MajorProjectDB
  
  - To the published database add new roles record in the ``AspNetRoles`` table
    ![AspNetRoles](https://user-images.githubusercontent.com/72506370/147420553-c942b6ca-a6c6-4a49-a48d-fd3596b32eeb.png)
  
  - > These roles are required for the application to work properly

- ###### Run Application
  
  > If it happen you encounter error `` could not find a part of path c:\...\bin\roslyn\csc.exe``
  > ![VSbuildError](https://user-images.githubusercontent.com/72506370/147419914-58f73534-83cd-4460-a9bf-bf6f1b6472fd.png)
  > Cleaning and Rebuilding solution usually fix the error. Also refer to [SO solution](https://stackoverflow.com/questions/32780315/could-not-find-a-part-of-the-path-bin-roslyn-csc-exe)

- ###### User Secrets file
  
  - For phone number validation the project uses [Twilio sms API](https://www.twilio.com/sms) and credetial for twilio are stored in the [User Secrets](https://docs.microsoft.com/en-us/aspnet/core/security/app-secrets?view=aspnetcore-6.0&tabs=windows#manage-user-secrets-with-visual-studio) file
  
  *`sort of like this`*
  ![user secrets](https://user-images.githubusercontent.com/72506370/143964980-dfce0383-a1e9-45bd-b7d9-d506ab208e3f.png)

- Important note ⚡
  
  > Note: accounts created on the website default to `student` role. To create `admin` role accounts use [this application](https://github.com/MpiloNtombela/MajorProject-Admin-FES) ,a 'sort of' internal Winform Application to be used Admins. It work hand-in-hand with the site

## Some noticable improvements that could be made

- This project may not have the best database design😁, so definatly start with Database Table Relationships (Foriegn Keys)
- Add support Email verification/confirmation 📧✔ after signup (intergration with [Identiy Framework](https://docs.microsoft.com/en-us/aspnet/web-forms/overview/security/create-a-secure-aspnet-web-forms-app-with-user-registration-email-confirmation-and-password-reset)
- Notification system was kinda impletemented in give or take 3hrs to deadline🤧 so yeah😑😬 it uses Polling🥵, which is definently not the best or effient solution. Improvements to it may include replacing Polling with Websockets using *[SignalR](https://dotnet.microsoft.com/apps/aspnet/signalr)*
- Removing Some redundant Interfaces
- Add Role management (CRUD) interface to be used by admin
- Add Teacher's portal (to manage upgrade marks for students)


### Some screenshots

![Landing](https://user-images.githubusercontent.com/72506370/147422999-c9f1fdd4-ba52-470f-8f9a-e1c4c958d726.png)
![Registration Process](https://user-images.githubusercontent.com/72506370/147423028-2228c2b7-110f-4638-a129-a167e129301c.png)
![Student Portal](https://user-images.githubusercontent.com/72506370/147423054-e42fc809-7fbe-4d47-8a08-e448b60d5eb3.png)
![payment gateway](https://user-images.githubusercontent.com/72506370/147423196-ebfc88f4-7be9-4aa5-bd2e-5ada9502a2db.png)


##### Admin

![dash](https://user-images.githubusercontent.com/72506370/147423133-2dd0a1a7-6973-4464-99b7-948af9258741.png)
![students](https://user-images.githubusercontent.com/72506370/147423135-b07e95be-9b57-443a-8877-23b5adb00149.png)

**Checkout [sister project](https://github.com/MpiloNtombela/MajorProject-Admin-FES)**
---
**Illustrations in this project are provided with ❤ by [storyset](https://storyset.com/)**
