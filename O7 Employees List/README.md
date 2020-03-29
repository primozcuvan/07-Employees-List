# 07-Employees-list


This project was created by Primož Čuvan in the recruitment process for the position of Junior iOS developer for the company Outfit7.


1. The app is divided into two basic screens - "EmployeesListVC" and "AnalyticsVC" - which are presented with the Tab Bar controller. The structure of the app is organized in the ModelViewController (MVC) architecture.

2. "EmployeesListVC"
    + The list of all current employees is shown in the tableView structure with custom tableViewCell named "EmployeeTableViewCell". It can be found in the folder named "Model".
    + Each employee has some basic information written below the name (ID, birthday, gender, and salary).
    + Information about predefined employees is fetched from the "Model/EmployeeStruct".
    + There is one top bar button named "Add Employee" which presents a new screen named "AddNewEmployeeVC".
    + If the user selects a cell of an employee another screen named "PublicProfileVC" presents.

3. "AnalyticsVC"
    + Basic calculations are performed to get the information about average age, median age, max salary, and male vs female workers ratio.
    + The functions of the calculations are stored in the "Model" folder by the name "AnalyticsFunctions".

4. "AddNewEmployeeVC"
    + This screen enables user to add new employee to the list.
    + User must insert all of the required information and press "Save" button to sucessfully add new employee. 
    + If the user presses the "Save" button before inserting all information the alert will be displayed.
    + The ID information is automatically generated after the new employee is added to the list.

5. "PublicProfileVC"
+ When the user selects the employee cell in the "EmployeesListVC" the public profile of this employee is displayed.
+ The header of the tableView shows the name of the employee for whom the web search results are displayed.
+ The screen shows top 5 hits when searching employee name.
+ Each result consists of the title and the url.
+ When the user selects a search result safari opens within the app and shows the search result.

6. For the visual representation of the ViewControllers please see the file named "Main.storyboard".
