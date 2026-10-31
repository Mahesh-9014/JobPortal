# Online Job Portal

## 📌 Overview

The **Online Job Portal** is a web-based application that connects **Job Seekers** and **Recruiters**.

Recruiters can post jobs and manage applications, while job seekers can browse available jobs, view job details, apply for jobs, upload resumes, and track their application status.

---

## 🚀 Features

### 👤 Job Seeker

- Register and login
- Browse available jobs
- View complete job details
- Apply for jobs
- Upload a resume
- Prevent duplicate applications for the same job
- View submitted applications
- Check application status
- Logout securely

### 🏢 Recruiter

- Login as a recruiter
- Post new job openings
- View posted jobs
- View applications received for posted jobs
- Accept applications
- Reject applications
- Access recruiter profile
- Logout securely

---

## 🔐 Authentication and Authorization

The project uses **HttpSession** for user authentication.

Role-based access is implemented for:

- `RECRUITER`
- `JOB SEEKER`

Protected controllers check:

- Whether a session exists
- Whether the user is logged in
- Whether the user has the correct role

Unauthorized users are redirected to `login.jsp`.

---

## 🛠️ Technologies Used

### Backend

- Java
- Jakarta Servlets
- JSP
- JDBC

### Database

- MySQL

### Frontend

- HTML
- CSS
- Bootstrap 5
- JavaScript

### Server and Development Tools

- Apache Tomcat 11
- Eclipse IDE

---

## 📂 Project Architecture

OnlineJobPortal/
│
├── src/
│   ├── com.controller/
│   │   ├── LoginController.java
│   │   ├── LogoutController.java
│   │   ├── HomeController.java
│   │   ├── JobsController.java
│   │   ├── JobDetailsController.java
│   │   ├── PostJobController.java
│   │   ├── MyJobsController.java
│   │   ├── ApplicationController.java
│   │   ├── ApplicationsController.java
│   │   ├── RecruiterApplicationsController.java
│   │   ├── UpdateApplicationController.java
│   │   ├── ProfileController.java
│   │   └── RecruiterHomeController.java
│   │
│   ├── com.DAO/
│   │   ├── UserDAO.java
│   │   ├── JobDAO.java
│   │   └── ApplicationDAO.java
│   │
│   ├── com.model/
│   │   ├── UserModel.java
│   │   ├── JobModel.java
│   │   └── ApplicationModel.java
│   │
│   └── com.utility/
│       └── DBConnection.java
│
├── WebContent/
│   ├── login.jsp
│   ├── home.jsp
│   ├── jobs.jsp
│   ├── jobDetails.jsp
│   ├── recruiterHome.jsp
│   ├── myJobs.jsp
│   ├── applications.jsp
│   ├── recruiterApplications.jsp
│   ├── profile.jsp
│   ├── ApplicationSuccess.jsp
│   ├── ApplicationFailure.jsp
│   └── alreadyApplied.jsp
│
└── README.md

---

## 🔄 Application Workflow

### Recruiter Workflow

Login
  ↓
Recruiter Home
  ↓
Post Job
  ↓
Job Stored in MySQL
  ↓
View My Jobs
  ↓
View Applications
  ↓
Accept / Reject Application

### Job Seeker Workflow

Login
  ↓
Home / Jobs
  ↓
View Job Details
  ↓
Apply for Job
  ↓
Upload Resume
  ↓
Application Stored in MySQL
  ↓
View My Applications
  ↓
Check Application Status

---

## 🗄️ Main Database Tables

The project uses the following main tables:

### `users`

Stores user information such as:

- Username
- Password
- Role

### `jobs`

Stores job information such as:

- Job ID
- Title
- Company
- Location
- Description
- Skills
- Salary
- Job Type
- Recruiter Username

### `applications`

Stores application information such as:

- Application ID
- Job ID
- Username
- Applicant Name
- Email
- Phone
- Resume
- Application Status

---

## ⚙️ How to Run the Project

### 1. Clone the Repository

git clone https://github.com/Mahesh-9014/JobPortal.git

### 2. Import into Eclipse

1. Open Eclipse.
2. Go to **File → Import**.
3. Select **Existing Projects into Workspace**.
4. Select the project folder.
5. Click **Finish**.

### 3. Configure MySQL

Create the required database and tables.

Then configure your database connection in:

com.utility.DBConnection.java

Update:

- Database URL
- MySQL username
- MySQL password

### 4. Configure Apache Tomcat

1. Add Apache Tomcat 11 to Eclipse.
2. Add the project to the Tomcat server.
3. Start the server.

### 5. Run the Application

Run the project using:

Right Click Project
→ Run As
→ Run on Server

The application URL depends on your Eclipse/Tomcat deployment configuration.

---

## 📸 Main Functionalities

- Dynamic job listing from MySQL
- Job details page
- Resume upload
- Duplicate application prevention
- Application status management
- Recruiter application management
- Session management
- Role-based page access
- Logout functionality

---

## 🔮 Future Improvements

- Search jobs by title or skills
- Filter jobs by location
- Edit and delete jobs
- Pagination
- Email notifications
- Password encryption using hashing
- Resume file type and size validation
- Better error handling
- JavaScript `fetch()` for dynamically loading job data
- REST API integration

---

## 👨‍💻 Author

Mahesh Gorajana

---

## 📄 Note

This project was developed for learning and practicing:

- Java Web Development
- Servlets
- JSP
- JDBC
- MySQL
- Session Management
- Role-Based Authentication
