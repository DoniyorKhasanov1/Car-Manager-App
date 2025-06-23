# Car Manager app

I have thought so many kinds of project ideas to do or to work on. Recently, I came up with a decision to develop a web application that doesn't really matter

I was given a super easy project called `Mashinalar ro'yxatini boshqarish paneli`. Though I was first on this and had no any experience in that field, I just decided to try my best and started to imlpement it with creating a new project on IntelliJ IDEA. 
***

## About the project
I'm pretty sure that nobody will be interested, but I find out to give a little bit information about my project. On the project, we have three sides of the program, `model`, `controller` and `webapp`. In the model part of the program, I wrote code that involves entities and services. The program has an entity called `Car` so that I can use to instantiate and create an  object to store in my database. `CarService` class is the primary business-logic part of it ensuring insertions, creating, updating the input object into the database and it also have methods that serves as the stream of data from the database. 

In `controller` package, the CarListServlet class plays a key role to launch the program as the welcome-page. It has many servlets mapped and `doGet()`, `doPost()` methods for handling requests coming from the browser. 
