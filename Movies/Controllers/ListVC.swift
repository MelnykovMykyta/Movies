//
//  ListVC.swift
//  Movies
//
//  Created by Nikita Melnikov on 03.02.2024.
//

import Foundation
import UIKit
import SDWebImage
import RxSwift
import RxCocoa

class ListVC: UIViewController {
    
    let viewModel = MoviesListViewModel()
    private var disposeBag = DisposeBag()
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    private var list: [Movie] = []
    private var genres: [Genre] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = D.Colors.mainBackgroundColor
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(MovieCVC.self, forCellWithReuseIdentifier: "MovieCVC")
        collectionView.collectionViewLayout = UICollectionViewFlowLayout()
        collectionView.backgroundColor = .clear
        
        viewModel.fetchData()
        
        viewModel.moviesListObservable
            .subscribe(onNext: { [weak self] moviesList in
                guard let self = self, let moviesList = moviesList else { return }
                list = moviesList.results
                collectionView.reloadData()
            })
            .disposed(by: disposeBag)
        
        viewModel.genreListObservable
            .subscribe(onNext: { [weak self] genreList in
                guard let self = self, let genreList = genreList else { return }
                genres = genreList.genres
            })
            .disposed(by: disposeBag)
    }
}

extension ListVC: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCVC", for: indexPath as IndexPath) as? MovieCVC else {
            return UICollectionViewCell()
        }
        
        cell.label.text = list[indexPath.row].title
        if let url = URL(string: NetList.Urls.imageBaseUrl + list[indexPath.row].posterPath) {
            cell.image.sd_setImage(with: url)
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let movie = list[indexPath.row]
        let movieGenreIDs = movie.genreIDS
        let movieGenres = genres.filter { genre in movieGenreIDs.contains(genre.id) }.map { $0.name }
        print("\(movie.title): ")
        movieGenres.forEach { print($0) }
    }
}

extension ListVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let spacing: CGFloat = 4
        let collectionViewWidth = collectionView.frame.width
        let cellWidth = (collectionViewWidth - 3 * spacing) / 2.0
        return CGSize(width: cellWidth, height: cellWidth * 1.6)
    }
}
