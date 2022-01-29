# **DevOps Practitioner Lab 3 - TDD**
## ***TDD to improve Code Quality***
## Task
Write a program that prints the numbers 1-100, each on a new line
* For each number that is a multiple of 3, print "Fizz" instead of the number
* For each number that is a multiple of 5, print "Buzz" instead of the number
* For each number that is a multiple of both 3 and 5, print "FizzBuzz" instead of the number

## Approach
To write this program, you will use a Test Driven Development(TDD) approach. 
It will be a local development outside of your git repository. 
TDD follows a simple pattern. where you write a test first and then write a code to pass the test.
1. Create a project directory outside of your git repo.
```
cd /home/ec2-user/environment/
mkdir fizzbuzz
cd fizzbuzz
```
2. Create a file *test_fizzbuzz.py* in the *fizzbuzz* folder. Add the following content.
```
import fizzbuzz
import unittest
```
Python comes with the unittest library built in. To use it, all you need to do is import it and subclass unittest.TestCase. Then you can create a series of functions that represent the tests that you want to run.

You also need to import the functions you want to test. In our case its *fizzbuzz*

### **Add first test case**
* For each number that is a multiple of 3, print "Fizz" instead of the number

3. Add following content to test the divisibility by 3 (replace the whole content from file).
```
import fizzbuzz
import unittest
class TestFizzBuzz(unittest.TestCase):
   def test_multiple_of_three(self):
      self.assertEqual(fizzbuzz.process(6), 'Fizz')
      self.assertEqual(fizzbuzz.process(3), 'Fizz')
if __name__ == '__main__':
   unittest.main()
```
In this test function, you are sending two numbers that are divisible by 3 and expecting a returned value to be ‘Fizz’

4. Now you are ready to write your code. Create a file “*fizzbuzz.py*” in the same folder. Add the following code in the file.
```
def process(number):
   if number % 3 == 0:
       return 'Fizz'
```
This Function accepts a number and returns Fizz if that number is divisible by 3.

5. Now you are ready to run the test. In the terminal run the following command to see the testing result.
```
python test_fizzbuzz.py 
```
> your output would be like this
 ```
 .
----------------------------------------------------------------------
Ran 1 test in 0.001s

OK
```
### **Add second test case**
* For each number that is a multiple of 5, print "Buzz" instead of the number
 
6. To add a second test case, add another method in your testfizzbuzz class. Open the file “*test_fizzbuzz.py*” and add the following code.
```
import fizzbuzz
import unittest
class TestFizzBuzz(unittest.TestCase):
 def test_multiple_of_three(self):
       self.assertEqual(fizzbuzz.process(6), 'Fizz')
       self.assertEqual(fizzbuzz.process(3), 'Fizz')
   def test_multiple_of_five(self):
       self.assertEqual(fizzbuzz.process(20), 'Buzz')
       self.assertEqual(fizzbuzz.process(5), 'Buzz')
if __name__ == '__main__':
   unittest.main()

```
The new test method is sending numbers that are divisible by 5 and expecting an output ‘Buzz’.

7. Run your test case. In your terminal run the following command. 
```
python test_fizzbuzz.py 
```
>your output would be like this
```
F.
======================================================================
FAIL: test_multiple_of_five (__main__.TestFizzBuzz)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "test_fizzbuzz.py", line 7, in test_multiple_of_five
    self.assertEqual(fizzbuzz.process(20), 'Buzz')
AssertionError: None != 'Buzz'

----------------------------------------------------------------------
Ran 2 tests in 0.001s

FAILED (failures=1)
```
Now you need to go back to your code and fix the error in the processing that expects output “Buzz”. i.e. if number is divisible by 5, the process should return “Buzz”

8. Modify your process in the “*fizzbuzz.py*” file and add a conditional return for numbers divisible by 5. Add the following code.
```
def process(number):
   if number % 3 == 0:
       return 'Fizz'
   elif number % 5 == 0:
       return 'Buzz'
```
9. Now run the test again. In your terminal run the following command. 
```
python test_fizzbuzz.py
````

>your output should be like this

```
Student0:~/environment/fizzbuzz $ python test_fizzbuzz.py 
..
----------------------------------------------------------------------
Ran 2 tests in 0.001s

OK
```
Now move on to writing the next test case.

### **The third test case**

* For each number that is a multiple of both 3 and 5, print "FizzBuzz" instead of the number
10.  To add the third test case, add another method in your testfizzbuzz class. Open the file “*test_fizzbuzz.py*” and add the following code.
```
import fizzbuzz
import unittest
class TestFizzBuzz(unittest.TestCase):
   def test_multiple_of_three(self):
       self.assertEqual(fizzbuzz.process(6), 'Fizz')
       self.assertEqual(fizzbuzz.process(3), 'Fizz')
   def test_multiple_of_five(self):
       self.assertEqual(fizzbuzz.process(20), 'Buzz')
       self.assertEqual(fizzbuzz.process(5), 'Buzz')
   def test_fizzbuzz(self):
       self.assertEqual(fizzbuzz.process(15), 'FizzBuzz')
       self.assertEqual(fizzbuzz.process(30), 'FizzBuzz')
 
if __name__ == '__main__':
   unittest.main()
```
The new test method is sending numbers that are divisible by both 5 and 3 and expecting an output ‘FizzBuzz’.

11. Run your test case. In your terminal run the following command. 
```
python test_fizzbuzz.py
```
>your output would be like this
```
F..
======================================================================
FAIL: test_fizzbuzz (__main__.TestFizzBuzz)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "test_fizzbuzz.py", line 11, in test_fizzbuzz
    self.assertEqual(fizzbuzz.process(15), 'FizzBuzz')
AssertionError: 'Fizz' != 'FizzBuzz'
- Fizz
+ FizzBuzz


----------------------------------------------------------------------
Ran 3 tests in 0.001s

FAILED (failures=1)
```
Now you need to go back to your code and fix the error in the processing that expects output “FizzBuzz”. i.e. if number is divisible by 15, the process should return “FizzBuzz”

12. Modify your process in the “*fizzbuzz.py*” file and add a conditional return for numbers divisible by both 5 and 3. Add the following code.
```
def process(number):
    if number % 3 == 0:
        if number % 5 == 0:
            return 'FizzBuzz'
        return 'Fizz'
    elif number % 5 == 0:
        return 'Buzz'
```
This checks if the number is divisible by 3. if yes, it checks if it's also divisible by 5, if yes, returns ‘FizzBuzz’ if not returns ‘Fizz’ and finally if its divisible by 5 returns ‘Buzz’

This covers all the test cases from the given task. But is this complete? What about the numbers that dont fall in either category? i.e. 2,4,98 etc. Lets write another test case to handle those 
cases.

13. To add the third test case, add another method in your testfizzbuzz class. Open the file “*test_fizzbuzz.py*” and add the following code.
```
import fizzbuzz
import unittest
class TestFizzBuzz(unittest.TestCase):
   def test_multiple_of_three(self):
       self.assertEqual(fizzbuzz.process(6), 'Fizz')
       self.assertEqual(fizzbuzz.process(3), 'Fizz')
   def test_multiple_of_five(self):
       self.assertEqual(fizzbuzz.process(20), 'Buzz')
       self.assertEqual(fizzbuzz.process(5), 'Buzz')
   def test_fizzbuzz(self):
       self.assertEqual(fizzbuzz.process(15), 'FizzBuzz')
       self.assertEqual(fizzbuzz.process(30), 'FizzBuzz')
   def test_regular_numbers(self):
       self.assertEqual(fizzbuzz.process(2), 2)
       self.assertEqual(fizzbuzz.process(98), 98)
 
if __name__ == '__main__':
   unittest.main()
```
The new test method is sending numbers that are neither divisible 5 nor 3 and expecting an output of a number itself.

As expected this test will fail. Go ahead and try running the test and see what output you get.

To fix the error, lets modify the process

14. Modify your process in the “*fizzbuzz.py*” file and add the final return statement to handle all other numbers.
```
def process(number):
    if number % 3 == 0:
        if number % 5 == 0:
            return 'FizzBuzz'
        return 'Fizz'
    elif number % 5 == 0:
        return 'Buzz'
    else:
        return number
```
This returns the number itself if none of the conditions match.

15. Go ahead and run your test cases and they should all Pass.

Congratulations, you have completed your programming task using TDD approach
