# Major Project Progress
## Achieved So Far
The first feature I have implemented was the basic ability to start a recording. I wanted to make the animations prominent by making it so the recording button animates between a circle and a square, which makes the UI of the app look nicer. A challenge I faced was how to actually get the timer working. It wasn't as simple as just declaring a counter, as time has many different formats to display.

In the end I found out that the `intl` library has the exact things I need to properly format time. So I managed to:
* Animate the user experience of starting a recording
* Format time to the minutes, seconds, and milliseconds that I required
* Sync the state of the timer with the recording
## Planned features
As the app is going to be simple and easy to use, I'll really only add the essentials required for a basic recording app. To match the Firebase requirements as well, instead of using a local store, the app will upload recordings to Firebase which will needs its own UI and handlers.
1. Sign in with email
2. Auto upload recordings and show progress indicators for the upload
3. Fetch a list of recordings from the user's cloud storage
4. CRUD operations for the recordings list
## Out of Scope
There are ways to expand on this app e.g. attach notes or photos to a recording. While they sound good in practice, it can end up bloating the app experience. Tools should do what they're good at. People can just use a much more functional notes app or their device's camera app for such features. Thus, the recording app will solely focus on the recording experience.
* Notes/Photos: Direct users to more functional sole use alternatives
* Location attached to recordings: This feature is kind of nice, but doesn't fit with the app philosophy. It can also make people steer away from the app when they see a big privacy warning of "THIS APP REQUIRES LOCATION ACCESS"