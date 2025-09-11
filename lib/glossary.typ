#import "@preview/glossarium:0.5.4": make-glossary, register-glossary

// Define all glossary entries
#let entries = (
  (
    key: "var",
    short: "variable",
    long: "variable",
    description: "In programming, a variable is a symbolic identifier bound to a mutable reference that stores an object or value in memory. Technically, it functions as a named pointer to a memory location where data is stored, enabling indirect manipulation of the underlying value through the identifier."
  ),

  (
    key: "obj",
    short: "object",
    long: "object",
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
    long: "pointer",
    description: "A pointer is a primitive data type storing the memory address as its value - which enables indirect data access. They are used for manual memory management."
  ),

  (
    key: "cls",
    short: "class",
    long: "class",
    description: "A class is a construct in object-oriented programming that defines an object with its characteristics and shared aspects from the class."
  ),

  (
    key: "mut",
    short: "mutable",
    long: "mutable",
    description: "A characteristic of an object or data type that allows it to change after initialisation."
  ),

  (
    key: "imu",
    short: "immutable",
    long: "immutable",
    description: "A characteristic of an object or a data type that means that it cannot change its initial value."
  ),

  (
    key: "stack",
    short: "stack",
    long: "call stack",
    description: "In computer science, a call stack is a LIFO (Last-In-First-Out) stack data structure that tracks active subroutine invocations during program execution. It manages control flow by storing stack frames (activation records) containing:

    Return addresses (location to resume after subroutine completion)

    Local variables (temporary data scoped to the subroutine)

    Parameters (arguments passed to the subroutine)

    Bookkeeping data (e.g., saved registers, frame pointers)"
  ),

  (
    key: "heap",
    short: "heap",
    long: "memory heap",
    description: "In computer science, a memory heap is a region of process memory reserved for dynamic allocation of data structures whose size and lifetime are determined at runtime. It operates as a pool of unstructured memory managed through explicit programming interfaces rather than automatic scope-based mechanisms."
  ),

  (
    key: "mem",
    short: "memory",
    long: "main memory",
    description: "Computer memory stores data for immediate use by the computer. This is referring to RAM - Random Access Memory."
  ),
  (
    key: "syn-sug",
    short: "syntactic sugar",
    long: "syntactic sugar",
    description: "Part of language syntax that makes it easier to use/read for humans. It makes the code 'sweeter'."
  )

)

// Register entries for global use
#register-glossary(entries)

// Export entries for reference in main file
#let entries = entries

