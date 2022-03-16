# Tv_Maze
Challenge made in Flutter

## ===== Dev Instructions =====

1. Clone the repo
2. In the command line run
     ```
     flutter pub get.
     ```
3. Open an emulator. Youcan use either flutter's, android studio's or your own cellphone connected to the pc
4. In the command line run, 
    ```
    flutter run
    ```
5. The application will build and install in your emulator or device. Remember if you have more than one connected the user interface will ask you to choose one.
6. Enjoy it!

## ===== User Instructions =====

1. Clone the repo
2. Install the apk provided in the distribution folder in your cellphone.
3. The application is under the name "Maze Tv" so you can find it in your cellphone.
4. Enjoy!

## ===== Inside the app, main functionalities =====

Once the app is up and running you will get to the home page directly where it will display the list of shows.
 
On the top -right corner you will see a search icon where you can search for an specific show you are looking for. If there are no matches maybe you can try with another show.

Clicking on a show wether you are doing a search or just taking a peak over the show list at the home page and the app will take you to the show details. Here you can read about the show. If you want to check out the seasons episodes you click over "Seasons & episodes" button.

In the Seasons & episodes section you will be able to select the season you want and it will automatically display for you the episodes for that season.It can contain extra episodes too!!

## ===== Good practices =====
Here I'm listing all the good practices used in this project in order to facilitate an example for developers on how to implement certain functionalities in a Flutter application. If they helped you with your own project do not forget to upvote(star) the repo, will mean a lot to me!  

1. BLOC pattern
2. Flutter_modular to manage routing. This also gives you the ability to apply beautiful transitions.
3. Use of Lint. Helps you pointing out those MUST programing rules for your code to look awesome. 
4. Testing ==> Unit, services and widgets.
5. DI using get_it package
6. API integration
7. Constants usage to avoid magic strings