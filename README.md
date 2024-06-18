### Project NoBullshit (Blockouts)
Blockouts is a HIIT timer app that features popular timer styles like AMRAP, TABATA, EMOM, and FORTIME to guide the user's training. 
Users can also create a "Blockout", a workout that combines these styles, allowing them to configure settings for each timer and register the exercises for each block.
The general idea for the future is to have a go to app to have no excuses to workout.

The app utilizes Firebase Auth and Firestore for authentication and data storage. 
It employs Combine to handle asynchronous calls to Firestore. 
The views are built with SwiftUI using an MVVM pattern for each feature, with an EnvironmentObject acting as a global application state store.

### Milestones (Wishlist)
1.0 - Timers working (Free plan) and creation of Blockouts (Premium plan)
1.1 - Count rounds or repetitions giving a command to Siri (Premium plan)
1.2 - Improved UI (still to be defined)
2.0 - Adding custom made Blockouts for the user (No Bullshit coach - Premium plan)
