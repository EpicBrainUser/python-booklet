#import "@preview/glossarium:0.5.9": make-glossary, register-glossary

// Define all glossary entries
#let entries = (
  (
    key: "var",
    short: "variable",
    // long: "variable",
    description: "In programming, a variable is a symbolic identifier bound to a mutable reference that stores an object or value in memory. Technically, it functions as a named pointer to a memory location where data is stored, enabling indirect manipulation of the underlying value through the identifier."
  ),

  (
    key: "obj",
    short: "object",
    // long: "object",
    description: "An object is a runtime entity which encapsulates state (data), behaviour (operations) and identiy (unique existance). It represents an instance of a class in Object Oriented Programming."
  ),

  (
    key: "oop",
    short: "OOP",
    long: "Object-Oriented Programming",
    description: "Object-Oriented Programming is a paradigm of programming that uses objects - which can have data and behaviours - and computer programs are written where objects are made to interact with each other."
  ),

  (
    key: "ptr",
    short: "pointer",
    // long: "pointer",
    description: "A pointer is a primitive data type storing the memory address as its value - which enables indirect data access. They are used for manual memory management."
  ),

  (
    key: "cls",
    short: "class",
    // long: "class",
    plural: "classes",
    description: "A class is a construct in object-oriented programming that defines an object with its characteristics and shared aspects from the class."
  ),

  (
    key: "mut",
    short: "mutable",
    // long: "mutable",
    description: "A characteristic of an object or data type that allows it to change after initialisation."
  ),

  (
    key: "imu",
    short: "immutable",
    // long: "immutable",
    description: "A characteristic of an object or a data type that means that it cannot change its initial value."
  ),

  (
    key: "call stack",
    short: "stack",
    long: "call stack",
    description: "In computer science, a call stack is a LIFO (Last-In-First-Out) stack data structure that tracks active subroutine invocations during program execution. It manages control flow by storing stack frames (activation records) containing:

    Return addresses (location to resume after subroutine completion)

    Local variables (temporary data scoped to the subroutine)

    Parameters (arguments passed to the subroutine)

    Bookkeeping data (e.g., saved registers, frame pointers)

    When a recursive function causes a 'stack overflow', it is this stack that ran out memory for 'frames' being pushed to it"
  ),
  (
    key: "stack memory",
    short: "stack",
    long: "stack memory",
    description: "This is a high-speed part of memory on CPU that works as a LIFO data structure, and where the memory usage must be determined at compile time, therefore only immutable data can be stored here. "
  ),

  (
    key: "heap",
    short: "heap",
    long: "memory heap",
    description: "A memory heap is a region of process memory reserved for dynamic allocation of data structures whose size and lifetime are determined at runtime. It operates as a pool of unstructured memory managed through explicit programming interfaces rather than automatic scope-based mechanisms. Often you'll use the heap when the stack is too small or you need an amount of memory only known at runtime. "
  ),

  (
    key: "mem",
    short: "memory",
    long: "main memory",
    description: "Computer memory stores data for immediate use by the computer. This is referring to RAM -- Random Access Memory, or CPU cache or even registers. 'Memory' refers to the volotile memory used by a computer when a program executes on the CPU. "
  ),
  (
    key: "syn-sug",
    short: "syntactic sugar",
    // long: "syntactic sugar",
    description: "Part of language syntax that makes it easier to use/read for humans. It makes the code 'sweeter'."
  ),
  (
    key: "bool",
    short: "boolean",
    long: "boolean value",
    description: "A value that can only hold one of two values, True or False. This was named after George Boole, coming from boolean algebra."
  ),
  (
    key: "magic-num",
    short: "magic number",
    // long: "magic number",
    plural: "magic numbers",
    description: "A number that has a special or particular meaning that isn't make clear to the reader, for example writing `return diameter * 3.141592` inside a find_circumference(diamter) function, makes it so that 3.141592 is unclear, unless you recognise it as pi. It is often better to put it as a constant or variable in the program, or define it as a macro."
  ),

  (
    key: "token",
    short: "token",
    long: "lexical token",
    description: "A lexical token is a discreet part of the language, a string with an assigned meaning. It has a name and a value. For example you can have keywords, such as 'def', 'class', 'return', but also punctuation like parenthesis or ':', or operators, whitespace, identifiers and literals"
  ),
  (
    key: "parameter",
    short: "parameter",
    description: "In a function, the variables put in as 'placeholders' to be replaced by values when the function is called, e.g def add(x: int, y: int) -> int: return x + y, here x and y are the parameters in the function. This is also known as a 'formal argument'. "
  ),
  (
    key: "arg",
    short: "argument",
    description: "In a function call, the values put in place to substitue the parameter placeholders are called arguments, e.g sum_result = add(6 + 7), here 6 and 7 are the arguments given to the function add. This is referred to as the 'actual argument'. "
  )
)

// Register entries for global use
#register-glossary(entries)

// Export entries for reference in main file
#let entries = entries

