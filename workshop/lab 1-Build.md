# DevOps Practitioner Lab 1 (~30 minutes)

## Setting up your CI Pipeline using GitHub Actions 

GitHub Actions is a continuous integration and continuous delivery (CI/CD) platform that allows you to automate your build, test, and deployment pipeline. You can create workflows that build and test every pull request to your repository, or deploy merged pull requests to production. 
You can configure a GitHub Actions workflow to be triggered when an event occurs in your repository, such as a pull request being opened or an issue being created. In this example we are going to use a sample JAVA spring boot application and add github actions workflow.


Read about Github actions here - https://docs.github.com/en/actions/learn-github-actions
<br>

## Create GitHub Actions Workflow
Read instructions on creating new workflows using Github Actions here - 

https://docs.github.com/en/actions/learn-github-actions/understanding-github-actions#create-an-example-workflow


<br>     
<mark> <b>Remember to Save the file.</b>

Learn more about the syntax of the yaml file [here](https://docs.github.com/en/actions/learn-github-actions/understanding-github-actions)


*Commit the changes and push.
run following commands in your terminal. Change the <team Number> to match with your team.
```
git add .
git commit -m "adding build action"
git push --set-upstream origin feature/Student<team Number>
```
 <span style="color:red">Change the branch name to match with the branch that you created in lab 0.</span>

*you will be prompted for username- enter Student ``` your team number ```
for password enter the Personal access token provided to you*

* Login to GitHub and open url - <https://github.com/conceptsandbeyond/devopsfundamentals>
* Click on Actions tab

   ![](static/lab1-2.png)



Move on to the next lab to add the subsequent actions.










