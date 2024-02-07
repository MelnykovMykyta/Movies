# Movies (Nitrix Test App)

## Description

**Movies (Nitrix Test App)** is a mobile application designed for browsing a list of popular movies with the ability to add them to your favorites. The app seamlessly integrates with The Movie Database (TMDb) API to fetch information about movies, genres, and captivating posters. The core functionalities include loading popular movies, displaying detailed information about them, and managing a personalized favorites list.

## Technologies and Libraries

- **Programming Language:** Swift.
- **Architecture:** MVVM (Model-View-ViewModel) with RxSwift.
- **Network Request:** Custom `NetworkService` class using Alamofire for TMDb API requests.
- **Data Storage:** RealmDB for local storage of movie data and genres.
- **Image Loading:** SDWebImage library for seamless asynchronous image loading and caching.
- **User Interface:** UIKit for building a polished UI, including UITableView and UICollectionView. Constraint building is elegantly handled using SnapKit.
- **Delegate Pattern Implementation:** Utilizes the delegate pattern for a seamless movie selection experience.
- **Animation:** Lottie.

## Design
![Frame 1](https://github.com/MelnykovMykyta/Movies/assets/127539076/1b53cf4b-6bd9-4104-beaf-e129fadd8796)

## Main Features

1. **Loading Movies:**
   - Fetches a list of popular movies from TMDb API.
2. **Genre Information:**
   - Retrieves and presents detailed information about movie genres.
3. **Movie Collection:**
   - Displays a visually stunning collection of movies with detailed information.
4. **Favorites Management:**
   - Allows users to effortlessly add and remove movies from their favorites list.
5. **Local Storage:**
   - Utilizes RealmDB to intelligently store information about favorite movies locally.
6. **Image Handling:**
   - Effortlessly loads and displays captivating movie posters using SDWebImage.
7. **Gesture Interaction:**
   - Implements a user-friendly long-press gesture for add/removing a movie from favorites.
8. **Infinite Scrolling:**
   - Enhances user experience by automatically loading the next page of movies as the user scrolls down.
