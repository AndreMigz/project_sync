# Project:Sync ⏲️ 📁 
[![CI](https://github.com/AndreMigz/project_sync/actions/workflows/ci.yml/badge.svg)](https://github.com/AndreMigz/project_sync/actions/workflows/ci.yml)
- Time Tracking & Project Manangement Web App

## Features 🚀
- **Time Tracking:** Keep track of hours spent on tasks and projects.
- **Project Management**: Organize and manage tasks across multiple projects.
- **User Authentication**: Secure login and signup functionality.
- **Analytics Dashboard**: Gain insights with detailed reports and charts. (Under development 🚧)

## Preview 👀
![image](https://github.com/user-attachments/assets/a4badef8-970a-4fed-96a4-d0ab107e22ea)


## System Requirements
* **Ruby version**: 3.3.5
* System Dependecies
  * **NodeJs version**: 23.3.x
  * **Rails version**: 8.0.0 or higher
  * **Postgresql version**: 16.6 or higher
  * **Yarn version**: 1.22.22 or higher
* Getting started 💻
  - To get started with the application, follow these steps to clone the repository:
    - Open your terminal.
    - Navigate to the directory where you want to place the project.
    - Run the following command:
    ```bash
    git clone https://github.com/your-username/project-sync.git
    ```
    - Navigate into the project directory:
    ```bash
    cd project-sync
    ```
    - Install the required project dependencies:
    ```bash
    bundle install  
    yarn install
    ``` 
* Database setup ⚙️
  - To setup the database you can run the following terminal commnads in your project directory.
  ```bash
    rails db:create
    rails db:migrate
  ```
* How to run the test suite 🧪
  - The current test uses Rspec and to run the test use run this on the terminal.
  ```bash
    bundle exec rspec
  ```
* Compiling Assets
  - To apply new changes from css and stimulus controllers this terminal command needs to be run.
  ```bash
    rails assets:precompile
  ```

* Start local server
  -  To run the local server run this command in the terminal and visit http://localhost:3000/
    ```bash
    bin/dev
  ```
