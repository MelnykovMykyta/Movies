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

protocol MovieDelegate: AnyObject {
    func didSelectMovie(_ movie: Movie)
}

class ListVC: UIViewController {
    
    private let viewModel = MoviesListViewModel()
    private var disposeBag = DisposeBag()
    
    weak var delegateMovie: MovieDelegate?
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    private var list: [Movie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = D.Colors.mainBackgroundColor
        
        setupCollectionView()
        viewModel.fetchData()
        
        viewModel.moviesObservable
            .subscribe(onNext: { [weak self] moviesList in
                guard let self = self else { return }
                self.list = moviesList
                self.collectionView.reloadData()
            }).disposed(by: disposeBag)
    }
}

extension ListVC: UICollectionViewDelegate, UICollectionViewDataSource {
    
    private func setupCollectionView() {
        
        let longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(longPress(_:)))
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(MovieCVC.self, forCellWithReuseIdentifier: "MovieCVC")
        collectionView.collectionViewLayout = UICollectionViewFlowLayout()
        collectionView.backgroundColor = .clear
        collectionView.addGestureRecognizer(longPressGesture)
    }
    
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
        } else {
            cell.image.image = D.Images.defaultImage
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let movie = list[indexPath.row]
        let vc = MovieDetailsVC()
        delegateMovie = vc
        navigationController?.pushViewController(vc, animated: true)
        delegateMovie?.didSelectMovie(movie)
    }
}

extension ListVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let spacing: CGFloat = 4
        let collectionViewWidth = collectionView.frame.width
        let cellWidth = (collectionViewWidth - 3 * spacing) / 2.0
        
        return CGSize(width: cellWidth, height: cellWidth * 1.7)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height - scrollView.frame.height
        
        if offsetY > contentHeight {
            viewModel.fetchNextPage()
        }
    }
    
    @objc private func longPress(_ gestureRecognizer: UILongPressGestureRecognizer) {
        guard gestureRecognizer.state == .began else { return }
        
        let touchPoint = gestureRecognizer.location(in: collectionView)
        guard let indexPath = collectionView.indexPathForItem(at: touchPoint) else { return }
        
        Haptic.getHaptic()
        let movie = list[indexPath.item]
        viewModel.checkMovie(movie)
    }
}
