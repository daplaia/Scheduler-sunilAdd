Sprint Planning 1 
Summary:
Each of us worked on their own views in the past week; we showed our views to our group members and gained feedbacks and suggestions. We also discussed data structure definitions, some difficulties each member faces and some questions of UI design. After discussion, each teammate is clear about what to work on for the current week. 

Trello:
https://trello.com/b/SuBG7jG6/scheduler-app


Hanxing Zhang: 
I created two views for Daily Planner, a table view and the detailed view to edit the details of each task in the table view. The link for the commit is:
https://github.com/ECS189E/Scheduler/tree/DailyPlanner.
I plan to make several modifications to the daily planner view this week, which includes:
Present an empty table view when the user first comes to this view; let users add new tasks to the daily planner view; add another button for users to delete all tasks in this view (currently user needs to swipe each cell to delete that task); figure out sending notifications in iOS and storage issue with other teammates; connect daily planner to the main scheduler view. 


Jiajun Liang:
I created the main view UI design of scheduler based on MGSwipeTableCell.
https://github.com/ECS189E/Scheduler/commit/78a76e2dc6aaeff44536ec6d1bd9d02f79ebf6f0
https://github.com/ECS189E/Scheduler/commit/1f43dec6d4e572e414bf737e7ffd761d027bb1b8
However, the swipe button is not what we want so that we decide to build our own custom cell. I plan to set up the basic “task” class, implement a brand new cell with our own design (three labels, one button and the tao action) and set up the main scheme of our scheduler (the main table view). And then unify all view controllers together. In addition, figure out how to sort all tasks in our scheduler according to due date with the help of Yanxi, Sunil, and Hanxing. Also, help Yanxi when she wants since she is dealing with three view controllers.



Yanxi Li:
I finished the countdown timer that allows user to select a duration to count down for each sub-task(to do list objects). One challenge for milestone 2 is to detect when user leaves the view/app (instead of locking the phone) and kill that timer then. I also created the UIs for the two other views (display recorded time for each task in a table view, and detailed schedule view *new). After our discussion we found that no one is doing the detailed schedule view so I’ll also create this view for next week. 
Github commit:
https://github.com/ECS189E/Scheduler/commit/6ad9c0e141bd5e45d30443800fa29f434869a365
Trello:
https://trello.com/b/SuBG7jG6/scheduler-app


