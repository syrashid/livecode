# Quiz 3 DB & Active Record

# Q1 - What's a relational database?
# A DB that stores datapoints to tables that are related to one another (usually through foreign keys)

# Q2 - What are the different "table relationships" you know?
# 1:1, 1:n, n:n

# Q3 - Consider this e-library service. An author, defined by his name has several books. A book, defined by its title and publishing year, has one author only. What's this simple database scheme. Please draw it!
# See XML

# Q4 - A user, defined by his email, can read several books. A book (e-book!!) can be read by several users. We also want to keep track of reading dates. Improve your e-library DB scheme with relevant tables and relationships.
# see XML

# Q5 - What's the language to make queries to a database?
# SQL

# Q6 - What's the query to get books written before 1985?
# SELECT * FROM books WHERE year < 1985;

# Q7 - What's the query to get the 3 most recent books written by Jules Verne?
# SELECT * FROM books b
# JOIN authors a ON a.id = b.id_authors
# WHERE a.name LIKE '%Jules Verne%'
# ORDER BY b.year DESC
# LIMIT 3

# Q8 - What's the purpose of ActiveRecord?
# a pattern that stores in memory object data in relational databases, USES ORM (Object Relation Mapping), ability to interact w/ our DB using our OOP language of choice

# Q9 - What's a migration? How do you run a migration?
# alteration of the db
# db:migrate

# Q10 - Complete migrations to create your e-library database.

class CreateAuthors < ActiveRecord::Migration[5.1]
  def change
    create_table :authors do |t|
        t.string :name
        t.timestamps, null: false #created_at  and updated_at
    end
  end
end

class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.string :title
      t.integer :year
      t.references :author
      t.timestamps null: false
  end
end

class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :email,
      t.timestamps null: false
  end
end

class CreateReadings < ActiveRecord::Migration[5.1]
  def change
    create_table :readings do |t|
      t.date :reading_date,
      t.references :book,
      t.references :user,
      t.timestamps null: false
  end
end

# Keep references on a separate line

# Q11 - Write a migration to add a category column to the books table.

class AddCategoryToBooks < ActiveRecord::Migration[5.1]
  def change
    add_column :books, :category, :string
  end
end


# Q12 - Define an ActiveRecord model for each table of your DB. Add the ActiveRecord associations between models. [4 Classes]

class Author
  has_many :books
end

class Book
  belongs_to :author
  has_many :readings

class User
  has_many :readings
end

class Reading
  belongs_to :book
  belongs_to :user
end


# Q13 - Complete the following code using the relevant ActiveRecord methods.

  #1. Add your favorite author to the DB
    Author.create!(name: 'Stephen King')

  #2. Get all authors
    Author.all

  #3. Get author with id=8
    Author.find(8)

  #4. Get author with name="Jules Verne", store it in a variable: jules
    jules = Author.find_by(name: 'Jules Verne') || Author.where(name: 'Stephen').take

  #5. Get Jules Verne's books
    jules.books

  #6. Create a new book "20000 Leagues under the Seas", it's missing # in the DB. Store it in a variable: twenty_thousand
    twenty_thousand = Book.create!(name: "20000 Leagues under the Seas", year: 1895, author: jules)

    twenty_thousand = Book.new(name: "20000 Leagues under the Seas", year: 1895)
  #7. Add Jules Verne as this book's author #8. Now save this book in the DB!
    twenty_thousand.author = jules
    twenty_thousand.save
   # The end


# Q14 - Add validations of your choice to the Author class. Can we save an object in DB if its validations do not pass?
  validates :name, presence: true
# of course we can't


