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
For our example. <br>
Name your yaml file as “build.yml” and use following content </p>

**build.yml**
```
name: Java CI with Maven

on:
  push:
    branches: [ main, feature/* ]
  pull_request:
    branches: [ main ]

jobs:
  build:

    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2

      - name: Set up JDK 11
        uses: actions/setup-java@v2
        with:
          java-version: '11'
          distribution: 'adopt'
          cache: maven
  
      - name: Build with Maven Wrapper
        run: ./mvnw clean -B package
        
      - name: Create Artifacts
        run: |
          sudo apt-get install zip
          zip deploy_artifacts.zip target/*.jar appspec.yml run.sh setup.sh stop.sh
          
      - name: Upload Artifacts
        uses: actions/upload-artifact@v2
        with:
          name: jar-file
          path: deploy_artifacts.zip

```         
<mark> <b>Remember to Save the file.</b>

Your new GitHub Actions workflow is now installed for your repository and will run automatically each time someone pushes a change to the repository. 

Learn more about the syntax of the yaml file [here](https://docs.github.com/en/actions/learn-github-actions/understanding-github-actions)


* Your first github action workflow is now ready to run. Commit the changes and push.
run following commands in your terminal
```
git add .
git commit -m "adding build action"
git push --set-upstream origin feature/Student0
```
 <span style="color:red">Change the branch name to match with the branch that you created in lab 0.</span>

*you will be prompted for username- enter Student ``` your team number ```
for password enter the Personal access token provided to you*

* Login to GitHub and open url - <https://github.com/conceptsandbeyond/devopsfundamentals>
* Click on Actions tab

   ![](static/lab1-2.png)



Move on to the next lab to add the subsequent actions.










