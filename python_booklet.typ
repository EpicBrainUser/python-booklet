#import "@preview/glossarium:0.5.4": register-glossary, make-glossary, print-glossary, gls, glspl

#import "lib/glossary.typ": entries

#show: make-glossary
#register-glossary(entries) 


#import "lib/exercise.typ": exercise
#import "lib/note.typ": note
#import "lib/warning.typ": warning
#import "lib/tip.typ": tip
#let exercise-color = rgb("#EAF2F5")
#let note-color = rgb("#FFF2CC")

#set page(margin: 1.5in)

#set text(size: 13pt)  // Default was 11pt
#show raw: set text(font: "JetBrainsMonoNL NFM")


#show link: underline
#show <nonumber>: set heading(numbering: none)


#show heading.where(level: 1): it => {
  pagebreak(weak: true)
  it
}

#set quote(block: true)

#set page(
  footer: context {
    if counter(page).get().first() > 1 {
      align(right, counter(page).display("1 of 1", both: true))
    }
  }
)

// #set page(numbering: "1")
// #set page(numbering: "— 1 —", number-align: right)
// #set page(footer: context [
//     Further Python
//   #h(1fr)
//   #counter(page).display("1 / 1", both: true)
// ])

// #set heading(numbering: (nums) => {
//   let parts = nums.pos()
//   if parts.len() == 1 { "1.0" }
//   else { parts.slice(1).map(str).join(".") }
// })


// #set heading(
//   numbering: "1.",
//   supplement: [Chapter #context counter(heading).display()]
// )
// Add this show rule AFTER heading configuration
// #show heading: it => [
//   #set text(size: 24pt)  // Default is 11pt
//   #it
// ]


// Size hierarchy for headings
// #show heading.where(level: 1): it => [  // Chapter titles
//   #align(center)[
//     #set text(size: 24pt, weight: "bold")
//     #it.supplement #it.body
//   ]
// ]
// Optional: Explicitly hide numbers for subheadings
// #show heading.where(level: 2): set heading(numbering: none)
// #show heading.where(level: 3): set heading(numbering: none)

// #show heading.where(level: 2): it => [  // Subsections (1.1, 1.2)
//   #align(center)[
//   #set text(size: 18pt, weight: "medium")
//   #it.numbering #h(0.5em) #it.body
//   ]
// ]

// #show heading.where(level: 3): it => [  // Sub-subsections (1.1.1)
//   #align(center)[
//   #set text(size: 14pt, weight: "regular")
//   #it.numbering #h(0.3em) #it.body
//   ]
// ]





#box(
  stroke: 2pt + black,
  inset: 16pt,
  width: 100%
  // padding: 4pt,
  // background: lightgray
)[
  #align(center, text(48pt, weight: "bold")[
    Further Python
  ])
 #align(center, text(18pt, weight: "regular")[ The alternative and more complete guide to python programming ])
]



// ===== Heading Configuration =====
#set heading(
  numbering: "1.",
  supplement: [Chapter],
  outlined: true
)

#set heading(numbering: (..nums) => {
  if nums.pos().len() == 1 {
    "Chapter " + numbering("1.", ..nums) //prefix with chapter 
  } else {
    numbering("1.1", ..nums)
  }
})

#show heading.where(level: 1): it => {
  it
  linebreak() //force newline after chapter title
}
#show heading: it => align(center, it) // center all headings
// #set heading(level: 2, numbering: "1.1")
// #set heading(level: 3, numbering: "1.1.1")
// #set heading(level: 4, numbering: "1.1.1.1")
// #set heading(level: 5, numbering: "1.1.1.1.1")

// ===== Table of Contents =====
#outline(
  title: [
    #set text(weight: "bold", size: 1.2em)
    Contents
  ],
  depth: 5,
  indent: (n) => n * 1em
)

// ===== Separator Lines =====
#show outline.entry: it => [
  #link(it.element.location(), it.body)
  #line(length: 100%, stroke: 0.5pt)
  #v(0.5em)
]

// ===== Chapter Styling =====
#show heading.where(level: 1): set text(weight: "bold")




// Unnumbered introduction
// #heading(level: 1, outlined: false)[
//   Introduction
// ]
= Introduction

== What is this booklet, and how does it work?
This booklet is a guide to how to code where I both cover the principles of programming, which you will be able to port over to other languages you learn, and the syntax of python. Throughout I include exercises and a few worked examples. The first couple of chapters cover just the syntax and some basic principles, and towards the end I cover more of the complex and high level programming concepts.

== Meet python
Python is a very high level language that supports a lot of features and is powerful in the right hands. It can be used for a very large amount of applications, such as data science, AI/machine learning, as well as some simple embedded systems such as the raspberry pi, which which runs on python. Python has a history of being a scripting language, so it's also commonly used for some system tasks and tools. \
Due to python's high level nature, it does a lot of work under the hood for you, meaning it's fairly easy for people new to coding to pick up.
// Here are some basic things you should know about python:
// + Python is (mostly) Object Oriented.\
//   This paradigm of programming means everything is an object, you create objects, define what they do, how they interact, and the whole program is just made of objects. However in this booklet while I do talk about the object oriented and functional paradigms of python, since python is a multi paradigm language, the majority will be imperative and procedural, where you tell the program what to do step by step, rather than describing what to be done as in functional languages. 
// + Python is Dynamically typed\
//   This means you don't specify the type of #glspl("var") when you create them, and they can change throughout your program. This also means you're gonna get runtime type exceptions.
// + Python is strongly typed\
//   Unlike meme languages like JavaScript, the operation on a #gls("var") depends on its type, for example you can add two integers but not a string and an integer.
// + Python is interpreted\
//   This means that when you run a file it gets translated into machine code line by line, as opposed to compiled before execution. This means you get runtime errors more, but it also has some benefits - such as that it can run on any OS and any architecture, as it's just-in-time compiled to bytecode and then ran on the python virtual machine. This does also mean that python is a lot slower than many other languages, like C, Rust or Zig.

// #heading(level: 2, outlined: false)[
//   Setting up your environment
// ]
== Setting up your environment

=== Installing python
There are a couple ways to install python:
- Using the official package:\
Head over to #link("https://python.org/downloads")[python's website's downloads], and download and follow the instructions for installing it.\
\ 
- Using a package manager:
You can also your OS's package manager for this, so `brew` on MacOS, `winget` or `choco` on windows and `apt`, `pacman`, `zypper`, `portage`, `dnf`, `xbps`, `pkg`, or any of the others I may have missed for GNU/Linux or similar. Don't worry if you don't know what this is.

Once you have python installed, there are a couple ways to run python code on your computer, I show two ways:
- Using a shell/terminal and (neo)vim
I prefer this way and know how to this way better so I detail this below
- Using a traditional text editor, like VSCode(ium) or Zed or PyCharm
This has big friendly buttons to do everything, so if you're with one of these then you should be fine.

// #pagebreak()

=== Hold on, what is the python package?
When you installed the python package, you actually get the full python system, which has:
- The python virtual machine
- Python's 'compiler'
- A couple tools like `pip`
The way python runs is like this:\ \
``` Input -> compiled to bytecode -> ran on the virtual machine ```
\ \
This is partly why python has a reputation for being slow -- it doesn't compile to machine code. In this way python is interpreted, meaning it processes the input line by line.

=== Using the shell and vim
If you have a simple file, like this:\
```python
#!/usr/bin/env python3

def main() -> None:
    print("Hello reader!")


if __name__ == "__main__":
    main()
```
Okay that was kinda a flex for what you'll learn later on, you may as well have just written this to do the same thing:\
```python print("Hello reader!")```\
But the earlier example is something known as a script, which means on unix based systems you run ```sh chmod +x {filename}.py``` and run it with with path, for example the ```sh ./``` shorthand. It tells anyone else looking at your file that it's meant to be run directly. \
Anyway, now that you have the file, and content put into it, save it with the .py extension and open your terminal, navigate to the file and run ```sh python3 {filename}.py```\
If that didn't make sense I'll explain it in detail below, if it did, or you can't be bothered with this and want to just skip to using a GUI editor (with big friendly buttons) feel free to jump to the next heading.\
\
==== How does a terminal (shell) work?
You may have seen the 'Terminal' application, but never known how it works. If you're on Linux I'm sure you know how it does, you can skip this part. \
Really a terminal is just a UI element for a shell which uses system calls to talk to the kernel to run things. You can do almost everything you can in a GUI in a terminal, plus some other things you can't do in a GUI. \
The only thing that the shell does it navigate the file system and run executable binaries. 

===== The file system
On Unix-like systems, such as MacOS (actually based on BSD (Berkeley Software Distribution)) the file system uses / forward slashes and is just files and directories holding files. This is following the Unix philosophy. \
To navigate it use the `cd` command (change directory) and use `ls` to list the files in the directory. Use `pwd` to see your current directory. \
Here's how you might navigate it.
```sh
❯ ls
Desktop                                 Documents                              Downloads
Pictures                                Public                                 Music

~ 
❯ cd Documents/

~/Documents 
❯ ls

~/Documents 
❯ mkdir code

~/Documents 
❯ cd code

~/Documents/code 
❯ ls

~/Documents/code 
❯
```
Here all I did was list the files, go to my Documents folder and make a new folder there called code, and then went into that folder. The equivalent for doing this inside a GUI like Finder or File Explorer would be just to double click the folders to go in them, and make a folder with the right-click menu. \
Also you can go into multiple subdirectories at once by chaining them together like this:\
```sh cd ~/Documents/code```\
Here I also used the `~` shorthand for your home folder. You can check the environment variable for what it is by running:\
```sh echo $HOME```\
which will give you something like ```/Users/John Doe/``` or on Linux ```/home/John Doe```.\
To go back one directory (the 'parent' directory), you use ```sh cd ..```. Interestingly the '.' directory is the current one, and is used most commonly to run scripts, with this './' syntax. To go to the home directory run ```sh cd ``` without any arguments. 


#tip(
  title: [Tab to autocomplete],
  content: [ When you type commands, modern shells like zsh, or bash have this really helpful function, where if you press the tab key (the one above caps lock that looks like ->|) it will try to guess what you are trying to type and autocomplete it. In the terminal, when you type a path, just start typing something (like ```sh cd Docum```) and press tab to autocomplete the path. ]
)

===== Running binary executables
The other crucial part is running binary executables, which is literally anything on your system that runs. Here I'll just cover shell commands, as those are the ones you don't yet know of and need to know, but there are be many others, like your browser, and many shell commands not covered here.\
On Unix based systems there's a ```sh $PATH``` which is a variable showing all the directories that the shell searches to find a command if you want to run it. If it's not there, you'll get a command not found error. \
All files that are meant to be ran need to be executable, so you need to give them the execute permission, by running:\
```sh chmod +x {filename}```, and then run it by giving the path to them. This is a security measure to anything not in your path so the system doesn't look for the executable in the entire file system, and so that you can't have arbitrary code execution.\
There are a bunch of built-in shell commands, such as:\
- ```sh cd```
- ```sh ls```
- ```sh pwd```
- ```sh echo```
- ```sh grep```
- ```sh sed```
- ```sh awk```

And some others you install, or that come with the system, such as:\
- ```sh man```
- ```sh curl```
- ```sh wget```
- ```sh make```
- ```sh git```
- ```sh python```
- ```sh nano```
- ```sh vim```

```sh man``` is an awesome command to view the manual pages for almost all shell commands, so much so there's a saying that goes 'the only command you need to know is man'. \
Another way to get documentation on how to use a command is to run it with `--help` which gives the usage options most of the time. \
We need a way to write code and edit text for this booklet, as you'll need to solve exercises and try out python to actually learn it.\
You could use the builtin text editor on MacOS called 'TextEdit' or IDLE which uses it, but that kinda sucks. \
A solution that works okay-ish but isn't amazing is using nano, but you need to get syntax highlighting on it by downloading a bunch of syntax files for it. Here's a way to do that, just copy and paste all of this into your terminal:

```sh
mkdir ~/.nano > /dev/null
cd ~/.nano
curl -0 -L https://github.com/scopatz/nanorc/archive/refs/heads/master.zip --output nano.zip
unzip nano.zip
rm -rf nano.zip
mv nanorc-master/*.nanorc .
rm -rf nanorc-master
echo 'include "~/.nano/*.nanorc"' > ~/.nanorc
cd $HOME
```

This makes the \~/.nano directory but doesn't complain if it exists already, goes into that directory, downloads the files as a zip, unzips them, deletes the zip file, copies all the .nanorc files (those are the syntax files) to the \~/.nano directory, then adds a line to the main nano config file (\~/.nanorc) saying to use all the syntax files, and then goes back to the home directory. \
Then to use nano you run 'nano' in the terminal.\
To edit an existing file or to make a new one you run 'nano {filename}', in our case a .py file as we are writing in python. \
To exit, use C-x (hold the control key\*, press x).\
\
\*For those of you thinking that you're really smart and know that on a mac the command key is the control key, unfortunately you're wrong, and in the terminal everything will be control, except for copy/paste which is still command-c command-v.
\
\
Using vim:\
I think that vim is a much better text editor for general editing and for code, and that while the initial experience is a lot less nice than nano, but worth the pain. Vim has a lot more features and commands in it, as it's a modal editor with a bunch of features, so you really need a guide to get started. To do this, run ```sh vimtutor``` in the terminal to get a guide. \
If this doesn't work, run vim, then press `:`, then type `Tutor`.\
It takes about half an hour at first, at which point you have a good starting point for vim.
Once you've done that you have a baseline, you can start using vim. \
I also suggest using their baseline init.vim or init.lua (for neovim, which is the modern version of vim, but you need to install it separately).


==== The REPL
Python comes with a REPL (Read Evaluate Print Loop), which you can run just by typing `python` (or `python3` on MacOS) which lets you quickly try out parts of the language. You can type in it like you were in a file, and it runs all the code right there letting you play around with the language a bit easier. 

=== Using a GUI editor like IDLE or Zed or VScode(ium) or PyCharm etc
There are many great editors that work, I happen to like Zed the most, but they all work, and with the python extension/plugin they all have linting and LSP and everything you may want out of the box. Just use their interfaces, save with File>Save As, Choose a filename, and then just save it as you go along, and run with the run button in them.



== Running your first line of code
Let's end this chapter by introducing you to your first function, the `print` tool which allows you to `print` text to the screen. \
```python
print("Hi!")
```
Copy this into your text editor (whichever it may be) and run it (either with a button or ```sh python3 hi.py```). Note the text has to be in either single (`'`) or double (`"`) quotes to work. You'll learn why later.

== Summary exercises
=== Ex1
#exercise(
    title: [Print a triangle],
    content: [Using just the print function you learned, print this to the screen:
   ```
   *
   **
   ***
   ****
   ```
]
)

= The Basics:\ Using python as a calculator <basics>
You may have heard of python used for data analysis, so let's first explore python through how it handles maths. For this it's easier to just use the interpreter shell.\
Let's have a brief look at python's operators. 

#table(
  columns: 4,
  table.header[*Operator*][*Name*][*Example*][*Output*],
  [+], [Addition], [2 + 9], [11],
  [-], [Subtraction], [2 - 9], [-7],
  [\*], [Multiplication], [2 \* 9], [18],
  [/], [Division], [2 / 9], [$0.22 overline(2)$],
  [/\/], [Integer division (returns floored quotient)], [2 /\/ 9], [0],
  [%], [Modulo (returns remainder of division)], [2 % 9], [2],
  [\*\*], [Exponent], [2 \*\* 9], [512],
)

But wait, there's more!\
As well as arithmetic operators, there are also logical and bitwise operators. Let's have a look at these as well.\
Logical operators:
#table(
  columns: 4,
  table.header[*Operator*][*Name*][*Example*][*Output*],
  [```python ==```], [Equality], [```python "" == []```], [```python False```],
  [```python >```], [Greater than], [```python 10 > 10```], [```python False```],
  [```python <```], [Less than], [```python 10 < 10```], [```python False```],
  [```python >=```], [Greater-than-or-equal-to], [```python 10 >= -1```], [```python True```],
  [```python <=```], [Less-than-or-equal-to], [```python 10 <= 10```], [```python True```],
)
Lastly I want to cover bitwise operators, which are a bit more confusing and aren't used very often, but can sometimes be useful like multiple return types from functions, where you want either to return the value or to return None or an error or something.

#table(
  columns: 2,
  table.header[*Operator*][*Name*],
  [&],[AND],
  [|],[OR],
  [\~],[NOT],
  [^],[XOR],
  [>>],[Right shift],
  [<<],[Left shift],
)
// TBA for most of this part.\
\ They work only on integers and they perform binary operations, which are beyond the scope of this guide, but if you're interested look them up! \
The only ones I'll explain here are the `<<` and `>>` bitwise shift operators, as they are part of the computer science course: \
What they do is take a binary number, like take 10 base 10 in binary: \
```
0000 1010 ; base 10 binary, let's perform a left shift
0001 0100 ; as you see we just shifted everything to the left, this is now 20 in base 10
```
In base ten, let's have a look how this would work so it's more familiar, so suppose you have the number 24, and we shift left, we get 240, in effect we multiplied by 10 - the base number. Now let's perform two left shifts: 240 becomes 2.4. This divided by 100. \
These shifts are really fast for shifts in computers, but can sometimes be slightly inaccurate as it works on integers and rounds off when dividing (performs _integer division_). In base 2 (binary), it ends up multiplying and dividing by 2 per shift. \


You may have seen some C++ before that uses these >> and << operators for printing to the screen. This doesn't happen in python, but for the curious readers this is how it looks:\
```cpp
#include <iostream>

int main() {
  std::cout << "hi!\n"
  return 0;
}
```

== Summary exercises
=== Ex1
#exercise(
    title: [Syntax check],
    content: [
        - *2.0*: Get the floored quotient and remainder from $frac(7, 3)$, and print them to the screen.
    ]
)

// == Expressions and statements
// TBA


= Variables
== What is a variable? 
A #gls("var") is a crucial part of programming in any language, and is a part of #gls("mem") for storing data in a program. \ \
In actuality, a #gls("var") is a symbolic identifier bound to a mutable reference that stores an #gls("obj") or value in #gls("mem"). \You can think of a #gls("var") as a named container for a type of data. Technically it functions as a named #gls("ptr") to a #gls("mem") location where data is stored, enabling indirect manipulation of the underlying value through the identifier.\ \

Let's break down what that means: \
A #gls("var") is just a name that references something - usually an #gls("obj") as python is an #gls("oop") language. This means that you use #glspl("cls") to make #glspl("obj") of certain data types, which can be both built in and custom.
It holds the #gls("mem") address which 'points' to the #gls("mem") where data is actually stored, hence the name #gls("ptr").\
Because of this, python doesn't actually have #glspl("var"), just a name that stores a memory address. This later helps explain some things such as how functions pass parameters, and data mutation.

There are also constants, which are in almost all respects the same as #glspl("var"), but they are #gls("imu") - which means that their value cannot change throughout the program.\
// This can be benefitial as the compiler knows the size of it at runtime, so they are #gls("mem") safe to use in the #gls("stack"), unlike #glspl("var"), which are usually stored in the #gls("heap").
// \ \
Therefore #glspl("var") and constants must be stored in *#gls("mem")* when the program is running.

// THIS LAST PART IS JUST FOR SOME LANGUAGES LIKE RUST

== Variable names

When choosing #gls("var") names there are a few rules you have to follow:\
+ #gls("var") names must not have spaces - so you couldn't have `my name` as a #gls("var"), you would have to have either `my_name` or `myName` or `MyName`
+ #gls("var") names must not use any reserved keywords - you *cannot* use them as a name. See below for a list.
+ #gls("var") names must not start with a number or an operator: so you can't have `3apples` as a #gls("var"), or `+count` as a #gls("var"), however you can have numbers in your #glspl("var") - so `more_than_3_apples` is ok, and you can start with an underscore - `_3apples` is ok. The last use is often used for #gls("var")s which aren't used in the program.
+ If you go with a naming style keep it consistent throughout.
+ This isn't exactly a rule but follow pep8 naming conventions: use `snake_case` for #gls("var")s and function names, use `PascalCase` for class names.
+ Try to use sensible names for #gls("var")s\ 
e.g for a student's name use #h(1em) `student_name` #h(1em) not #h(1em) `sn` #h(1em) or #h(1em) `a` #h(1em) . A good name is descriptive for what it is.\

A full list of keywords is shown here.
```
False           class           from            or
None            continue        global          pass
True            def             if              raise
and             del             import          return
as              elif            in              try
assert          else            is              while
async           except          lambda          with
await           finally         nonlocal        yield
break           for             not
```
Also, by the end of this booklet I would have covered every single one of these, and you would know how to use them all yourself, so won't have to come back and check this to see if you're allowed to use a variable name. 

\
#note(
  title: [Note: _Equality_ vs _Assignment_],
  content: [ In python the #h(1em) `=` #h(1em) is the assignment operator. It assigns the thing on the right of the `=` sign to the thing on the left. It's like telling the computer: "Make the thing on the right refer to the thing on the left". It is *not* equality, and they are *not* the same. When you say: ```python name = "Linus"``` the #gls("var") `name` is assigned to the string `Linus`. The #gls("var") and `Linus` are *not* the same. \
However to check for equality you can use the #h(1em) `==` #h(1em) operator. This again isn't the same as the `=` sign, but it checks for the equality. This is the equality operator, and it will give you either a `True` or a `False`. \
As shown, the #gls("var") name is always on the left, and the value assigned goes on the right.\
Therefore ```python age = 50``` works and ```python 50 = age``` doesn't.\
If you're wondering why this is and how it's weird, this is discussed much later in my functional section #link(<functional-chapter>)[(link here)] that explains an alternative paradigm. However what is shown above works in procedural/OOP/imperative languages, which is what most python is. ]
)

Now, since we assign #glspl("var"), for calculations we can use #glspl("var")instead of actual values. Here's an example:
```python
length = 13.6 

width = 5.7 # Define width and length and store them in variables

area = length * width # Calculates area by multiplying length by width, stores it in a variable but doesn't do anything with it

print(area) # Outputs 77.52
```
\
Using #glspl("var") instead of values is a good practice in coding, as it makes your values more reusable, and often can read like a comment even if it's just used once, for example like here:\
```python
if time >= 300:
    ...
# Bad, this we don't know what 300 is here!

SECONDS_IN_FIVE_MINUTES
if time >= SECONDS_IN_FIVE_MINUTES:
    ...
# Better, this now reads more like a comment and explains the code nicer.
```

#tip(
    title: [Assignment shorthand (augmented assignment)],
    content: [Not infrequently you'll want to update a value, and normally you would have to write it like this: 
```python 
    increment = 5
    value = value + increment

 ```
But there's a nicer way of writing this, which is by putting the operators together, like this:
```python
    increment = 5
    value += increment
 ```
Which is exactly the same as the previous, but it reads a bit nicer. This works for all operators, like so: 
```python
    a += 1
    b -= 1
    c *= 5
    d /= 5

    e &= 2
    f |= 10
    g ^= a
    h ~= e
    i <<= 1
    j >>= 1
 ```
This is an example of #gls("syn-sug")]
)

== Summary exercises
=== Ex1
#exercise(
  title: [3.1: Temperature conversion],
  content: [
    First copy this code into your python file:
    ```python
    celsius_temp = float(input("Please input your celsius temperature: "))

    # Put your conversion here, and store it in a variable called "fahr_temp"

    print("The corresponding Fahrenheit temperature is: " + fahr_temp)
    ```
    Then use the formula:   $F = (C times 9/5) + 32$ to convert the inputted Celsius temperature to Fahrenheit. \
    The way this program works is as follows:\
    1. A user types in a Celsius temperature
    2. Python stores this in the `celsius_temp` variable
    3. This is converted using the operations mentioned back in #link(<basics>)[Chapter 2] (you add this to your program)
    4. The corresponding Fahrenheit temperature is printed to the console

  ]
)

=== Ex2
#exercise(
    title: [3.2: Swap variables],
    content: [
        Start with two variables:\
        ```python a = 5b = 10```\
        Print them to the screen. \
        Then swap their values, so that a becomes 10 and b becomes 5.\
        There are three ways of doing this, if you've read a lot of python you may know the second, fancy way -- and you can also use the bitwise XOR (`^`) to do the swap.
    ]
)

=== Ex3
#exercise(
    title: [3.3: Speed camera],
    content: [ 
        Start with this code:\
        ```python
        km = float(input("Distance km: "))
        mins = float(input("Time minutes: "))
        ```
        Add to it to calculate the average speed and print it to the console.
    ],

)

= Basic data types

Every #gls("var") you make has to be of a certain type, and below are the basic data types for #glspl("var"). \
Actually when you make a #gls("var") you initialise an instance of an #gls("obj"), which is made from one of the in-built #glspl("cls") python has. These #glspl("obj") have certain properties, and functions. The functions are called `methods` and are what the #gls("obj") can do. For example for a string, you can convert it to all upper case by having ```python string.upper()```. The `.upper()` is the method, which is a function on an #gls("obj") that allows it to do something. 

== String (str)
A string is just a series of characters, in quotation marks, either double or single.\
=== Character (char)
Python doesn't have the `char` data type, but many languages, including OCR reference language, do - so you need to know about it. A character - as the name might imply, is just a single character. You can think of it as a string constrained to just a single element. 

=== Common methods for strings
- `.upper` converts to upper case
- `.lower` converts to lower case
- `.len`   returns the length of the string
- `.startswith(char)`   returns a boolean telling you whether it starts with the specified character
- `.endswith(char)`   returns a boolean telling you whether it ends with the specified character
- `.split(char)` splits your string into a list based on the given deliminator you passed in
- `.format` allows for injecting variables into lists (shown below)
- `.isdigit` returns True or False depending if only digits are in the string

=== String operations \
==== String formatting

Suppose you have some #glspl("var") you want to use in a string, for example in this situation:
```python
name = "John"
age = 50
greeting = "Hello person, you are age years old"
```
Here we want to personalise this greeting to John, so we need to inject the #glspl("var") `name` and `age` into the string. 
To achieve this we have four different options:\
- String concatenation
This is like sticking the #glspl("var") and the strings together. Here's how you would use it:\
```python
name = "John"
age = 50
greeting = "Hello " + name + ", you are " + str(age) + " years old"
```
This also works with a `,` instead of a `+`, with the benefit that it adds a space for you. It's okay to use sometimes but it is often hard to read and tedious to use.
- `.format` method
This uses the method (which is a function on an #gls("obj")) `.format` to use placeholders and put the #glspl("var") after the string. Here's how it's done using this method:\
```python
name = "John"
age = 50
greeting = "Hello {}, you are {} years old".format(name, age)
```
Here placeholders are used - in this case the `{}` are the placeholders, which you then specify the #glspl("var") to go into the placeholders. Note the order matters, if age was specified first at the end, you would get `Hello 50, you are John years old`\
- Alternative `.format` method
```python
name = "John"
age = 50
greeting = "Hello {name-str}, you are {age-str} years old".format(name-str = name, age-str = age)
```
This is extra explicit, and more readable. It also solves the order problem, as you are assigning names to the placeholders you give.\
- fstrings
Short for 'format strings', this is a newer python feature, only being available on python 3.6 and up. To use it, the #gls("var") is placed inside the curly braces like so:\
```python
name = "John"
age = 50
greeting = f"Hello {name}, you are {age} years old"
```
It is the most readable and probably best way of using string interpolation in python. It also has the advantage that you can put calculations in the curly braces, as anything inside them is treated like code. Try to use it when you can over the other methods.

- rstrings
Short for 'raw strings', this means anything you put in the string is taken as is, so you can print escape sequences.\
For example:\
```python
print(r"C:\Users\nathan")
```
This is an example for a use case, it's a file path in windows and uses `\` for paths, which means you can accidentally include escape sequences, like `\n`, and to avoid having them mess up your string you use a raw string (rstring) \

If you need a multi-line string you can use triple double or single quotes like this:
```python
multiline_string = """This string
has
multiple lines"""
```
or
```python
single_quote_multiline_string = '''
This string too,
has many lines
and it's formatted like this
'''
```
This is called a _docstring_.\
It may be wiser to either use double or single quotes for your strings, for example doing this might not work:\ 
\
```python string = 'This string will fail as it's not formatted properly'```
\
If we run it we get this:
#pagebreak()
```python
>>> string = 'This string will fail as it's not formatted properly'
  File "<stdin>", line 1
    string = 'This string will fail as it's not formatted properly'
                                          ^
SyntaxError: invalid syntax
```
This is because it uses the `'` in `it's` to close the string, even though that's not the intended end of string.\
The solution here is to use double quotes, instead of single quotes.

#tip(
  title: [Tip: Using escape characters],
  content: [In python, there is an escape character: the backslash `\` - which allows you to 'cancel' the next character. \
  This can be used if you have quotes in your string - for instance the string shown above: \
  ```python string = 'This string will fail as it's not formatted properly'```\ 
  can be fixed like this: \
  ```python string = 'This string won\'t fail as it\'s formatted properly'```\
  Here the `\` escapes the quote characters, fixing our strings.\

  There are some characters which you can't type in a string, such as new lines and tabs, so you use the escape character here. Here's a list of the ones you can use:\
-   `\'` for single quotes
-   `\"` for double quotes
-   `\n` for new lines
-   `\t` for tabs
-   `\v` for vertical tab
-   `\h` for horizontal tab
-   `\r` for carriage return
-   `\b` for backspace
-   `\a` for bell (alert)
]
)

#tip(
  title: [Auto concatenation for readability],
  content: [Strings placed next to each other are automatically concatenated, so this:\
```python awesome_string = "This is" " a really awesome string"```
Which is useful if you want to spread out your string across multiple lines to make it more readable, for example:\
```python print("There are two papers for computer science:\n\t1. Computer Systems \n\t2. Computational thinking, algorithms and programming")```
is a bit annoying to read so you probably want to split it up like so:
```python print("There are two papers for computer science:\n"
                "\t1. Computer Systems \n"
                "\t2. Computational thinking, algorithms and programming")```
But then at this point you may as well:\
```python
print(""""
There are two papers for computer science:
    1. Computer Systems
    2. Computational thinking, algorithms and programming
"""")
```

]
)

==== String slicing
As you'll see later, strings are a bit like lists (and in older languages like C, the string data type doesn't exist, you instead store them as arrays of characters), which means you can treat them like lists in some aspects.\
One of these aspects is string slicing, which is dividing it up to get a substring back. Here are a few examples:\
```python
my_string = "Lorem ipsum dolor set amet"
assert my_string[3:9] == 'em ips'
assert my_string[3:] == 'em ipsum dolor set amet'
assert my_string[:3] == 'Lor'
assert my_string[:-1] == 'Lorem ipsum dolor set ame'
```
If you hadn't guessed `assert` returns `True` or `False` after evaluating the statement. It's mostly used for testing (which I cover towards the end of this booklet), but here I just show the outcome with it.



== Integer (int)

An integer is a whole number - positive or negative. \
In many other languages there are signed and unsigned ints, where unsigned can't be negative.\
Python's ints are unconventional in the sense that they are dynamically allocated #gls("mem") - so having integer overflows can't happen. \
You could use your whole #gls("mem") to hold a single integer and you would be fine.

== Float (float)

A floating point number, or float, is a data type that can hold decimals. It's handled as a floating point, as it can move around in the number and the #gls("mem") usage is the same. Have a look:
```python
a = 1.2345
b = 12.345
c = 123.45
d = 1234.5
```
All of these numbers take up the same amount of #gls("mem"), but the decimal point 'floats' in the number.\

=== Floating point number arithmetic
Beware, sometimes floats misbehave - because of how the computer - which works in binary - handles them. Take a look at this example:
```python
>>> 0.1 + 0.2
0.30000000000000004
```
This is due to routing that occurs, a bit like how you can't store $1/3$ as a decimal properly in denary.

== Boolean (bool)
A boolean value can be `True` or `False`.
This is often returned as a value for use in control flow (see #underline[@control-flow])
They are handled as ints in python, and if you cast them as an int you get 0 and 1:
```python
>>> int(False)
0
>>> int(True)
1
```
This can sometimes be used for checking if a number of values are true.\

You can convert data types by 'casting' them. \
This involves wrapping the #gls("var") or value in the type:
```python
a = 10 # a is an integer here
a = str(a) # Here I cast it as a string
print(type(a)) # outputs "<class 'str'>"
```
You might have noticed the _#gls("cls")_ when printing the type of a #gls("var"). That is - as mentioned before - because a #gls("var") is bound to an #gls("obj") of its class. The class determines its type when printing the type of a #gls("var"). That is - as mentioned before - because a #gls("var") is bound to an #gls("obj") of it's class. The class determines its type.


== Summary exercises

=== Ex1
#exercise(
    title: [String indexing],
    content: [  - Print first, last, middle, reversed of ```python word = "python"```. \
As much as I would like to give some more fun or challenging exercises here I can't really as I haven't covered the syntax required for it yet. Stick with it and you'll get to the juicy stuff! ]
)

= Advanced data types

== Lists

A list is a #gls("mut"), ordered, indexable collection of data that can be heterogeneous.
Let's explore what that means:
Mutable means that it can change.\
Ordered means it has an order, and it won't change, unlike with sets.\
Indexable means that each value has an index, and you can view and change via indexing.\
Heterogeneous means it can hold mixed data types.

=== Common methods for lists:
- `.append()` adds anything you pass as an argument in the brackets onto the end of the list
- `.pop()` removes anything you pass as an argument in the brackets from the end of the list
- `.extend([])` adds a list onto the end like append, the advantage being you can add more values in one go

=== Indexing in action
Each value in the list has an index, and these are 0 based.\
So in the list `[1,2,3]` the indexing assigns index 1 at index 0, 2 at index 1, and 3 at index two.\
Negatives are also allowed, so index -1 is 3, index -2 is 2 and index -3 is 1. Here negative indexes start from the back of the list.\
\
To access an index, you use this syntax: `list[index]`

=== Slicing lists
You can also 'slice' a list, meaning you return a new list containing the new, specified elements with indexing.\
This works the same way it does with strings.\
```python
>>> list = [0,1,2,3,4] # Define an intial list
>>> list[1:3] # Slice said list
[1, 2]
```

Let's see how all this works in an example:
```python
list_one = [0,1,2,3] # Initialisation of a list
list_two = [0]*10 # shorthand for making a list of 10 0s, like this [0,0,0,0,0,0,0,0,0,0]
list_two[4] = 10 # Change the 4th element by index (so fifth if you count from one) to 10
list_one.append(4) # list_one is now [0,1,2,3,4]
list_one.pop(4) # Removes 4 from the list
```


== Arrays
Arrays are in almost all respects the same as lists, except for just some small differences as shown below\
- Homogeneous data types\
  Arrays must hold a single data type, unlike lists that can hold mixed data types
  - Requirement for explicit type specification\
    When you make an array in python, you have to explicitly specify the type
- Stored in contiguous memory\
  This means that they are much faster to read and write to
- Import required\
  You have to import them with `import array`, unlike lists which are in built

== Tuples
Tuples are much like lists, with they exception that they are #gls("imu").\
In all other respects they are the same, so they are indexable and can hold mixed data types (heterogeneous data types).

You declare a tuple with `()` as opposed to lists which use `[]`.

#warning(
  title: [Shorthand for tuple creation],
  content: [When making a tuple with the:\
```python
my_tuple = (0,)*10
``` 
shorthand, you always have to put the comma after the digit in the brackets, (as shown above) because otherwise it will be interpreted as normal brackets (which mean order of operation).]
)

Since tuples are immutable, you can't append, extend or add them, but you can slice them, which returns a new tuple back to you.\
\
The main advantages of tuples over lists is that you know that they won't change in your program, and they can be used if you need a hashable collection.


== Dictionaries

A dictionary is a set of _key-value_ pairs, is #gls("mut") and can hold heterogeneous data types.\
So for example here is a mapping of people and ages:\
```python
people_to_ages: {"Ethan": 56, "Adam": 44}
```
To look up the age of Ethan here, you can do so like this: \
```python
ethan_age = people_to_ages["Ethan"]
```
If you try to look up the key of someone that doesn't exist you'll get a `KeyError`.\
If you want to avoid this you can use the `.get` method like this:\
```python
billy_age = people_to_ages.get("Billy")
```
Which will return `None`. 
Alternatively for this you can specify a default return value like this:\
```python
billy_age = people_to_ages.get("Billy", -1)
```
This returns -1.\

Now suppose we want to add Billy to this dictionary. Here's how we add a new value:\
```python
people_to_ages["Billy"] = 7
```
Dictionaries can hold mixed key-value pair types, so we could add an integer to a boolean here like this:
```python
people_to_ages[69] = True
```
To delete a key-value pair you can use python's built in `del` operation like this:
```python
del people_to_ages["Adam"]
```
#note(
  title: [Note: Keys must be hashable],
  content: [When making a dictionary you can set anything as the value for anything, but you have to have the `key` be hashable.\
In python, any immutable type is hashable, so: ints, floats, strings, booleans and tuples are all hashable as they are immutable.\
You cannot use lists, sets or other dictionaries as keys.]
)

== Sets
Sets are #gls("mut"), unique, unordered, hashable collections of data that can hold mixed data types. \
This means that you cannot have multiple of an element, and the order is not preserved. 
To make a set you use curly braces like this:
```python
set = {1,2,3,4}
```
Note if you want to make an empty set you have to use the `set()` function as empty `{}` curly braces are interpreted as an empty dictionary. Here's how to do that:\
```python
empty_set = set()
```
You can also use the `set()` function to convert a list to a set like this:\
```python
set_from_list = set([0,1,2,3])
```
  === Common methods for sets\
  - `.add` adds an element to a set
  - `.remove` removes an element from a set
\
Just like dictionaries you can only add hashable data types to sets.\
You can't index a set as the elements are unordered, but instead you can use the `in` keyword for it like this:
```python
my_set = {1,2,3}
print(0 in my_set)  # Prints False
```
This is mostly what sets are used for, as checking if something is in a set is much faster than in a list.

#note(
  title: [Note: Type annotations],
  content: [Python is a *Dynamically typed* language, which means that when you create or use #glspl("var"), you don't have to explicitly state the type, like you might have to in some other languages, such as C, C++, Go or Rust. \
  For example, if you wanted an integer `a` with a value of 10, you wouldn't have to write ```python a: int = 10``` where you explicitly state the type, you would just be ok with ```python a = 10```, and the translator figures it out. But this `: int` type annotation can be really helpful in making your code more readable, obvious, and easier to debug, as often your editor will give you a hint that something's wrong more often if you use type annotations.\
  To use type annotations, you can add `: {type}`, with any type, including custom types in OOP, and functions, and `None` for no return.\
  To show a return type from a function (link to functions) you can use this: `-> {type}` \
  so for example:\
  ```python
  def simple_function() -> None:
      print("This function doesn't return anything")
  ```\
  Here you can also use the bitwise operators you learned way back in chapter 2 , to have multiple return types, or to have annotations for if you might return something, or return None. Here's how you might use them:\
  ```python
  def check_length(list: list) -> int | None:
      return list.len if list is not None else return
  ```
  This function returns the length of a list if the list exists, otherwise return None.
  ]

)
 #tip(
   title: [Tip: Data types used in advanced data types],
   content: [As well as storing basic data types in the above advanced data types, you can use them to store almost anything you want, (unless explicitly mentioned otherwise) so for example you have have a list of lists (which is called a matrix or a 2d list/array), or a dictionary of dictionaries, or a list of dictionaries, and so on. This can at times be very useful.]
 )

#note(
  title: [Mutability of data types],
  content: [Some data types like lists and dictionaries are mutable, and this makes sense, if you change the object (like appending a value to a list) it actually changes the value. However this isn't fully true with all data types. Here's a list of mutable and immutable objects:\
*Immutable*
- Strings
- Integers
- Floats
- Booleans
- Tuples

*Mutable*
- Lists
- Sets
- Dictionaries
What this means for you is that if you wanted to have a function that uses a list but doesn't change it, you need to create a slice of it, because, as we will see later, python holds the memory address of variables, not values, which means if you were to try to make a copy of a list, like so: \
```python list_copy = list``` \
they would point to the same address in memory. Really you would need to do either this: \
```python list_copy = list[:]``` \
or this: \
```python list_copy = list(list)```]
)

== Summary exercises
I don't really having anything decent yet for this, as we haven't covered control flow, which is the next chapter.

= Control flow and programming constructs <control-flow>


Control flow encompasses how the program runs - in which order and how the code is executed. There are three you need to know of:\
- Sequence
- Selection
- Iteration\

Let's talk about each one in detail:
== Sequence
This is when one piece of code gets executed in a linear fashion, one after another.
== Selection
This is when there is a 'choice' as such, where either one option is taken or another - like a fork in the road of which way your code could execute.

#note(
  title: [Note: Indentation matters!],
  content: [ Everywhere you see a `:` at the end of a line it will always be followed by an indented block in python. Python uses indentation over curly braces to define scope, so keeping neat indentation is crucial. Always use *4 spaces* for indentation (you can change your editor's tab key to be 4 spaces). ]
)\
#note(
  title: [Note: Truthy and Falsy values], 
  content: [All of python's standard data types have truthy and falsy values:
```python
int   -> 0
float -> 0.0
str   -> ''
list  -> []
tuple -> ()
dict  -> {}
set   -> set()
```
In all of these cases, they evaluate to false in a boolean context, which means that you can make if statements with just ```python
if variable:
    # Some code
    ```
  Any other value for these will evaluate to True]
)

=== Using `if`, `elif` and `else`

Here's how it works:

You use the `if` keyword followed by a condition that returns a boolean value or has a truthy value, and if it evaluates to True, then the code in the indented block runs.\

Let's see an example:
```python
if age > 18:
    print("You can (legally) drink ethanol")
```
You can also check for more than one condition using the `and` and `or` keywords.\
Let's see an example for this too:
```python
if age > 18 and country_of_residence != "USA":
    print("You can (legally) drink ethanol")
```
#warning(
  title: [Warning: using more than one condition],
  content: [Remember that when you have more than one condition like above, you have to specify the full condition. \ 
So for example if you have this code:
```python
if number < 100 and number > 0:
    # Some code
```
You have to still write out `number` the second time, python doesn't remember it.\
This code would *not* work:\
```python
if number < 100 and > 0:
    # Some code
```
However this would, as it's one expression:\
```python
if 0 < number < 100:
    # Some code
```
This is a python specific feature, very few other languages do this.
]
)
Now suppose you want to have something else run if the condition isn't met, in this case we use the `else` keyword like this:\
```python
if age > 18 and country_of_residence != "USA":
    print("You can (legally) drink ethanol")
else:
    print("You probably shouldn't drink ethanol")
```
You'll notice that the `else:` block doesn't take a condition, because it acts as a 'catch all' type of case, it's the default case. \
If you wanted to have something run if the initial condition was false, but not in the catch-all case you would use `elif` (short for else if), which allows you to pass another condition, like this:\
```python
if number < 100 and number > 0:
    print("Number less than 100 but greater than 0")
elif number > 100 and number < 200:
    print("First if evaluated to false, ran this if as number is greater than 100 and less than 200")
else:
    print("Number could be anything more than 200 or less than 0, this is the default case")
```
`elif` runs only if all of the statements above evaluated to false.

#tip(
  title: [Tip: Using else for error handling],
  content: [One way to handle errors to cover everything in `elif` blocks and leave `else` behind to catch anything you may have missed, rather than using it to catch wanted data. However don't over rely on this, as I later discuss when I talk about inversion to avoid nesting.]
)

Lastly for this if block, using `not` negates the boolean, so for example:\
```python
if age > 18 and not country_of_residence == "USA":
    print("You can (legally) drink ethanol")
else:
    print("You probably shouldn't drink ethanol")
```
This would do the same thing that the code previously did, but using `not`. \
This is a worse way of doing it in this case, and is less Pythonic, however in some cases it might be very useful. \
\
Just a quick tip, if you have an identity check (`if a is b`) you should negate it with `if a is not b` not `if not a is b`.\
Example:\
```python
if getkey(user) is not None:
    return
```

=== Using `match/case`

If you have a lot of conditions to check, like 5 or 10, it may be impractical to use a really long chain of if/elif/elif/elif, where a much nicer way to do that is to the `match/case` syntax, which is basically a switch block from other languages (including OCR). Here's how it looks:\

```python
def match_grade(score: int) -> str:
    match score:
        case 9:
            return 'A'
        case 8:
            return 'A'
        case 7:
            return 'A'
        case 6:
            return 'B'
        case 5:
            return 'B'
        case 4:
            return 'C'
        case _:
            return 'F'
```

You pass in the thing you're matching after the `match` keyword, and then you specify the cases after case.\
The `_` is the default case which is ran if nothing else matches.\
\
You can also use the bitwise operators here, cleaning the above code up a bit:\
```python
def match_grade(score: int) -> str:
    match score:
        case 9 | 8 | 7:
            return 'A'
        case 6 | 5:
            return 'B'
        case 4:
            return 'C'
        case _:
            return 'F'
```
(page over)
#pagebreak()
And you can also use the `if` keyword in a match statement, like so:\
```python
def match_grade(score: int) -> int:
    match score:
        case s if s >= 90:
            return 9
        case s if s >= 80:
            return 8
        case s if s >= 70:
            return 7
        case s if s >= 60:
            return 6
        case s if s >= 50:
            return 5
        case _:
            return 0
```
This looks a little strange, but translated this `s if s >= ?` really means 'match anything and bind it to s, but only if s is greater than or equal to ?'.\
You can't directly write ```python case >= ?``` because `match case` matches patterns, not arbitrary values.

== Iteration
This means looping, and repeating certain parts of your code, often with some mutation in each iteration.\
\
Python has two kinds of loops: `for` and `while` \*\
\* #text(size: 8pt)[*actually there's another which is a bit different called _recursion_, which I'll introduce properly later*]

Let's explore each of these:\

=== For loops
// iterables
For loops are made to iterate over an iterable.\
An iterable is anything that can give out its members one at a time.\
To iterate over an iterable we use this syntax:
```python
example_list = [1,2,3]
for v in example_list:
    print(v)
```
Here it prints the value.\
\
To instead iterate over a range of numbers - in effect creating a count controlled loop, you can use this:\
```python
for i in range(10):
    print(i)
```
This makes an iterable that ranges from 0 to 9.\
`range()` also takes optional arguments, so here it takes a start index as well:
```python
for i in range(3, 10):
    print(i)
```
This prints the values from 3 to 10 (not including 10).\
Then to include a step size you can use this:\
```python
for i in range(3, 10, 2):
    print(i)
```
This counts in twos, so the output from this program would be:\
```
3
5
7
9
```
A common use case for the range function would be to iterate over a list by index, like this:\
```python
example_list = [1,2,3]
for i in range(len(example_list)):
    print(example_list[i])
```
But python has a much better way of doing this, with the `enumerate` function:\
```python
example_list = [1,2,3]
for i,v in enumerate(example_list):
    print(f"Index: {i}, Value: {v}")
```

Another helpful function for loops is `zip()`:
```python
list_one = [1,2,3]
list_two = [4,5,6]
for v1, v2 in zip(list_one, list_two):
   print(f"v1: {v1}, v2: {v2}") 
```
Here we iterate over two lists at the same time, printing their values on each iteration. \
If your iterables aren't of the same length, the loop terminates when the shortest of the iterables has finished.

==== Comprehensions

This is a python specific feature (and also seen in functional languages) that allows you to express iteration over an iterable, making a new iterable in a much more concise manner. \
Here's how to use them, and a side-to-side comparison of using the standard syntax and a comprehension:\
Standard:\
```python
squares = []
for i in range(10):
    squares[i] = i*i
```
but using a comprehension:\
```python
squares = [i * i for i in range(10)]

```


=== While loops
This loop continues looping until the condition specified is True.
For example this loop continues forever:
```python
while True:
    print("Still true")
```
But this one will loop the user types `n`:
```python
running = True
while running:
    _input = input("Do you want to continue? [Y/n] ").lower()
    if _input == 'n':
        running = False
    else:
        print("Answer not 'n', continuing")
```
You can also evaluate statements that return a boolean in the `while` loop:
```python
lives = 5
health = 100
while lives > 0:
    print("Continue playing")
    if not health:
        lives -= 1
```
==== Keywords for `while` loops
There are two keywords you need to know for while loops: \ `break` and `continue`\
`break` breaks you from the loop, no matter the condition\
`continue` skips the rest of the loop below and continues onto the next iteration\

== Summary exercises

=== Ex1
#exercise(
    title: [Odd or even?],
    content: [Get an input from a user and print whether that number is even or odd. (Remember to use ```python int(input("enter int"))``` to make it an integer!)]
)

=== Ex2
#exercise(
    title: [Multiplication table],
    content: [Ask a user for a number and print the multiplication table for that number from 1 to 12]
)

=== Ex3
#exercise(
    title: [Countdown],
    content: [Create a countdown, where instead of the normal: \
    ```python for i in range(1, 11):
           print(i)``` you make it count in reverse. You might have to think a bit more for this one, and remember that there are multiple ways to loop. ]
)

=== Ex4
#exercise(
    title: [Prime checker],
    content: [Given a positive number print whether or not the number is prime.],
)

=== Ex5
#exercise(
    title: [Word counter],
    content: [Given an input, perhaps even multiple lines (although this is harder as input returns on \\n), count the number of words in the file. Remember that whitespace can be \\t, \\n, \\r, and ' '. ],
)

=== Ex6
#exercise(
    title: [Character replace],
    content: [Read in a string and then replace all whitespace with underscores (`_`) , and all vowels with asterisks (`*`)]
)

=== Ex7
#exercise(
    title: [Isogram checker],
    content: [An isogram is a word or phrase in which no letters repeat, for example 'uncopyrightable' and 'subdermatoglyphic' are isograms whereas 'eleven' isn't (the 'e' repeats). Write a program that takes an input and prints whether or not it is an isogram. ]
)


= In-built functions

Python has a number of handy, in built functions - which I will quickly go over. You have probably used some of these before.

- `print`
Function: Prints something to the console
Usage: Pass the thing you want to print in parentheses as an argument: ```python print("Hello")``` 

- `input`
Function: Take input from standard input and returns it, and can be used to put into a #gls("var"), but also as a parameter for another function.
Usage: ```python var = input()```. Here `var` was the #gls("var") but you can put anything. It can be passed as a parameter like this:
```python
>>> print(input("Please input something: "))
Please input something: 3456
3456
```
Here it was passed to `print`. 
\
Note that the input function takes input as a string unless you cast it otherwise.

Also you can put a string to be printed to standard output as a parameter to the input function in parentheses. 

- `len` 
Function: Returns the length of the thing that was passed into it\
Usage: ```python len(item)```

- `sum` 
Function: Returns the sum of an iterable\
Usage: ```python sum(iterable)```

- `abs`
Function: Return the absolute value given (always positive, think of this as distance from 0)

- `round`
Function: Rounds value passed to it to the degree of accuracy specified\
Usage: ```python round(1.23456, 2)  # Returns 1.23 ```

- `range()`, `enumerate` and `zip`
Covered in my control flow section.

- `max`/`min`
Function: Return the largest or smallest value of an iterable or a comma separated list given\
Usage: ```python 
max([1,4,2,5])  # Returns 5
min(0, 4, 8, 10)  # Returns 0
```

- `sorted`
Function: Take any iterable and return a sorted list\
Usage: ```python sorted({5, 2, 7, 8})  # Returns [2, 5, 7, 8] ```
Optionally it takes `reverse = True` to reverse the returned list.

- `all`/`any`
Function: Check if all or any (respectively) values are true/truthy. Returns a boolean.\
Usage: ```python any(False, '')  # -> False```

- `eval`
Function: Take a string and evaluate as a python expression.\
Usage: ```python eval("print(\"Hello reader!\")")  # Prints "Hello reader!"```

- `map`
Function: Takes in a function and applies it to every item in an iterable.
Usage: ```python map(function, iterable)```

- `filter`
Function: Filter an iterable based on the given function, then return a generator. Look this up for more details.

- `ord()` and `chr`
Function: Convert a character into a Unicode code, and a Unicode code number into a character.
Usage:  ```python ord('A')``` is 65, and ```python chr(65)``` is 'A'. This is helpful for doing some fancy string operations where you need the letters to be treated as numbers to be able to use number operations on them.


- `str(), int(), bool(), float(), set(), list(), dict(), tuple()`
Function: Convert the passed value to that type. This is known as casting.\
Usage: ```python int(my_var)```\
An example use case for this is to combine with `input` as the default case is always a string.\
```python integer = int(input("Please enter an integer: )) ```
\
Using this:\
```python my_var = int(my_var) ```
Which can be used to convert a type of a variable, is known as _shadowing_. This is the practice of making a variable with the name of an existing variable, masking the older variable with the new one.


- `help`
Function: Provide documentation for the thing passed to it\
Usage: ```python help(thing)```\
This is super useful for providing help.\
Here's something you should know however:\
```python
>>> help(str)
```
Try running this! You will get something that starts with:\
```
Help on class str in module builtins:

class str(object)
 |  str(object='') -> str
 |  str(bytes_or_buffer[, encoding[, errors]]) -> str
 |
 |  Create a new string object from the given object. If encoding or
 |  errors is specified, then the object must expose a data buffer
 |  that will be decoded using the given encoding and error handler.
 |  Otherwise, returns the result of object.__str__() (if defined)
 |  or repr(object).
 |  encoding defaults to sys.getdefaultencoding().
 |  errors defaults to 'strict'.
 |
 |  Methods defined here:
 |
 |  __add__(self, value, /)
 |      Return self+value.
 |
 |  __contains__(self, key, /)
 |      Return key in self.
 |
 |  __eq__(self, value, /)
 |      Return self==value.
 |
 |  __format__(self, format_spec, /)
 |      Return a formatted version of the string as described by format_spec.
```
This makes more sense after I cover Object Oriented programming in python in a later chapter, but you'll notice the class, and how a bunch of dunder methods are defined here, some which you may have used, such as `__format__` used as `.format`.

== Summary exercises

=== Ex1
#exercise(
    title: [Word counter (again)],
    content: [Revisit the word counter program we had in the last chapter. Try to make it more efficient by using the `ord()`, `chr()` and `sum()` functions.]
)

=== Ex2
#exercise(
    title: [Using `chr()` and `ord()` more, Caesar cipher encryption],
    content: [You may have heard of this method of very old and ineffective encryption known as the Caesar cipher, where each letter is shifted a certain amount in the alphabet forward/backward, and anything too far wraps. For example `zig` shifted forward by 2 becomes `bki`, or \
    `Python is interpreted!` \
    shifted by 13 becomes: \
    `Clguba vf vagrecergrq!` \
    Notice how the `!` is unaffected. ]
)

= Functions and modular code

As seen in the previous chapter, python has in built functions, but we can also create our own.\
A function is a self-contained block of code that do a specific task. It returns a value.

Functions in python can take any number of input parameters, and return any number of values.\

== Defining functions

You define a function with the `def` keyword, like this:\
```python
def my_function():
    print("I'm in a function!")
```
By default if there is no `return` statement at the end of a function it implicitly returns the `None` type, if you want to be extra explicit you can use `return` with no arguments or `return None`.\
\
As we've seen before, python expects indented code after the `:`, and if you want to keep your function, you can use the `pass` keyword to have no other code there, like this:\
```python
def todo_function():
    pass
```\
But this isn't a great idea as if you call `todo_function` here, you won't get anything, so the error passes silently. A better alternative is:\
```python
def todo_function():
    raise NotImplementedError("here i explain why i didn't implement this yet, or what needs to be done")
```
This means the program raises this error and crashes if you try to call this function. 

== Scope

All languages have this as an concept, and it tells you where a variable or object is valid for, and can be used. Previously we've defined all our objects and variables and code in something known as `global` scope, meaning it is valid everywhere in the script. When you define a function you create a `local` scope, meaning something that you create in the function doesn't exist outside the function as you destroy the scope and any objects when the function returns. \
Local scope takes precedence over global, or nonlocal scope. Now let's demonstrate all this: \
```python
x = 21
def func():
    print(x)
```
This will print 21.\
```python
x = 21
def func():
    print(x)
    x = 0
    print(x)
```
This is invalid and will fail as python thinks you are trying to change a global variable. Here: \
```python
x = 21
def func():
    global x
    print(x)
    x = 0
    print(x)

print(x)
```
This will print 21, 0, 0 as you modified the global variable by using the ```python global``` keyword. \
Now let's look at local variables: \
```python
x = 21
def func():
    x = 0
    print(x)
print(x)
```
This will print 0, 21 as you made a local variable with the same name as a global variable, but didn't change the global variable. \
But what if you have nested functions? This is known as `external scope` and you need to use the `nonlocal` keyword to access variables that are external to the scope but not global. Otherwise this works the same way that global does: \
```python
def func():
    x = 21
    def inner_func():
        nonlocal x
        print(x)
```
\
This doesn't work the same way with mutable objects, which behave a bit different as python's variables all hold memory addresses not values. You'll see how this works shortly.


== Arguments and parameters
To avoid this annoying scope idea, we use parameters in our functions, and then when we call them we supply arguments. A parameter is like a placeholder variable that you use in the function, which isn't actually real until you call it with an argument. The argument is the real value that you give to the function, that replaces the parameter with a value. \
When you define a function, you write in these placeholder parameters like so, and place them in parentheses like this. 
```python
def greeting(name):
    print(f"Hello, {name}")
```
Then later in your code you need to call this function like so:\
```python greeting(John)```\
Here `John` was passed in as the name, and the function is called with parameter John taking the place of the argument `name`. \

#note(
  title: [Note: _Argument_ vs _Parameter_],
  content: [A parameter is like a placeholder you put in your function when you define it.\ 
An argument is the actual value you give the function when you call it.]
)

=== Default values
If you want a value to be optional to a function, you can specify a default value, like so: \
```python
def greeting(name = 'John'):
    print(f"Hello, {name}")
```
This way if we just call `greeting()` we'll get "Hello, John" printed to the screen. Obviously this is kinda weird and doesn't make sense, but it does have its use cases, like for when you are designing a function that has extra functionality, so you can pass in `None` as a default value if it's not given.

=== Unpacking values and `*args` and `**kwargs`
Suppose you wanted to pass a list as values to a function:
```python
def print_items(a, b, c, d):
    print(a)
    print(b)
    print(c)
    print(d)

list = [1, 2, 3, 4]
print_items(list[0], list[1], list[2], list[3])
```

We can also do this with star unpacking like this: \
```python print_items(*list)```\
We can denote any number of normal arguments to a function like this in the declaration: \
```python def print_items(*args)``` \
Where `args` becomes a tuple of arguments. \
We can place any 'normal' arguments before the `*args` like so:\
```python def print_items(p1, *args)```\

==== Keyword arguments
You can pass in arguments by name rather than position like so: \

```python print_items(1, 2, 3, p2 = 4)``` \
So long as the function has p2 in the declaration like so:\
```python def print_items(p1, *args, p2 = 4)```\

#note(
    title: [Argument order],
    content: [Keyword arguments must come after any positional arguments, so this wouldn't work: \
```python def print_items(p2 = 4, p1, *args)```]
)

You can unpack a dictionary into keyword arguments with the double star notation like this: \
```python
def print_a_b(a, b):
    print(f"a: {a}")
    print(f"b: {b}")

d = { "b" : 1, "a" : 0}
print_a_b(**d)
```
Which means the function call gets unpacked into: \
```python print_a_b(a = 0, b = 1) ```

You can also do the reverse of this by specifying that you need keyword arguments in the function declaration like this: \
```python def print_items(**kwargs)``` \
Which gives you a dictionary of items mapping the keyword to the argument, so you can access the values by the key.




== Returning values
When you want to give back anything you did inside the function, you use the `return` keyword like this and it gives you a value when you call the function, like this: \

```python
def add(a, b):
    sum = a + b
    return sum
```
We could have also written the return statement like this: \ ```python return a + b```\
To return multiple values, separate them with a comma like this:\
```python
def divide(dividend, divisor):
    result = base // divisor
    remainder = base % divisor
    return result, remainder
```
Under the hood python actually returns a tuple of these values, like this: ```python return (return, remainder)```
// The return statement doesn't have to have the same names as the variables it's returning.\
\
Then when you call the function, you can either store the returned values in variables like this:\
```python
result, remainder = divide(65, 7)
```
Here, we unpacked the tuple.\
Note that the variable names don't have to be the same as the return names.\
\
You can also pass the returned values to a function like this:\
```python
print("The result of the division was: ", divide(65, 7)
```
This returns a tuple with the two values. If you wanted them separately, you would have to pass them into variables to unpack the tuple, as shown previously.\

Another example of passing the returned value to a function:\
```python
print(f"6 + 7 is: {add(6, 7)}, and that's the total!")
```
#note(
  title: [Note: Python uses _Pass by Object Reference_],
  content: [What this means is that if the object you give the function is mutable, any change you make to said object in the function is reflected outside the function as well. This is because they actually point to the same object in memory. ]
)


// // change set to list
// #exercise(
//   title: [],
//   content: [
//     If you are struggling with the last exercise, here's a boilerplate to get you started:\
//     ```python
//
// def get_names() -> tuple:
// # Two input functions and a single return statement
//
//
// def get_marks() -> list:
//     scores = []
//
//     # Use Both kinds of loops here, one to collect scores, one to catch errors
//     return scores
//
//
// def avg_scores(scores) -> float:
//     # Super hard maths here
//     return marks
//
//
// def teacher_comment(student_name, teacher_name, marks) -> None:
//     if marks >= 8:
//         print( f"Well done, {student_name}, "
//           "{teacher_name} is very pleased with your effort")
//
//     elif marks # your stuff here
//     else:
//         raise ValueError("Marks not in range")
//
//
// def main():
//     student_name, teacher_name = get_names()
//     marks = avg_scores(get_marks)
//     teacher_comment(student_name, teacher_name, marks)
//
//
// if __name__ == "__main__":
//     main()
//     ```
//
//   ]
// )


// )
== Yield statements
Instead of a return statement, you can also have `yield` statements in a function, which turns your function into a generator, which returns a generator object. A generator is like an iterable, which is something able to give out its elements one at a time, lazily evaluated. It's kind of like a list, and this way you can have some features of lazy evaluation such as infinite lists, as they are only evaluated when they are needed. \
\
Yield saves the state of the function after every yield, giving out its values over time, not evaluating everything at once like with `return`.\
\
You iterate over it either with a `for` loop like with a list, or with the `next()` function. \
\
Under the hood yield implements the iterator protocol, but the way this works is beyond the scope of this booklet. \
\
Let's look at an example to better understand how this works: \
```python
def count_to_n(n: int):
    for i in range(n):
        yield i

# Using the generator
gen = count_to_n(5)  # Creates a generator object
print(next(gen))  # Output: 0
print(next(gen))  # Output: 1
print(next(gen))  # Output: 2

# Or iterate with a for loop
for num in count_to_n(5):
    print(num)  # Output: 0, 1, 2, 3, 4
```
While this is quite artificial you get the point of how the syntax works: \
- You first get an object (a generator object) when you call the function, and then you perform operations with this generator. \

=== Using send to make the generator receive values as well
Using `send()` you can also get values from the generator caller like so: \
```python
def counter():
    count = 0
    while True:
        received = yield count
        if received is not None:
            count = received  # Update count with sent value
        else:
            count += 1

gen = counter()
print(next(gen))  # Output: 0 (starts the generator)
print(gen.send(10))  # Output: 10 (sends 10, yields 10)
print(next(gen))  # Output: 11 (increments from 10)
```
=== Using a comprehension like syntax for concise generators
You can also get a simple generator without having to define a function like so: \
```python
gen = (x**2 for x in range(5))
print(list(gen))  # Output: [0, 1, 4, 9, 16]
```
The syntax is the same as for comprehensions just using parentheses as opposed to square brackets.

== Function wrappers and decorators
Wait, what's a function wrapper?\
    A function wrapper is function that adds or or modifies the functionality (behaviour) or another function without modifying the code of the original function.
\
You might use a wrapper if your function had a prerequisite that needs to be fulfilled for the function to work, or if there's some block of code you find repeated in multiple functions. \
Here's a primitive example to illustrate how they work, first here's the non-wrapper example: \
```python
def sign_in():
    username = input("Enter username: ")
    password = input("Enter password: ")
    print(f"[SIGN IN] Attempting to sign in user: {username}")
    if username == "admin" and password == "secret":
        print("Sign in successful!")
    else:
        print("Invalid credentials.")


def sign_up():
    username = input("Enter username: ")
    # password = input("Enter password: ")
    print(f"[SIGN UP] Creating account for user: {username}")
    print("Account created successfully!")
```
And now here's the same logic using a function wrapper:

```python
def require_credentials(func):
    def wrapper(*args, **kwargs):
        username = input("Enter username: ")
        password = input("Enter password: ")
        # Call the original function with username and password
        return func(username, password, *args, **kwargs)

    return wrapper


def sign_in(username, password):
    print(f"[SIGN IN] Attempting to sign in user: {username}")
    if username == "admin" and password == "secret":
        print("Sign in successful!")
    else:
        print("Invalid credentials.")


def sign_up(username, password):
    # Example sign up logic
    print(f"[SIGN UP] Creating account for user: {username}")
    print("Account created successfully!")


if __name__ == "__main__":
    while True:
        choice = input("Do you want to (1) sign in or (2) sign up? (q to quit): ")
        if choice == "1":
            wrapped_func = require_credentials(sign_in)
            wrapped_func()
        elif choice == "2":
            wrapped_func = require_credentials(sign_up)
            wrapped_func()
        elif choice.lower() == "q":
            break
        else:
            print("Invalid choice, try again.")
```

And looking at this it's kinda tedious because every time you want to use the functions sign_in or sign_up you have to call the wrapper, and use the returned wrapped function. Luckily we don't actually have to code like this because we have decorators: which are #gls("syn-sug") for function wrappers which make it way nicer to use them. Here's the same example using decorators: \

```python
def require_credentials(func):
    def wrapper(*args, **kwargs):
        username = input("Enter username: ")
        password = input("Enter password: ")
        # Call the original function with username and password
        return func(username, password, *args, **kwargs)
    return wrapper

@require_credentials
def sign_in(username, password):
    # Example sign in logic
    print(f"[SIGN IN] Attempting to sign in user: {username}")
    # Here you'd check against stored credentials, etc.
    if username == "admin" and password == "secret":
        print("Sign in successful!")
    else:
        print("Invalid credentials.")

@require_credentials
def sign_up(username, password):
    print(f"[SIGN UP] Creating account for user: {username}")
    print("Account created successfully!")

# Example usage
if __name__ == "__main__":
    while True:
        choice = input("Do you want to (1) sign in or (2) sign up? (q to quit): ")
        if choice == "1":
            sign_in()
        elif choice == "2":
            sign_up()
        elif choice.lower() == "q":
            break
        else:
            print("Invalid choice, try again.")
```
This `@func` syntax does the same as the above, just in a much neater way. You'll see decorators elsewhere in python, for example static methods or dataclasses, but now you can use your own!

== Recursion (part one)
Recursion is when you have a function that calls itself - which in effect creates a loop. It comes mostly from the functional programming paradigm, and isn't often seen in what we've seen so far, the procedural, imperative and maybe OOP style of code.\
Here's an example (although this is still the procedural paradigm):\
Suppose you have a problem where you need a user to enter a number between 1 and 20, and get them to keep entering a number until it is in the valid range. \
You could do it like this:\
```python
def enter_number() -> int:
    print("Please enter a number between 1 and 20")
    while True:
        number = int(input())
        if 1 <= number <= 20:
            print("Number in range, continue")
            return number
        else:
            print("Please enter a valid number between 1 and 20")
```
Firstly note that the `break` is implied here, since you have the return statement.\
While this is a perfectly valid way of achieving this, we can leverage functions calling themselves - which is called recursion. Here's the same code but using recursion:\
```python
def enter_number() -> int:
    number = int(input("Please enter a number between 1 and 20: "))
    if 1 <= number <= 20:
        print("Number in range, continue")
        return number
    else:
        print("Number invalid")
        return enter_number()
```

Recursion is less safe to use over traditional loops, because every new function you call, you don't terminate the previous function, you just put a new one on the call stack. This could potentially cause a stack overflow.\
Recursion is very much linked to the functional paradigm, and it doesn't make much sense to go further in it here, so I go over it in much more detail in my Functional Programming in Python chapter. #link(<functional-chapter>)[(link here)]

== Summary exercises

=== Ex1
#exercise(
    title: [Returning values (syntax check)],
    content: [Write a really simple function: ```python doubleit(x: int) -> int``` that literally just returns the doubled number. This is so you can play around with understanding what names have the be the same, and how return values work.]
)

=== Ex2
#exercise(
  title: [Returning values: grade checker],
  content: [
      Now for the juicy functions that you have the basic syntax down.
    Create a program that will do the following:\
    + Collect a student's name
    + Collect the student's computer science teacher's name
    + Collect marks for the last three homework assignments
    + Calculate the average out of them (but not print it)
    + Print a corresponding message depending on what the mark was: \
      If the mark was $>= 8$, print this:\
      ```python
      f"Well done, {student_name}, {teacher_name} is very pleased with your effort"
      ```
      If $6 < "mark" <= 8$ print this:\
      ```python
      f"A good effort, {student_name}."
      " However {teacher_name} thinks you should check your work more carefully."
      ```
      Lastly if the mark was $<= 5$, print this:\
      ```python
      f"{student_name} this is poor. "
      "{teacher_name} has asked you to try harder."
      ```
  ]
)

#tip(
  title: [Tip: Importing functions],
  content: [For basic things (like means) there's often an existing function for it in python, either in-built or you can import it. \
For this case, there's a `mean` function, but you have to import it with \ ```python from statistics import mean```\ at the top of your document, which you can use for the above exercise.]

)

// #exercise(
//   title: [], 
//   content:[
//     For the last section, you can use either the `if/elif` chain, a `match/case` block or a dictionary with tuples, and tuple unpacking in a `for` loop to give the grade value.\
// \
// However, for the earlier parts you must write in a very particular way:\
// For collecting the student and teacher names, use a single function returning two values (the names).\
// For getting the three grades, you must do the following:\
// - Define a function that has an empty list
// - Take the input as a string
// - Validate that it is an integer
// - Validate that it is in range (0 to 9)
// - If both of these checks succeeded add it to the list
// - Return this list
//
// To calculate the average use another function that uses previous in-built functions, or code your own function to return the mean of the three numbers in the list.
//
// Lastly for the `teacher_comment` function, use selection or a dictionary to print the message, but make sure that you pass the names and the average of the grades as parameters for the function.
//
// Then you must call all you functions in a `main()` function, and you can choose to either take these returned values as variables and then pass them or nest all your functions. 
//
// Your main function must not take any parameters and must not return any values.\
// Lastly call your main function with this code block:\
// ```python
// if __name__ == "__main__":
//     main()
// ```
//
//   ]
// )

=== Ex4
#exercise(
    title: [Collatz sequence],
    content: [Write the Collatz conjecture sequence as a function in python. If you don't know what that is (firstly watch the Veritasium video on it), here's how it works:\
    - You take a number (any number)
    - If it's even you divide it by two
    - If it's odd you multiply it by 3 and add 1 \
    So far what all tested numbers, though not proven, will end up at 1, which is in a loop: 
    $ 1 times 3 = 4 \
    4 / 2 = 2 \
    2 / 2 = 1 $
    Make a function that given any number will follow the chain and then return the number of steps it took to get to 1.
]
)

=== Ex5
#exercise(
    title: [Digit sum],
    content: [Given any integer, sum its digits. So 69420 will be $6 + 9 + 4 + 2 + 0$ which is 21. \
This is trivial, but there's a fancy way of doing it so it's a one-liner. If you can do that try for a root sum, where you keep summing until there's only one digit, so $6 + 9 + 4 + 2 + 0 = 21$ and $2 + 1 = 3$],
)

=== Ex6
#exercise(
    title: [Collatz sequence (with yield)],
    content: [Take the previous collatz function that you wrote and turn it into a generator that yields until 1.]
)

=== Ex7
#exercise(
    title: [Fibonacci generator],
    content: [Write a generator function with yield that produces and infinite Fibonacci sequence.]
)

= Better code structure
Up until here, I've just given you a bunch of tools and how to use them, but not suggested when to use them. \
Here's just some basic advice on how you should be writing your code:\

- Use functions for almost everything\
This is good practice - use functions for everything that happens, each function should ideally be no more than $approx 60$ lines long for readability. If you are feeling the need to go over that you should break it up into smaller functions. pep8, the official python style guide, states that you shouldn't have cyclomatic complexity greater than 15 in your functions.

- Always use type hinting\
This makes your code more readable, clear, and your editor can help you debug it easier. Always use them.

- Try to follow pep8
This is the styling and writing guide for python. Read through it and try to stick to it.

- Setting up your file structure:\
Here's generally how I set my file structure up, and it makes more sense why later:\
```python
# Your imports/dependencies

# Your functions

def main() -> None:
    # Call your functions here

if __name__ == "__main__":
    main()
```

Basically have a main function that you call in the if block at the end.

This is a `dunder` method that checks you are running the file directly, not importing it as a package/module. Again explained fully in the other files chapter.\ \

In a large number of cases you won't actually want a `main` function you call, but often something else you want to call to start execution, for example the init from a class.

== Never nesting
Kind of a misnomer here, but basically the idea is that you don't nest your code more than 3 times — i.e your indents aren't more than 3.\
This is generally a neater way to read and write code, and you have two tools at your disposal to de-nest your code:\
- Extraction\
This is when you take part of your function/method/class and make it its own thing, and in your main code you call the function/method.\
- Inversion\
This is where you make the 'unhappy' part of your code first into the ifs, and then leave the happy to the else block. This means you can actually omit else and let it run as the default case. Here's a nonexample example:\
This is the first type of code:\
```python
def func():
    if condition_a:
        print("Check passed")
        if condition_b:
            print("Check two passed")
        else:
            print("Condition b failed")
    else:
        print("Condition a failed")
```
#pagebreak()
And here's an inverted logic, removing the unnecessary else statements:\
```python
def func():
    if not condition_a:
        print("Condition a failed")
        break  # Alternativly exit()
    print("Check passed")
    if not condition_b:
        print("Condition b failed")
        break
    print("Check two passed")
```

Often this is done in a loop, where if the check fails you want to skip the happy part of the code and run the checks again. Here use `continue` to achieve this.
```python
def func():
    while True:
        if not condition_a:
            print("Condition a failed")
            continue
        print("Check passed")
        if not condition_b:
            print("Condition b failed")
            continue
        print("Check two passed")
        break  # Since both checks passed we break out of the loop
```

And if you want a count controlled loop to 'redo' this iteration, use a while loop again, with a manual counter, like this:\
```python
def func():
    i = 0
    while i < 5:
        if not condition_a:
            print("Condition a failed")
            continue
        print("Check passed")
        if not condition_b:
            print("Condition b failed")
            continue
        print("Both checks passed")
        i += 1
```

== Summary exercises

#note(
    title: [Unfinished],
    content: [I still have yet to add the exercises here, at some point I will update this.]
)

= Error handling
In python, there are two kinds of errors:\
- Syntax errors:\
  _Syntax_ is the rules of a language, so a syntax error simply means you didn't write the code correctly - in the sense that you violated rules that python has to follow.\
  A common syntax error is a misspelled keyword, such as writing `Print` instead of `print`, or missing a close bracket.\  
  In this case Cpython (the interpreter) will point to you where the error was caught in compiling. 
  #note(
    title: [Note: How is python translated?],
    content: [So far I've told you that python is interpreted, which is true - you don't compile python directly to machine code.\
  However, python is actually compiled to _bytecode_ which is then executed by the python virtual machine. ]
  )
- Exceptions:\
  As the python documentation puts it:\
  #quote(attribution: [ #link("https://docs.python.org/3/tutorial/errors.html")[Python Docs] ])[
    "Even if a statement or expression is syntactically correct, it may cause an error when an attempt is made to execute it. Errors detected during execution are called exceptions and are not unconditionally fatal: you will soon learn how to handle them in Python programs."
  ]

== Catching exceptions
By default if an exception is _raised_, the program will crash. To avoid this we run them in a `try/except` clause. To catch an error, you need to know what might fail. 
  There are many different types of exceptions, for example: ZeroDivisionError, ValueError, FileNotFoundError, NameError, TypeError and so on.
  Here's how to catch them with the `try/except` clause:
```python
def divide(dividend, divisor):
    try:
        result = dividend // divisor
        remainder = dividend % divisor
        return result, remainder
    except ZeroDivisionError:
        print("Cannot divide by zero")
```
#warning(
  title:[Warning: Do NOT use bare try/except clauses],
  content:[Suppose you didn't know that the division by zero error was called `ZeroDivisionError`, and you tried to write this instead:
```python
def divide(dividend, divisor):
    try:
        result = dividend // divisor
        remainder = dividend % divisor
        return result, remainder
    except:
        print("Cannot divide by zero")
```
While technically this does work, it has a huge problem:
It catches everything indiscriminately, which includes bugs and something like a user pressing control-c to terminate the program.\
If you still wanted a catch-all solution, you could use this:\
```python
def divide(dividend, divisor):
    try:
        result = dividend // divisor
        remainder = dividend % divisor
        return result, remainder
    except Exception:
        print("Error occured")
```
And if you wanted to also catch what caused it use this:\
```python
def divide(dividend, divisor):
    try:
        result = dividend // divisor
        remainder = dividend % divisor
        return result, remainder
    except Exception as err:
        print(f"Error occured: {err}")
```
]
)

Then you might want some cleanup in the try/except clause, where you have code to run no matter what error occurred - in actual examples of real code, this is often things like closing off connections to databases and closing files.\
To do this use the `finally` keyword at the end of your clause like this:\
```python
try:
      # Some code
try: 
      # Some more code you just want to try
except Exception:
      # As many exceptions as you want to try to catch, you 
      # can have as many of these blocks as you want
finally:
      # A single finally block here
```
\
== Raising exceptions
However sometimes you also want to deliberately cause an error to crash the program, and then either catch this or let it terminate the code. \
For this you use ```python raise``` keyword, like this:\
```python
def check_age(age:int):
    if age < 0:
        raise ValueError("Age can't be negative!")
```
\
If you now call this function with a negative value you get this:
```python
Traceback (most recent call last):
  File "/home/user/raise.py", line 5, in <module>
    check_age(-1)
    ~~~~~~~~~^^^^
  File "/home/user/raise.py", line 3, in check_age
    raise ValueError("Age can't be negative!")
ValueError: Age can't be negative!
```
This is usually the way to write functions that _can_ fail, and then call them in a try/except block, like this:

```python
def main():
    try:
        check_age(-1)
    except ValueError as err:
        print(err)
```

\
Which just outputs:\
``` Age can't be negative!```

== Custom errors
At some point you may want to write your own errors to be raised and caught. For this you need to define a custom error #gls("cls"), which is part of the object oriented part of python, but that's covered in chapter 13 #link(<oop-ch>)[(link here)]. For now, just try to follow along: \
```python
class MyCustomError(Exception):
    def __init__(self, message: str) -> None:
        super().__init__(message)
        self.message = message
```
Here we made a custom class that makes an error object inheriting from the `Exception` class. \
This now introduces the `MyCustomError` as a valid error that can be raised. You can supply a message to it as well, which will allow you to catch and do something with it. \
You can also create instances of this class by assigning it to variables like this: \
```python simple_message = MyCustomError("hi, you've raised an exception")```
And then raising the error like this: \
```python
try:
    raise simple_message
except simple_message as e:
    print(e)
```



== Summary exercises

=== Ex1
#exercise(
    title: [Handle erroneous input],
    content: [Previously we've handled input with ```python x = int(input('int please'))```, which has a problem:
if a user inputs something other than an integer, the program crashes. This time, wrap the input in a try/except block to catch the input, and inside a loop to keep prompting the user for input until they enter a valid input. ]
)

#note(
    title: [Unfinished],
    content: [I still have yet to add the exercises here, at some point I will update this.]
)

= Using external files

In this chapter we will cover:
- Setting up a python project structure
- Using extra modules and libraries, both from standard and non standard libraries

== Splitting your project across several files

In real python projects, you might have a directory structure that looks like this:
```
python_project
├── README.md
├── __init__.py
├── __main__.py
├── control
│   └── LICENCE
├── pyproject.toml
├── requirements.txt
└── my_library
    ├── package_one
    │   ├── module1.py
    │   └── module2.py
    └── package_two
        ├── module1.py
        └── module2.py
        
```
Let's talk about what each of these files are:
- `__init__.py`
This just tells python that this is a package, enabling importing of its modules
- `__main__.py`
This is the main entry point of execution of your program, and has a main function, which has the:\
```python
if __name__ == "__main__":
    main()
```
code block.\
\
To import a package from your library (in the `__main__.py` file), you use this at the top of it:\
```python from my_library import package one```\
Then to run a function from the module from the package you would run:\
```python package_one.module1.my_func()```
If you want the whole library you just run:\
```python import my_library```\
or if you just want a single function from a module you can use this:\
```python from my_library.package_one.module1 import my_func```\
Where you can just call the function as normal (as if it were defined in that file). \
\
To go back to the dunder `__name__` variable, it's set by the interpreter depending on how the file was run. If you run a file directly (no matter the name of the file), you will get `__main__` back, however if you run it by importing it from another file (as a module or a package), you will get where it was imported from (the file path).
- `requirements.txt`
Often you'll go beyond the standard libraries, so you will need to install some requirements for the project to work. You place them here so that people can automate installing them.\
- `package_one`
A package is a directory which is a collection of modules which all relate to the same thing.\
- `package_one/module1.py`
A module is a single file.

== Installing dependencies and using non-standard libraries

When you want to go beyond the standard libraries (like datetime, random etc), you will first need to install them.\
The way you would do that is with a package manager - `pip`, which stands for `preferred installer program` and it allows you to install python libraries and packages. It came when you installed python so you don't need to additionally install it to use it.\
\
=== Python virtual environments

When you have a project you are working on it's best not to install your dependency packages globally as they may break you system packages, and/or conflict with other projects. The best way to avoid all of this is via virtual environments:\
A virtual environment is like a sandboxed directory with its own python installation.\
You should install all your python packages there. \
Here's how to use virtual environments:\
First make sure your source code is all in a single directory with nothing else in it. \
Then run this in the project directory:\
```sh python -m venv env```\
This makes a directory called `env` that houses your environment. To activate it run this:\
```sh source env/bin/activate```\
Now you are ready to install packages with pip. Installing them with the package manager is really easy, just use `pip install {package name} ``` to install and `pip uninstall {package name}` to uninstall. If you want he help page just run `pip` with no arguments.
\
Here's an example:\
`pip install matplotlib`\
installs the `matplotlib` package (for graphing in python).

Then you import it just like a standard library:\
```python import matplotlib.pyplot```\
If you don't want to constantly write out `matplotlib.pyplot.graph` you can alias it in the import like this:\
```python import matplotlib.pyplot as plt```\

== Summary exercises
#note(
    title: [Unfinished],
    content: [I still have yet to add the exercises here, at some point I will update this.]
)

= Reading/writing to/from external files

As of now, you've only stored data in RAM in variables, which means that when the program terminates the data is lost. If we want data to be stored persistently, we need to write to external files and save them to the disk, for example, you may want to store logins and usernames or user data in an external file.\
Here's how python handles this:\

Python as an inbuilt function for this, called `open`.  The way this works is it makes a file object that you can use, and operate on. More on objects later though. This allows you to open a file, with a mode. \
Here are the valid modes you can use, and what they do:\
#table(
  columns: 2,
  table.header[*Mode*][*Function*],
  ['r'], [Open for reading (default)],
  ['w'], [Open file for writing, truncating the file first (overwrites contents)],
  ['x'], [Make a file, throws an exception if the file already exists],
  ['a'], [Open for writing, append to file if it exists],
  ['b'], [Binary mode],
  ['t'], [Text mode (default)],
  ['+'], [Open for updating (read and write)]
)
```python
def return_file(filename: str, mode: str) -> TextIO:
    my_file = open(filename, mode)
    return my_file
```
This gives you the file object.\
Then you have the following methods for the file object:\
- `.read()` reads in the file into a variable
- `.write('Text to write')` write text to a file
- `.close()` closes the file if you opened it with the `open()` function
- `.readline()` reads a single line from the file
- `.readlines()` reads in the whole file as a list of lines
\
\
If you want the file as a list you can also use these two options:\
```python
for line in f:
    print(line, end='')
```
This works because the file object is an iterable, meaning that you can loop over it with `for` as with any other iterable. \

Equally you could just do this to get a list: \
```python list(f)```\



== Context managers, using the `with` keyword

A context manager does the opening and closing for you, which is more convenient. Here's how you use `with`:\
```python
with open('file') as f:
    data = f.read()

```\
The read mode is default, so we didn't need to specify it. And now, you don't have to call `file.close()` as `with` handles it for you.\
\
`with` isn't only used for files, it's used when you need to connect and then close off connections, for example:\
```python
from contextlib import closing
from urllib.request import urlopen

with closing(urlopen('https://www.python.org')) as page:
    for line in page:
        print(line)
```

== Using json as a format for storing data
The `.json` format is pretty helpful for reading and writing data to files in a way that a computer program like python can easily read in as a data structure. \

#note(
    title: [Unfinished],
    content: [This part here is unfinished, at some point I'll come back and add this content. For now, look this up!]
)
// This is suprisingly easy, just have the functions that you want in another file, and then take the filename and import it at the top of your `main.py` file like so:\
// ```python import helper```
// This is supposing your other file is called helper.py.
// \
// To just import a function you can use this:
// ```python from helper import sort```
// This is supposing the function you want to import is called `sort`

== Summary exercises

=== Ex1
#exercise(
    title: [Reading a file line by line],
    content: [Write a generator function (with yield) function that reads in a file line by line, and with each call returns the line.]
)

#note(
    title: [Unfinished],
    content: [I still have yet to add the exercises here, at some point I will update this.]
)

= Object Oriented Programming in Python <oop-ch>

In python, everything is an object - you can test this by wrapping anything in the `type` function.\
```python
x: int = 12
print(type(x))
```
This gives us: ```python <class 'int'>```\
What this means, is that `x` (the variable name) is an object (you can tell as it says 'class'), of type `int`. `int` is a built-in data type into python, one of the many we explored in chapter 4, and all those mentioned there are really classes, which are blueprints for objects.\
Not just variables and data are objects, everything in python is an object. Here's a function:\
```python
def simple_function() -> None:
    pass

print(type(simple_function))
```
We'll get ```python <class> 'function'>```.\
This doesn't mean that the `simple_function` is a data type per se, but rather that it's an object, which is an instance of a class. A class is like a blueprint for an object.\
\
You may have noticed that I've previously mentioned methods for objects - such as the `.add` option for integers.\
What this really is, is a method in the class `int`. Methods are basically functions that are in classes.\
Alright, let's start making our own classes, with this example we are making a simple maths object:\
- First start with the `class` keyword, followed by a name (PascalCase for the name), and the `:` \
```python class ArithmeticClass:```
- Next we have everything in the class indented, and we will start by defining an `__init__` constructor method. This is a function that runs every time you initialise the class.\
```python 
class AritheticClass:
    def __init__(self, value):
        self.value = value```
- Then we can add our own methods (which are really functions) to the class:\
```python 
class AritheticClass:
    def __init__(self, value):
        self.value = value

    def add_value(self, x):
        return self.value + x
```
- Now we have a class made (which is like a blueprint for an object), but we still need to initialise the object. Here's how we do that:\
```python
a = ArithmeticClass(69)
```
Any parameters in the `__init__` dunder method are ones you have to give when you make a class.\
Now we can't just print this class out - this is what we get when we do:\
```python <__main__.ArithmeticClass object at 0x7fc09fec7eb0```\
We just got the memory address of it but not the value of it. This is because we didn't return anything in the `__init__` method - and we can't as it must return the `None` type. \
If you wanted to have an output from print you need to use the dunder method `__str__` which prints a string to the console when printing the object normally. Here's how to use it:\
```python
class ArithmeticClass:
    def __init__(self, value):
        self.value = value

    def add_value(self, x):
        return self.value + x
    
    def __str__(self):
        return str(self.value)
    

a = ArithmeticClass(69)
print(a)
```
The `__str__` method only returns a string, so you need to wrap it in the `str()` if it's not a string.\ \

The only point of `__init__` is to initialise the class the variables, not to do anything else. Hence the other dunder methods - such as `__str__` for string representation.\
\
Any dunder method (double underscore), sometimes called a magic method is a method that does something special to python, for example there's the `__len__` method for defining a result when ran in the `len` function. 

== Static methods
Now suppose we want to add some more general functions to our `ArithmeticClass`, that do general operations but don't change the state of the class (any values we defined that belong to the class, like the `self.value`. We could try do this at first:\
```python
class ArithmeticClass:
    def __init__(self, value):
        self.value = value

    def add_value(self, x):
        return self.value + x

    def add_two_values(a, b):
        return a + b

```
But this throws an error as we need to have the self parameter on an instance method, which is the type that you've seen so far.
What error? Here:\
```
TypeError: ArithmeticClass.add_two_values() takes 2 positional arguments but 3 were given
```
Python is telling us that we gave it two many arguments, you'll get the same error with this example:\
```python
def function(a, b):
    return a + b


result = function(0, 1, 2)
```
You may be confused as we only gave it `a, b` in the function call, but this error occurs because we have an instance method, which takes `self` (this can be called anything but by conversion it's called `self` in python, so python assumes you called the `self` instance parameter `a`). \
One way to fix this is to add self in the function definition, like this:\

```python
    def add_two_values(self, a, b):
        return a + b
```
But this doesn't make any sense as we aren't using self, so why should we pass it in? \
This is where `static` methods come in, they are a type of method that doesn't do anything to the instance. This is usually used for functions that you generally organise into a class for neater code, but there isn't another reason that they are in a class. You may have seen them in other languages shown like this, for example in java:\
```java
class HelloReader {
    public static void main(String[] args) {
      System.out.println("Hello reader!")
    }
}
```
This method is static because it doesn't do anything to the class state. But also python doesn't do this because it isn't a boilerplate (meme) language like java.
\
Anyway, to use static methods in python you add the ```python @staticmethod``` decorator to the method, like so:

```python
class ArithmeticClass:
    # --snip--
    @staticmethod
    def add_two_values(a, b):
        return a + b
```

== Inheritance

The idea behind inheritance is that it allows you to more easily write similar classes by abstracting them to a 'parent' class and the 'child' classes inherit their properties, state, and behaviours. Then in the child class you can add separate functionality without having to copy and paste the whole parent class. \
For example (and for this example I'm going to abstract the ideas, so it may not actually be a viable option if you were going to try build this), if you were building a city simulation game, and in the city there are many buildings.\
Without inheritance, you might make a class for a school, one for a home, one for a skyscraper and so on; but all these classes have lots of things in common, like similar materials, having doors and windows, and structural elements. \
Here's some representative pseudocode:\
```
class SkyScraper {
    int counter_number = 0

    private:
      int space;
      int cost;

    fn SkyScraper(int space, int cost) 
    {
      this.cost = cost;
      this.space = space;
      counter++;
      int doors = 6;
      int windows = 256;
      int bedrooms = 0;
    }

    fn pay_tax(this, UserAccount account) 
    {
      account -= VALUE
      record payment
    }
}

class House {
    int counter_number = 0

    private:
      int space;
      int cost;

    public:
    fn SkyScraper(this, int space, int cost) 
    {
      this.cost = cost;
      this.space = space;
      counter++;
      doors = 2;
      windows = 16;
    }

    public:
    fn pay_tax(this, account) 
    {
      account -= VALUE;
      record payment;
    }
}
```

But using inheritance, you can take this out into its own parent class of a general building, and then have all the other specific buildings inherit from the parent. \
```
class Building {
  int counter = 0

  fn Building(this, int space, int cost, int windows, int doors, char[] name)
  {
      this.cost = cost;
      this.space = space;
      this.windows = cost;
      this.doors = cost;
      this.name = name
      counter++;
  }

  public:
  fn pay_tax(this, UserAccount account) 
  {
    account -= VALUE;
    record payment;
  }
}

class SkyScraper(Building) {
  fn SkyScraper(this, int space, int cost, int windows, int doors, char[] name, floors) {
    parent.Building(this, int space, int cost, int windows, int doors, char[] name)
    this.floors = floors
  }
}

class House(Building) {
  fn House(this, int space, int cost, int windows, int doors, char[] name, bedrooms) {
    parent.Building(this, int space, int cost, int windows, int doors, char[] name)
    this.bedrooms = bedrooms
  }
}
```

Here we reused a bunch of things between our classes, like the cost and the space, just changing what was unique to the class.

#pagebreak()

== Dataclasses
In a lot of other languages, there's a way to group data together neatly in something called a 'struct' but here in python that doesn't exist, but we do have classes, and a special kind of class called a dataclass, can be very powerful and probably the best way to pass data around in python.
Here's an example:\
```python
from dataclasses import dataclass

@dataclass
class User:
    id: int
    email: str
    hash: str

user = User(420, "john.doe@provider.com", "914c13f1b81e1486202203634c9173aeb6b30d301172c2f5b34a9ec671b008f7")
```
What this basically does is add the constructor and set the values for you, so without it you might have done the same like so:\
```python
class User:
    def __init__(
        self,
        id: int,
        email: str,
        hash: str):

    self.id = id
    self.email = email
    self.hash = hash
```
Then you can index the values like normal:\
```python
accessed_hash = user.hash
```
You can also set default fields like so with the equals operator:\

```python
@dataclass
class User:
    id: int
    email: str = ""
    hash: str = ""
```

Now if you initialise without the email or hash fields, we get an empty string. Note this only works for immutable values.
\
You can also modify some values and how the dataclass behaves when you pass in parameters when you use the wrapper. Here are some useful ways to change how it behaves:\

1. `repr` by default is true and modifies the representation of the class.\
By default if you print a dataclass it gives you all the values of the dataclass, for example if we printed our earlier dataclass user we would get:\
```python User(420, "john.doe@provider.com", "914c13f1b81e1486202203634c9173aeb6b30d301172c2f5b34a9ec671b008f7")```\
Which might not be all that useful, so you can implement your own repr dunder method like so:\
```python

@dataclass(repr=False)
class User:
    _id: int
    email: str = ""
    _hash: str = ""

    def __repr__(self): -> str:
        rep = f"User email: {self.email}"
        return rep
```

2. `frozen` by default is false and means that after you create your dataclass you can't change it. This is useful if you want to later hash your dataclass.\

```python
@dataclass(frozen=True)
class User:
    _id: int
    email: str = ""
    _hash: str = ""
```

== Summary exercises

#note(
    title: [Unfinished],
    content: [I still have yet to add the exercises here, at some point I will update this.]
)


= Functional python <functional-chapter>

#warning(
    title: [This chapter might make your head hurt],
   content: [Here I cover the more functional side of python, but in doing so have to cover some functional programming concepts and how it ties into maths, and a little bit of lambda calculus's functions to explain how it works.
Try to follow along but if you find it doesn't make any sense then don't worry too much as this is only small part of python.]
)

Python being a multi-paradigm language, it has the option to also write in a more functional way.\
What does this mean?\
The idea behind functional programming and languages like F\#, Haskell, Elixir etc is that:
- The only abstraction allowed is a function (no classes, objects, variables, only functions)
  - Thus functions are treated a little bit differently, so functions are 'first class citizens' meaning they are treated like anything else, they can be passed around as anything else, and be returned from other functions, and taken in as parameters.
  - Functions are pure, meaning that they have no side effects, don't mutate any variables, and always take one input and return one output.
- There is no state. 
  - State is anything that is stored in the program at runtime and changes. This means that all variables are immutable - meaning when a value is set it cannot change. In fact, variables are just names, rather than what we traditionally think of as a variable. 
\
\
Thinking in a functional way, functions are much more like the functions you get in maths, which are known as pure functions. This means that they have no side effects, always take a single input and always return a single output. \
Take this function for example:\
```python
def square(x: int) -> int:
    return x * x
```
Which can be written as this:\
$ f: ZZ arrow NN "such that" x mapsto x dot x $
(the $mapsto$ means maps to, like mapping from one set of standard Cartesian coordinates to another)\
or simply like this:\
$ f: f(x) = x dot x $
\
Quickly I'll go over lambda functions as it makes it easier to translate between the maths functions and python functions.

== Anonymous (lambda) functions
All this is is a function without a name, but you can assign it to a variable, which really is just a name. It allows to express functions in the more 'mathsy' way. This is often used to pass to other functions like map, slice, sorted, filter etc. Here's how you use it.
```python
square = lambda x: x * x
```
This is the more functional way of writing a function. \
You can also take and return any number of parameters: \
```python
sum3 = lambda: x, y, z: x + y + z
```

As you can see it can take any number of arguments. Lambda functions can also return any number of values, by bundling them together as a tuple or list, like so:\
```python
diffAndSum = lambda x, y: (x + y, x - y)
```

== Higher order functions
This is where instead of having large recursive function that run your program, you break it into smaller functions, and to really utilise the power of these functions we have functions that return functions. We've seen this already when we covered function wrappers and decorators, but let's see a really simple example of one first.\
```python
def return_add_n(x: int) -> func:
    def add(y: int) -> int:
        return x + y
    return add

add_42 = return_add_n(42)  # add_42 is now a function that given an integer will add 42 to it

print(add_42(27))  # prints 42 + 27, so 69
```
== Currying
This is named after mathematician Haskell Curry, and is a way to 'bind' parameters to strictly pure functions that always take one parameter and always return a single value. \
Let's first look at the impure way of doing it:\
```python
sum = lambda a, b: a + b
```
In lambda calculus you instead express it as this: \
$ f: f(x) = lambda x . (lambda y . x + y) $
or in more familiar maths functions like this: \
$ f: f(x) = ( f(y) = x + y ) $

```python
add = lambda a: (lambda b: a + b)
```
This is kind-of impractical in most cases as tuples are a thing and we don't need to follow lambda calculus rules.\
== Function composition over procedural commands

Suppose you wanted a function that returns the sum of two squares like this:\
```python
def sum_two_squares(a, b):
    return (a ** 2) + (b ** 2)
```
And if we separate the operations we get this:\
```python
def sum(a, b):
    return a + b

def square(x):
    return x * x

def sum_two_squares(a, b):
    x = square(a)
    y = square(b)
    return sum (x, y)
```
\
While these functions are pure, they still are a concatenation of commands, a procedural way of writing code. Instead of this let's first rewrite the last function as an expression:\
```python
def sum_two_squares(a, b):
    return sum( square(a), square(b) )
```
But we're still using a command, `return`, so let's rewrite this with anonymous functions instead:\
```python
sum = lambda a, b: a + b

square = lambda x: x * x

sum_two_squares = lambda a, b: sum(square(a), square(b))
```
\
There's still a problem here though, as in original lambda calculus functions have a fixed arity of 1, meaning they can only take one parameter. So let's fix this with currying:\
```python
sum = lambda a: (lambda b: a + b)

square = lambda x: x * x

# make name shorter to fit on the page
sum_t_s = lambda a: (lambda b: sum(square(a))(square(b)))

# How to use this function
six_squared_plus_seven_squared = sum_t_s(6)(7)  # = 85
```

This is a bit harder to read, so python actually prefers you to use this syntax for functions: \
```python
def sum(a):
    return lambda b: a + b

def square(x):
    return x * x

def sum_two_squares(a):
    return lambda b: sum(square(a))(square(b))

sum_two_squares(4)(5)

```
Even though it's not as 'functional' as the previous.



== Recursion (part 2)
Since no variables can be mutated, we instead use recursion, which is when functions call themselves, to get a kind of iteration. \

As I mentioned earlier, recursion when not used properly is risky as it can go on forever filling up the call stack until it breaks your program.\
To avoid this, we must always have a termination in the recursion, with a terminal case:\
We must have three types of cases in recursion:\
- Recursive Case: The part of the function where it calls itself with modified arguments, moving the problem toward the base case.

- Base Case: The simplest instance of the problem, where the function does not call itself and returns a direct answer. The base case prevents infinite recursion and stack overflow errors.

- Progress Toward Base Case: Each recursive call must modify the input to ensure that the base case is eventually reached.

Here's an ideal use case for recursion: you want to have a factorial function (perhaps because you didn't know python had one from the math library), and you decided to write it yourself. First let's write the normal, standard, way of writing code, no recursion. \
```python
def factorial(x: int) -> int:
    if x < 0:
        raise ValueError("can't factorial a negative")
    elif x == 0:
        return 1
    result = 1
    while x > 1:
        result *= x
        x -= 1
    return result
```
By this point, this should all be self-explanatory to you, if it's 0, you get 1, if it's negative we throw an error, and we use a loop that multiplies each element for by a number, which is set to the previous element. We return when we hit 1. \

This same code can be written like this:\
```python
def factorial(x: int) -> int:
    if x < 0:
        raise ValueError("can't factorial a negative")
    elif x == 0 or x == 1:
        return 1
    else:
        return x * factorial(x - 1)
```
or in a more concise way like this using python's ternary operator:\

```python
def factorial(n):
    return 1 if n == 0 or n == 1 else n * factorial(n - 1)
```

This took me a long time to get my head around, but the easiest way to actually get it is to get a piece of paper and write down what happens at each step yourself. Nevertheless, I'll try to explain what happens. \
Crucially you return a function call, which means that before it can return, it evaluates the function, which returns a result allowing the 'parent' function to return. This is what happens at first:\
Suppose we get a number like 5 thrown into the function.\
It hits the else block, which returns 5 (which is x) multiplied by what happens when you pass 5-1 (4) into function. \
Recursion works this way when you have a task that you can take as the same task minus one little part you evaluate, like here, we took out and said that the factorial of 5 is really the factorial of 4 multiplied by 5.\
The function calls itself until it hits the base case which has a 'normal' return, returning 1, and pushes this back up the chain to close the function calls. \
The next function call up, which is when we called ```python factorial(2)```. Here this evaluates to 2 \* factorial(1) which returned 1, which then evaluates to 2. The next call is factorial(3) and so on. This continues back up returning from each function until we finish.\
\
If you're familiar with C style loops, which I'll show below, we can take each part and turn it into the recursive function, making a normal loop a recursive loop. Let's start with a normal loop:\
```c
#include <stdio.h>

void print_arr(int* arr, int n) {
    for (int i = 0; i < n; i++) {
        printf("%d ", arr[i]);
    }
}

int main() {
    int arr[] = {0, 1, 1, 2, 3, 5, 8, 13, 21};
    int n = sizeof(arr)/sizeof(arr[0]);
    print_arr(arr, n);
    return 0;
}
```
I apologise for not sticking with pure python, but C has the most universal ```c for``` loops, so I felt it would be more appropriate. Here all we do is define the array, the array's length as n, and pass it to the function print_arr.\
It iterates over each element and prints it. \
The for loop has three parts: the initialisation, (int i = 0), the condition (i < n), and the post (i++).\
Equivalently in python it's this:
```python 
i = 0
while i<10:
    i += 1
```
To turn this into a recursive loop, which is used in functional paradigms, where all variables are immutable, we need to take care of this mutation, as it's not allowed to change variables.\
In functional code, all you have is a function, so let's first take out this main body of our C into its own function, like so:\
```c
void print_index(int* arr, int index)
{
        const int item = arr[index];
        printf("%d", item);
}
```
All this function does is print an item given an index, which is just what is being done for every time we iterate in the for loop.\
To print the whole array we need to call this function for every item in our array.\
First to get looping we add the function call at the end.\
```c
void print_index(int* arr, int index)
{
        const int item = arr[index];
        printf("%d", item);
        print_index(arr, index);
}
```
But this is no good, as we are calling this function indefinitely and it just prints the same item over and over again.\
To increment for every function call and no mutation, we add a new constant which is the next index, and call print_index with the next index each time.\
```c
void print_index(int* arr, int index)
{
        const int item = arr[index];
        printf("%d", item);
        const int nIdx = index + 1;
        print_index(arr, nIdx);
}
```
But this goes until the end of the list until the program crashes as it tried to read an index past the length of the list.\
To stop this we have our base case, which corresponds to our condition. We only run it so long as the index is in range, so pass the list's length, and have an if check.\
```c
void print_index(int* arr, int index, int n)
{
        if (index == n) 
                return;
        const int item = arr[index];
        printf("%d\n", item);
        print_index(arr, index + 1, n);
}
```
And there, we've swapped normal iteration for a recursive function call, rewriting our loop in a more functional way. This works the same way in python, so try to apply what I've shown you here.\

=== Interview question with recursion

There's a famous-ish interview question that goes like this:

#quote(/*attribution: [ #link("https://docs.python.org/3/tutorial/errors.html")[Python Docs] ]*/)[
"You are climbing a staircase. It takes n steps to reach the top.
Each time you can either climb 1 or 2 steps. In how many distinct ways can you climb to the top?"
]

This includes all permutations, so for example, if the staircase had 5 steps there would be 8 ways to climb the staircase:
```
1. 1, 1, 1, 1, 1
2. 1, 1, 1, 2
3. 1, 1, 2, 1
4. 1, 2, 1, 1
5. 2, 1, 1, 1
6. 1, 2, 2
7. 2, 1, 2,
8. 2, 2, 1
```
Here I'll walk through the way to solve it recursively step by step: \
- We need a base case:
    - If it has 0 or 1 steps there's only one way to climb it, so let's define this as a starting point. 
    ```python
    def count_ways(stairs: int) -> int:
        if stairs == 0 or stairs == 1:
            return 1
    ```
    This is the only number we'll (manually) return from this function, the recursive calls do the rest.
- And we need a recursive case:
    - Thinking about it, there are two ways you can reach the top step: either having gone from two steps up or from one step up. So let's return those two cases, and all the ways to get to those two steps as well, like this:
    ```python
    def count_ways(stairs: int) -> int:
        if stairs == 0 or stairs == 1:
            return 1
        return count_ways(stairs - 1) + count_ways(stairs - 2)
    ```

This function now calls itself modifying the input until the value is 1, and then closes all opened function calls feeding the number up the chain until it returns a single integer.

== Summary exercises

=== Ex1
#exercise(
    title: [Rewrite in python],
    content: [Given what you've learned, take the C code I used as the example and rewrite it in python. It's easier in python as you don't have to worry about the length of the array in the fancy way as you just use `len()` or the method. ]
)

=== Ex2
#exercise(
    title: [Binary search],
    content: [Using recursion, so no mutation of variables, write a binary search function, where given a list and an item will return a boolean depending on whether it was found. Binary search cuts in half repeatedly until the item is found, and only works for sorted data. \
This is an ideal problem to solve with recursion, as it can easily be broken down, and there are clear cases. Try to apply what you've learned.]
)

#note(
    title: [Unfinished],
    content: [This part here is unfinished, at some point I'll come back and add this content. ]
)

// === Indirect recursion
// This is when a function calls another, which calls the first in turn.
// TBA: Give an example


= Testing
So far we've just been writing code and hoping that it works, then running it and testing it 'interactively' that way. This isn't ideal, and you can't see just from looking at code whether it does what you want it to. Instead, I'll introduce you to how to write code to test your other code. \
\

== A very simple example

To start off with, the general way of writing code to test code is to mimic the directory and file structure, and have test functions that test your functions. Here's an example: \

```python
# file maths.py
def add(a, b):
    return a + b
```

```python
# file test_maths.py
from maths import add

def test_add():
    a = 10
    b = 15
    result = add(a, b)
    assert result == 25
```
And that's it for the basic case, `assert` will raise an error if something went wrong, and you can pass an error message to assert like so: \
```python assert result == 25, f"{a} + {b} returned {result}, should have been 25"```


== Key concepts in testing
- Test Case: A single unit of testing, defined as a class inheriting from `unittest.TestCase`. Each test case contains methods that test specific functionality.
- Test Suite: A collection of test cases or test methods to be run together.
- Assertions: Methods like `assertEqual`, `assertTrue`, or `assertRaises` to check if the code behaves as expected.
- Test Runner: Executes tests and reports results.
- Setup and Teardown: Methods to prepare the environment before tests (`setUp`) and clean up after (`tearDown`).

== Unit tests using the unittest module
Just using assertions can work but also gets a little tedious, so let's use the standard library's unittest module to help us out here. \
To start off, let's rewrite our previous test using it so you can get to see the syntax: \
```python
import unittest
from maths import add

class TestMaths(unittest.TestCase):
   def setUp(self):
       # Runs before each test method
       self.num1 = 10
       self.num2 = 5

   def test_add(self):
       result = add(self.num1, self.num2)
       self.assertEqual(result, 15, "Addition failed")

   def tearDown(self):
       # Runs after each test method (optional cleanup)
       pass

if __name__ == '__main__':
   unittest.main()
```
Now suppose we add a division to our `maths.py` file like so: \
```python
def divide(a, b):
   if b == 0:
       raise ValueError("Cannot divide by zero")
   return a / b
```
Here we have two cases to test for, a normal case and the raise case where we want to raise an error. Here's how you test for this: \
```python
class TestMaths(unittest.TestCase):
    # -- snip --

    def test_divide(self):
       result = divide(self.num1, self.num2)
       self.assertEqual(result, 2.0, "Division failed")

    def test_divide_by_zero(self):
       with self.assertRaises(ValueError):
           divide(self.num1, 0)
```
Here we add a new method for every case so we test everything and debugging is easier.



== Mocking functions for tests
Throughout this, we've very often used the 'input' function within our functions, but you may see a problem here while testing, as it's not straightforward to define code that puts something into the input function. Instead we write use mock functions that supply inputs to the input function (or similar). For this you need `unittest.mock`. \
Here's an example for where we would need to use it, and how to use it. Suppose we have a function: \
```python
def get_info():
    name = input("enter name: ")
    credit_card = int(input("enter credit card number: "))
    return name, credit_card
```
since `get_info()` doesn't take any arguments we need to mock input by patching it like this: \
```python
import unittest
from unittest.mock import patch

class TestUserInfo(unittest.TestCase):
    @patch('builtins.input')
    def test_get_user_info(self, mock_input):
        # Set up the mock to return specific values for consecutive calls
        mock_input.side_effect = ["Alice", "25"]
        
        # Call the function
        result = get_user_info()
        
        # Assert the result
        self.assertEqual(result, {"name": "Alice", "age": 25})
        
        # Optionally, verify that input() was called with the correct prompts
        mock_input.assert_any_call("Enter your name: ")
        mock_input.assert_any_call("Enter your age: ")

if __name__ == '__main__':
    unittest.main()
```

== Test driven development
This is a way of developing your code where instead of writing a bunch of code, then writing more code to test it you write the tests before the code, and you write code to pass your tests. The tests become your code's requirements.

== Summary exercises

#note(
    title: [Unfinished],
    content: [This part here is unfinished, at some point I'll come back and add this content. ]
)

= Asynchronous programming and parallelism
Asynchronous programming means you have a program that doesn't start executing all at the same place, instead it starts at different places that all finish their tasks at different times. We do this with co-routines. \
There are different models for parallelism: \
- Threading \
    This is for low resource tasks that run at the same time and may need to share data

- Processes \
    This is for much more intensive or long computational tasks that run on different cores of a CPU

- Async \
    When you don't want the program to hang on a certain task, and to continue doing other things, where the program starts executing in multiple different places.

== Async
First let's import it:\
```python import asyncio ```
And get a simple function that runs asynchronously, with the `async` keyword. \
```python
async def main() -> None:
    print("YOOO i'm running async!")
```
But you can't just run this function normally, as it returns a _coroutine object_, which then needs to be 'awaited'. \
To actually run this we use this like of code: ```python asyncio.run(main())```, so our very first async program looks like this: \
#pagebreak()
```python
import asyncio

async def main() -> None:
    print("YOOO i'm running async!")

if __name__ == "__main__":
    asyncio.run(main())
```

\<record scratch\>
Hold on what's actually going on? \
Let's explain the theory before we go any further: \

== The Theory

Asynchronous programming is a way to handle tasks that might take time to complete (like fetching data from a website, reading a file, or querying a database) without blocking the execution of other tasks. It allows a program to start a task and move on to other work while waiting for the task to finish, improving efficiency, especially for I/O-bound operations (tasks that spend a lot of time waiting for input/output, like network requests).

=== The event loop
This is like the nucleus/core of asynchronous programming, that manages tasks, schedules them to run, checks to make sure that they don't block each other etc. It's like a central hub that manages everything else.

=== Coroutines
This is like a task, which in python is a special type of function that can pause its execution and give control to the event loop - like `yield` does. In python we define them with `async def`.

=== Await
This is a keyword (the last one! We've covered them all now!) that is used within an async function to pause execution until another coroutine/task finishes. It then tells the event loop that it can run other tasks in the mean time.

=== Tasks and Futures
   - A _Task_ is a wrapper around a coroutine that schedules it to run in the event loop.
   - A _Future_ is a lower-level object representing a result that will be available later. Tasks are built on top of Futures.

== The (Theoretical) Practice
Now that the theory is out of the way, let's see how to properly apply all of this inside of python.\

- We use ```python async def``` to define a coroutine function
- We use ```python await``` to -- you guessed it -- wait for a coroutine function to finish without blocking the event loop. You can only use await inside a coroutine function.
- ```python asyncio.run()``` runs the main coroutine
- ```python asyncio.create_task()``` schedules tasks
\
Remember that `async def` coroutine functions return a coroutine object, and need to be run inside the event loop (like with ```python asyncio.run() ```)

== The Practice Practice
Here I'll show some examples and talk you through them, and I'll be using ```python asyncio.sleep()``` as an async version of ```python time.sleep()```

```python
import asyncio

# Define an async coroutine
async def say_hello():
    print("Starting to say hello...")
    await asyncio.sleep(1)  # Simulate a 1-second delay (non-blocking)
    print("Hello, world!")

# Run the coroutine
if __name__ == "__main__":
    asyncio.run(say_hello())
```

== Multiple coroutines
The previous example was very basic, let's look at multiple coroutines now: \

```python
import asyncio

async def task1():
    print("Task 1 started")
    await asyncio.sleep(2)  # Simulate work
    print("Task 1 finished")

async def task2():
    print("Task 2 started")
    await asyncio.sleep(1)  # Simulate faster work
    print("Task 2 finished")

async def main():
    # Run tasks concurrently
    await asyncio.gather(task1(), task2())

# Run the event loop
if __name__ == "__main__":
    asyncio.run(main())
```
Explanation: \
- ```python asyncio.gather()``` runs multiple coroutines concurrently and waits for all to complete.
- `task2` finishes before `task1` because it has a shorter sleep time, but they run concurrently, not sequentially.
- Total runtime is ~2 seconds (the longest task), not 3 seconds (sum of sleep times).
Output: \
```
Task 1 started
Task 2 started
Task 2 finished
Task 1 finished
```
== Using tasks

```python
import asyncio

async def fetch_data(id):
    print(f"Fetching data for ID {id}")
    await asyncio.sleep(id)  # Simulate varying work time
    return f"Data for ID {id}"

async def main():
    # Create tasks
    task1 = asyncio.create_task(fetch_data(1))
    task2 = asyncio.create_task(fetch_data(2))
    
    # Wait for tasks to complete and get results
    result1 = await task1
    result2 = await task2
    print(f"Results: {result1}, {result2}")

asyncio.run(main())
```

Explanation: \
- `asyncio.create_task()` schedules a coroutine to run in the event loop immediately.
- Tasks run concurrently, and we use `await` to get their results.
- The total runtime is ~2 seconds, as tasks run in parallel.

Output: \
```
Fetching data for ID 1
Fetching data for ID 2
Results: Data for ID 1, Data for ID 2
```

== Error handling: \
We may also want to catch exceptions that may be thrown from async functions, can to avoid an async/await try/catch hell we can neatly do it like this: \

```python
import asyncio

async def risky_task(id):
    print(f"Starting task {id}")
    await asyncio.sleep(1)
    if id == 2:
        raise ValueError(f"Task {id} failed!")
    return f"Success for task {id}"

async def main():
    tasks = [risky_task(i) for i in range(1, 4)]
    try:
        results = await asyncio.gather(*tasks, return_exceptions=True)
        for result in results:
            print(f"Result: {result}")
    except Exception as e:
        print(f"Caught error: {e}")

asyncio.run(main())
```

Explanation: \
- `return_exceptions=True` in `asyncio.gather()` ensures that exceptions are returned as results instead of crashing the program.
- Task 2 raises an error, but tasks 1 and 3 complete successfully.
- This approach is useful for robust async programs.

Output: \
```
Starting task 1
Starting task 2
Starting task 3
Result: Success for task 1
Result: Task 2 failed!
Result: Success for task 3
```

#note(
    title: [Unfinished],
    content: [This part here is unfinished, at some point I'll come back and add this content. ]
)

= References

== Tables

#table(
  columns: 4,
  table.header[*Operator*][*Name*][*Example*][*Output*],
  [+], [Addition], [2 + 9], [11],
  [-], [Subtraction], [2 - 9], [-7],
  [\*], [Multiplication], [2 \* 9], [18],
  [/], [Division], [2 / 9], [$0.22 overline(2)$],
  [/\/], [Integer division (returns floored quotient)], [2 /\/ 9], [0],
  [%], [Modulo (returns remainder of division)], [2 % 9], [2],
  [\*\*], [Exponent], [2 \*\* 9], [512],
)

#table(
  columns: 4,
  table.header[*Operator*][*Name*][*Example*][*Output*],
  [```python ==```], [Equality], [```python "" == []```], [```python False```],
  [```python >```], [Greater than], [```python 10 > 10```], [```python False```],
  [```python <```], [Less than], [```python 10 < 10```], [```python False```],
  [```python >=```], [Greater-than-or-equal-to], [```python 10 >= -1```], [```python True```],
  [```python <=```], [Less-than-or-equal-to], [```python 10 <= 10```], [```python True```],
)

#table(
  columns: 4,
  table.header[*Operator*][*Name*][*Example*][*Output*],
  [&],[AND],[],[],
  [|],[OR],[],[],
  [\~],[NOT],[],[],
  [^],[XOR],[],[],
  [>>],[Right shift],[11 >> 1],[5],
  [<<],[Left shift],[11 << 2],[44],
)

// KWtable

== Links
- #link("https://docs.python.org/3/")[Official Python Docs] 
    - This is pretty helpful, especially the tutorial for getting the hang of python, but it's meant for programmers (who know how to code in other languages) rather than complete beginners.
=== Youtube videos I found useful
- #link("https://www.youtube.com/watch?v=5xr8E6NQSxg")[Learn Python Fast by Alex Mux]
    - A very helpful video for python's syntax, explained in a 'no fluff' fast way
- #link("https://www.youtube.com/watch?v=CFRhGnuXG-4")[Why you shouldn't nest your code]
    - From code aesthetic, where I learned the 'never nesting' philosophy
- #link("https://www.youtube.com/watch?v=nuML9SmdbJ4")[Dear functional bros]
    - Also from code aesthetic, from which I learned a lot of the functional concepts from chapter 14. The examples are in JavaScript, but it's pretty easy to understand while knowing no JavaScript, as the concepts are what matter, not the syntax.
- #link("https://www.youtube.com/watch?v=JeznW_7DlB0&pp=ygUKcHl0aG9uIE9PUA%3D%3D")[OOP for beginners]
    - This is where I learned most of the OOP chapter from.

= Glossary
#print-glossary(entries)

