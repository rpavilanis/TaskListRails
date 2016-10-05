## What went well?
I really liked this assignment, because it aligns with some of my personal interests and capstone ideas.  I am loving Ruby on Rails.  Even though we are just beginning to learn about the functionality of Rails, it already feels so much more powerful and complete than anything we have done before.  I love combining many of the concepts we have learned thus far into a single project.  I think this project also made me feel more confident and secure in some of the previously covered concepts like CSS and Ruby.

Since I finished my project early, I was really excited about adding User functionality.  I decided to let my curiousity lead me down the path of trying to add some of those features, and I am really glad I did.  I was able to get individualized task lists working for various users, and also created a different layout page for the user home screen and the task home screen. Normally I am too nervous to experiment because I don't want to break anything.  Although I did end up breaking several things (I can no longer add a new task or mark a task as complete, because these features are not linked to a specific user), I also learned a lot.  I'm excited to learn more about adding users and user relationships in lectures this week, and I am hoping to go back in to make everything work again.

## What are you still working on understanding better?

I am definitely looking forward to learning more about how to actually create different user views.  

I also feel like CSS is an area where I kind of stumble around blindly until I get something that looks good to me.  I have used similar headers and navigation bars in my projects, because I found something that works and I am nervous to change that too much.  In my next project, I want to push myself to do something totally different (maybe a side navigation) so that I can continue building my skills in this area. 

## What did your chair pair do differently?

My chair pair had the details of each of here tasks displayed on the main page - I liked this because all of the detail is right there.  In my project, it felt like an additional unneeded step for users to have to click on a task before seeing the description. 

## 


# Task List Rails ✅
We are going to build a Task List in Rails. This web application will enable us to keep track of list of tasks with the functionality to add, edit and remove tasks from a list.

Tracking tasks in a web app will let us focus on following Rails conventions and learning how data flows through a Rails application.

## Baseline
**Once you've achieved this baseline, take a walk around the room and see if you can answer questions or help other folks.**

This project...

- Will have our standard Github setup (fork this repo and clone to your machine)
- requires you to create a Rails application
  - create a controller for your `Tasks`
  - conform to Rails conventions on naming and inflection

Baseline Part 2:
- create a `Task` model and migration.
  - create the database schema and tables with `rake db:migrate`
  - the `Task` model should include _at least_ a name, a description and a completion indicator

Tinker with your Model in the `rails console` in order to ensure you have created your model and can interact with it as expected.

## Task Data Requirements

Each task record will include all of the following. Optional in this context means that the user may choose not to provide this information, but it is still required for your schema:
- Self-incrementing identifier (ID)
- title: the title of the task
- description: details about the task
- completed_at: the time and date the task was completed

## 🌊 Wave 1
This wave is where we will introduce the view layer to interact with our application via the browser.

- Set up necessary controller(s) and route(s) that you will need in order to show a task from the database
- Create a root route for your application that directs users to the list of all tasks
  - Each task name in the list should link to a `show` action that will render a new view for the user.
  - The `show` view should include the complete information about the task: name, description, completion status, and completion date.
- All markup in all views should have semantic relevance.


## 🌊 Wave 2
In this wave we will add the first set of user interactivity and persistence.

- Be able to create a new task:
  - The home page should contain a link to Add a new task. This will give the user a form to fill out with the appropriate task fields.
  - After the new task is added, the site should take the user back to the home page which displays the full list of tasks. The new task that was just added should be included in the full list of tasks.
- Be able to delete an existing task:
  - Add a route and controller action whose responsibility is deleting a task (RESTful routes)
  - On the home page, add a button or link for each task that will, once clicked...
    1. Ask the user to confirm that they definitely want to delete the task.
    1. Delete the task from the database and redirect the user back to the list of remaining tasks

<!-- ## 🌊 Wave 3
In this wave we will extend the interactivity with users, allowing them to edit existing tasks in a couple of different ways. As always, follow _RESTful_ conventions when implementing these features.

- Add the ability for the user to mark a task complete
  - Add a button to the list of tasks on the home page that, when clicked, will mark a task complete.
  - Update the database with the task's completed date
- Add the ability for the user to edit a task's details.
  - Add an `edit` action that renders a form allowing the user to update all the fields of a task.
  - Submitting the form from the `edit` action should _update_ the existing task; not create a new one.
    - Research: ActiveRecord's `update` method.
  - Link to the `edit` action from the task's `show` page.
  - DRY up your code by reusing the view code from the `new` functionality
    - Hint: Rendering _partials_ in Rails.

 -->
