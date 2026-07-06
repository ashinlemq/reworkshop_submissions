# Assignment Kickoff

## data representation requirements
These specific things are required for state management:
* Whether the user is signed in
* Whether permission has been granted to record audio
* Whether recording is active/paused/stopped
* Elapsed time during recording
* File path where audio is saved
* List of recorded files
* Error states

## organizing the code
The main.dart file should be the entry point for the app, containing at most theme data and importing of the other widgets.
Other widgets should be organized into their specific directories like recording functionality in "/recording" and firebase widgets in "/firebase".

## MVP Plan
### Milestones and features to work on first
1. Implementing the record functionality and visuals
2. Implementing the file management functionality
3. Implementing the error handling functionality
4. Implementing Firebase integration

