        ____                              _____ __
       / __ \____ _________     ____     / ___// /_  ____ _________  
      / / / / __ `/ ___/ _ \   / __ \    \__ \/ __ \/ __ `/ ___/ _ \  
     / /_/ / /_/ / /  /  __/  / / / /   ___/ / / / / /_/ / /  /  __/
    /_____/\__,_/_/   \___/  /_/ /_/   /____/_/ /_/\__,_/_/   \___/ 

## Description
Repository for the Dare n Share mobile app.  
Dare n Share is an app developed as part of a software projects course.  
For the Backend see: https://github.com/Timrin/dare-n-share.  

## Install and setup
Setup development environment for flutter app development  
https://flutter.dev/docs/get-started/install  
https://flutter.dev/docs/get-started/editor?tab=androidstudio

Setup the server  
https://github.com/Timrin/dare-n-share

Clone or download the files  
Import the project root folder as a project in Intellij (or Android studio)  
>_When selecting sources for the project, only select the lib folder_

Set the desired server IP for the app  
In `lib>constants>config.dart` change the IP variable to one of the other constants.  
**`TEST_IP`** Use when running code outside of the emulator  
**`EMULATOR_IP`** This is the default IP that points to your computers localhost in the Android Studio Emulator  

## Run the app
To start the app follow this short guide, starting at the **Run the App** section  
https://flutter.dev/docs/get-started/test-drive?tab=androidstudio
>_Make sure the config selector is set to run the main.dart file_

Don't forget to start the server!

**If you just want to try out the app, install the apk file in the top level folder on your device or emulator (Server is not necessary)**
