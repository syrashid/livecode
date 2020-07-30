>> CONTEXT <<

Start off by playing "Poke'mon Theme Song"
Link -> https://www.youtube.com/watch?v=JuYeHPFR3f0
Link -> https://www.youtube.com/watch?v=IeS-q3YgKsk

-------------------------------------------------------------------

Welcome to the Kanto Region everyone, today we start our journey of building the greatest game ever created.  Pokemon!

Today's challenge is going to push the boundries of what we've learned and illuminate some of the concepts you've been using all day!


-------------------------------------------------------------------

Objectives
- Review objective with the class (what are we doing?)

X 1) Define a Pokemon class with an initialize(name, hp) constructor, exposing its name.  Add an instance health points variable, also exposed.

X 2) Define three Squirtle, Charmander and Bulbasaur classes that inherit from Pokemon
X 3) Implement an #attack instance method which returns a sentence like "Sparky used Thunder Shock" for each pokemon. (Hint: Charmander >> Ember; Bulbasaur >> Vine Whip; Squirtle >> Water Gun)

4) In another Ruby file, create an array with 4 pokemon instances, iterate over it and have each pokemon use their attack
5) Implement a ::type class method which will return an array of the 15 types in the Kanto Region.

6) Add a #defeat(person) instance method in Pokemon which returns a sentence like “Sparky defeated Misty”. Then override this method for the Squirtle class, and return a sentence like “Bubbles defeated Brock. Squirtle always wins!”

-------------------------------------------------------------------

Tools
- Some of the tools you reckon we'll use today (brainstorm as a class)
-- self
-- parent classes and child class, inheritance
-- variables and iterators
-- attributes (accessors + readers + writers) + instance variables
-- super
-- class methods


>> PROBLEM SOLVING APPROACH <<
- Psuedocode (How are we doing this?)
-- Define a pokemon class + write tests for it
    -- What are the methods, what are the parameters, what are the variables

-- Write children classes + their tests
    -- What are the methods, what are the parameters, what are the variables

-- Create a sandbox or interface to play with our classes, use the iterators, call the method for each pokemon

-- Implement a class method

-- Add in a method for squirtle that override the parent class method

- Tests

>> TESTING <<
Let's think how testing changes for a class vs just a simple function

>> IMPORTANT TOPICS FOR SY TO COVER <<
- Using rubocop individually
- Using self to create class methods vs instance methods
- Polymorphism, Duck Typing
- Refactoring w/ Super
- Ruby matchers (ex: exist, be, be_a, be_an, eq)
- Separation of concerns, Single Responsibility Principle

>> WHAT WE HAVE <<
- File structure
