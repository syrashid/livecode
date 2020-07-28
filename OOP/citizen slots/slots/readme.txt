>> CONTEXT <<

Let’s implement a SlotMachine class that uses 3 reels. Each reel has 5 different options.

The class has one public instance method, score(reels), following these rules:

Item      Three of the same     Two of the same + Joker
Joker🤩           50             25 (2 jokers + anything)
Star⭐️            40             20
Bell🛎            30             15
Seven7️⃣           20             10
Cherry🍒          10              5

Once #score is implemented and tested, we can add a second public method #play to shuffle the reels.

For clarification a reel will look like ['joker', 'joker', 'bell']

You can read more about slot machines and how they work here
https://www.theguardian.com/australia-news/datablog/ng-interactive/2017/sep/28/hooked-how-pokies-are-designed-to-be-addictive


>> PSUEDOCODE <<
What are the biggest steps we need, can we break them down further

>> TESTING <<
Let's think about the two main components here we need to test

>> IMPORTANT TOPICS SY TO COVER <<
1) Make the code work for you, there are no rules to this, create as needed (tests)
2) Look for patterns, avoid hardcoding whenever possible
3) Helper functions as private methods

>> WHAT WE HAVE <<
- Again nothing, except for a spec struture
