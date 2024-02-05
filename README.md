# Movies - Nitrix Test App


## Description:

The program is a mobile application for browsing a list of movies with the ability to add them to favorites. The main functionality includes loading a list of popular movies and genres using The Movie Database (TMDb) API, displaying these movies in a collection, and the ability to add and remove movies from favorites.

## Technologies and Libraries:

###### Programming Language: Swift.
###### Architecture: MVVM (Model-View-ViewModel) with RxSwift.
###### Network Request: Utilizes a custom NetworkService class for making requests to the TMDb API using Alamofire.
###### Data Storage: Utilizes RealmDB for local storage of movie data and genres.
###### Image Loading: Uses the SDWebImage library for asynchronous image loading and caching.
###### User Interface: UIKit for building the user interface, including UITableView and UICollectionView. Constraint building is done using SnapKit.
###### Delegate Pattern Implementation: Utilizes the delegate pattern for handling movie selection.

## Design
![2](https://github.com/MelnykovMykyta/Movies/assets/127539076/c39b093e-ac81-4a30-b300-2d282403f203)
![1](https://github.com/MelnykovMykyta/Movies/assets/127539076/1f62349e-4a95-48ec-b0c3-4995385a486e)


## Main Features:

###### Loading a list of popular movies using the TMDb API.
###### Loading a list of movie genres.
###### Displaying a list of movies in a collection with detailed information.
###### Ability to add and remove movies from favorites.
###### Saving information about favorite movies in the local RealmDB database.
###### Asynchronous loading and displaying of movie posters using SDWebImage.
###### Implementation of long press gesture for removing a movie from favorites.
###### Scrolling down to automatically load the next page of movies.
