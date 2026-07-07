# travel_expenses

## Week 5
This week involved the task of creating the basic structure of the app's UI. A noteworthy detail is the documentation for the built-in Flutter widgets were very helpful to get everything right. E.g. the Cards description and how centering the AppBar title is a predictable boolean.

## Week 6
Timezone changes were why the commits after this point were at very late times as I had a flight to Bangladesh. Modelling the state file was the biggest task of this week but once that's done, there's a central point for all of the data types which makes future changes much easier.

## Week 7
Same pattern as previous weeks but implementing like the totally new chart widget and dropdown widget made this week more challenging. A future bug to fix was how text didn't properly change to white on the dark theme.

## Week 8
Following the tutorial for the week, implemented state management which made it so now the data and the transactions are in a central point for the app.
### Justification for shared_preferences
Initially, I had used Hive as the local store but quickly found out how it hasn't been supported for a while and newer versions aren't documented well. `shared_preferences` technically shouldn't be used as a datastore, but for an app like this without large blobs of data, it works perfectly. Flutter unfortunately doesn't have much support for simple ORMs like JS has with drizzle for example. So the next best alternative would've been hybrid datastores like Firebase or AppWrite which have offline capabilities. While they would've been fine, it would be a bit bloated as the app can function perfectly offline.
## Week 9
Not much to say here other than making the widget tests
## Week 10
Adding auth, fixing the tests for the auth, and finalizing the app. This week also fixed the theme bug and pruned code comments.