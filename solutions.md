# Whoa hold on there buddy  
These are the solutions to all the exercises that are in the python booklet along with explanations. Have a look at this page when you've completed the exercises with your own solutions.  
The exercises may be a bit on the hard side, especially towards the middle/end of the booklet, so really try and think your way through them before you come here. Anyway let's begin: \

# Chapter 1
## Ex1
```python
print("*")
print("**")
print("***")
print("****")
```
Nothing special here, just use the print command. 

# Chapter 2
## Ex1

```python
print(7//3)
print(7%3)
```
Again nothing special here.

# Chapter 3
## Ex1
```python
celsius_temp = float(input("Please input your celsius temperature: "))
fahr_temp = celsius_temp * (9/5)
print("The corresponding Fahrenheit temperature is: " + fahr_temp)
```

We took in the Celsius temperature, then multiplied it by 9/5, (note the brackets for order of operations), and then printed it. Straightforward.

## Ex2
```python
a = 5
b = 10

temp = b
b = a
a = temp
```
This saves what b is in a temporary variable, then sets b to the value of a, and sets a to the value of the temporary variable.
And the second way is:
```python
a = 5
b = 10
a, b = b, a
```
Which is kinda just a python trick.

## Ex3
```python
km = float(input("Distance km: "))
mins = float(input("Time minutes: "))
speed = km / (mins / 60)
print("Avg speed: ", speed)
```
We converted the minutes to hours, then used speed = distance/time to get the speed.

# Chapter 4

## Ex1

```python
word = "python"
print(word[0])
print(word[-1])
print(word[1:4])
print(word[::-1])
```

# Chapter 5


# Chapter 6

## Ex1
```python
number = int(input("Enter an integer: "))
statement = "Even" if number % 2 == 0 else "Odd"
print(f"The number is {statement}")
```
This is the ternary operator in python, if the division remainder when dividing by two is 0, then it's even, otherwise it's odd.

## Ex2

```python
number = int(input("Enter the number for the multiplication table: "))
for i in range(1, number + 1):
    print(f"{i} x {number} = {i*number}")
```

Here we did the maths inside the for loop, seems pretty self explanatory.

## Ex3
```python
i = 12
while i < 0:
    print(i)
```

## Ex4
```python
maybe_prime = int(input("Enter the number to check from prime: "))
prime_ness = "prime"
for i in range(2, int(maybe_prime/2 + 1)):
    if maybe_prime % i == 0:
        prime_ness = "not prime"
        break
print(f"{maybe_prime} is {prime_ness}")
```
Here we count up to the number, and if the number divided by any number smaller than it up to halfway divides cleanly (no remainder), we break out of the loop and print the variable `prime_ness` which is our flag for whether it's prime or not.

## Ex5
```python
string = input("Enter the string to count words for: ")
counter = 0
for char in string:
    if char in ('\n', '\t', ' ', '\r'):
        counter += 1

print(counter)
```

## Ex6
```python
string = input("Enter string to replace characters: ")
for v in list(string):
    if v == ' ':
        v = '_'
    if v in "aeiou":
        v = '*'
print(string)
```
This was the manual-ish way, this is using `.replace`:

```python
string = input("Enter string to replace characters: ")
for v in "aeiou":
    string = string.replace(v, "*")
print(string.replace(" ", "_"))
```

# Chapter 8

## Ex1
```python
def doublit(x: int) -> int:
    return x * 2

y = doublit(69)
print(y)
print(doublit(5))
```

#Ex2
```python
def get_names() -> tuple:
    student_name = input("Please enter your name: ")
    teacher_name = input("Please enter your teacher's name: ")
    return student_name, teacher_name


def get_marks() -> list:
    scores = []

    for i in range(3):
        while True:
            mark = input(f"Enter your mark for homework: {i + 1}: ")
            if not mark.isdigit():
                print("Please enter a number")
                continue
            mark = int(mark)
            if mark < 0 or mark > 9:
                print("Score must be between 0 and 9")
                continue
            scores.append(mark)
            break

    return scores


def avg_scores(scores) -> float:
    return sum(scores) / len(scores)


def teacher_comment(student_name, teacher_name, marks) -> None:
    if marks >= 8:
        print(
            f"Well done, {student_name},"
            " {teacher_name} is very pleased with your effort"
        )
    elif 6 <= marks < 8:
        print(
            f"A good effort, {student_name}. However {teacher_name}"
            " thinks you should check your work more carefully."
        )
    elif marks < 5:
        print(
            f"{student_name} this is poor. "
            "{teacher_name} has asked you to try harder."
        )
    else:
        raise ValueError("Marks not in range")


def main():
    student_name, teacher_name = get_names()
    teacher_comment(student_name, teacher_name, avg_scores(get_marks()))


if __name__ == "__main__":
    main()
```
There's a lot here, remind me to explain it

# Ex4

```python
def collatz(n: int) -> int:
    counter = 0
    while n != 1:
        if n % 2 == 0:
            n /= 2
        n = n * 3 + 1
        counter += 1
    return counter
```

# Ex5
```python
number = input("Enter an integer: ")
s = set()
for digit in number:
    s.add(int(digit))

print(sum(s))
```
Or alternatively:

```python
print(sum(map(int, input("Enter an integer: "))))
```

# Ex6

```python
def collatz(n: int):
    while n != 1:
        if n % 2 == 0:
            n /= 2
            yield n
        n = n * 3 + 1
        yield n
```

# Ex7


# Chapter 10

# Ex 1
```python
def get_valid_number() -> int:
    while True:
        try:
            number = int(input("Enter a number: "))
            return number
        except ValueError:
            print("Invalid input")
```


# Chapter 12

# Ex1

