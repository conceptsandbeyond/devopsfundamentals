# **DevOps Practitioner Lab 2 (~30 minutes)**
## ***Setting up your CI Pipeline using GitHub Actions***
In this lab you will set up the continuous testing and analysis steps for your CI pipeline. For our demo we will be using Sonar Cloud. SonarCloud helps you assess your code health and build applications with clean, safe code. Detect Bugs & Vulnerabilities & get instant feedback. Integrates w/ your DevOps platform.
<P>Please Note that this lab is dependent on Lab 1 and is to be built in continuation. </p>
<P>Please check -</p>

* That you are on the feature/Student```<your number>``` branch. 

* That you have created a .github/workflows/build.yml file.

* That you have one successful GitHub Actions workflow run.

## **Add Continuous Testing**
1. You will now add continuous testing to your pipeline. In this step you would want to continuously test the automated tests you create as you build new features
2. For our example you can run unit tests. 

3. After modifying your build.yml file, push the code

4. Check github actions workflow to see the continuous testing step added

<br><br>

## **Add Test code coverage using SonarCloud**

Spend 5 mins reviewing Sonarcloud here - https://sonarcloud.io/features

<br>
To add SonarCube analysis for your project, you will need to follow these three steps.

Step 1 - (Skip - Its already done for this project)

Create a GitHub Secret

In your GitHub repository, go to Settings > Secrets and create a new secret with the following details:

```

In the Name field, enter SONAR_TOKEN 
In the Value field, enter ***********

```
<br><br>
Step 2 - (check if its done in your branch. If not, do it)

Update your pom.xml file with the following properties:

```

<properties>
  <sonar.organization>conceptsandbeyond-git</sonar.organization>
  <sonar.host.url>https://sonarcloud.io</sonar.host.url>
</properties>

```
<br><br>
Step 3 - (your task) - 10 mins
Create or update your .github/workflows/build.yml
Here is a base configuration to run a SonarCloud analysis on your master branch and Pull Requests. If you already have some GitHub Actions, you might want to just add some of these new steps to an existing one.


```
 analyze:
    runs-on: ubuntu-latest
    needs: [test]
    steps:
      - uses: actions/checkout@v2
      
      - name: Cache SonarCloud packages
        uses: actions/cache@v1
        with:
        
          path: ~/.sonar/cache
          key: ${{ runner.os }}-sonar
          restore-keys: ${{ runner.os }}-sonar

      - name: Cache Maven packages
        uses: actions/cache@v1
        with:
          path: ~/.m2
          key: ${{ runner.os }}-m2-${{ hashFiles('**/pom.xml') }}
          restore-keys: ${{ runner.os }}-m2

      - name: Build and analyze
        env:
          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}  # Needed to get PR information, if any
          SONAR_TOKEN: ${{ secrets.SONAR_TOKEN }}
        run: mvn -B verify org.sonarsource.scanner.maven:sonar-maven-plugin:sonar -Dsonar.projectKey=conceptsandbeyond_devopsfundamentals
        
```
<br>

* Save the file

* Push the code

* Check github actions workflow to see the continuous testing step added
