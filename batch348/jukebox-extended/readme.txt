SOTD: https://open.spotify.com/track/7fPuWrlpwDcHm5aHCH5D9t
Preset Up
- Pull up db drawer with starter.xml
- Have DB loaded into SQLPro
- Have terminal and stt opened as well
- Have two terminal windows sqlite3 and regular


Howdy class.

Today we'll continue exploring SQL and databases with an extension of a database we've been using so far, unfortunately I've yet to find an extension for my shorts

The database can be seen on the left as chinook.sqlite.

And because I'm such a nice guy, I've given you the starting point from what you created earlier today in starter.xml.

What tool do we have to create database diagrams?

What tool(s) do we have to explore databases?



--> Switch People

Now let's write a few SQL queries. (Use SQLite2)

1) List all customers (name + email), ordered alphabetically (no extra information)
  -Can you order by first_name, last_name, email?
  -What about ascending or descending, which one is the default

2) List tracks (Name + Composer) of the Classical playlist
  -What are aliases, what can they be applied to?
  -See here (https://www.geeksforgeeks.org/sql-aliases/)

3) List the 10 artists most listed in all playlists (name + tracks)
  -How many tables were there necessary to join?
  -Why do we do things like this?

4) List the tracks which have been purchased at least twice, ordered by number of purchases
  -What is the importance of ordering your sql keywords?
  -Can you use where everywhere?
  -(https://www.geeksforgeeks.org/having-vs-where-clause-in-sql/)

Some Final Notes:
Congratulations on the day, everyone did a great job.  One note is to leverage the power of sql queries and making them as singular as possible.  One of the first places to look when you get the question that your application is running too slow is to examine your sql queries.  So if you get the chance over the next few days, see if you can make the complexity of your request as simple as possible.  SQL has incredible powers to do a lot of the work for you.  Ex: use order by as opposed to using array.sort
