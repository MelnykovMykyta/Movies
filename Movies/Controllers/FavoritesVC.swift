//
//  FavoritesVC.swift
//  Movies
//
//  Created by Nikita Melnikov on 03.02.2024.
//

import Foundation
import UIKit
import SnapKit
import RxCocoa
import RxSwift

protocol FavoriteDelegate: AnyObject {
    func didSelectFavoriteMovie(_ movie: MovieDBObject)
}

class FavoritesVC: UIViewController {
    
    private var disposeBag = DisposeBag()
    private let viewModel = FavoriteViewModel()
    
    private var favoriteMovies: [MovieDBObject] = []
    
    weak var delegateFavoriteMovie: FavoriteDelegate?
    
    private var label: UILabel!
    private var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupTableView()
        
        viewModel.observeFavoriteMovies().subscribe(onNext: { [weak self] _ in
            guard let self = self else { return }
            self.favoriteMovies = self.viewModel.getFavoriteMoviesList()
            if self.favoriteMovies.isEmpty {
                tableView.isHidden = true
                label.isHidden = false
            } else {
                tableView.isHidden = false
                label.isHidden = true
                self.tableView.reloadData()
            }
        }).disposed(by: disposeBag)
    }
}

private extension FavoritesVC {
    func setupView() {
        view.backgroundColor = D.Colors.mainBackgroundColor
        label = UILabel()
        label.text = D.Texts.addMovie
        label.font = UIFont(name: "Helvetica-Bold", size: 36)
        label.textColor = D.Colors.standartTextColor
        label.textAlignment = .center
        label.numberOfLines = 2
        label.alpha = 0.1
        label.isHidden = true
        view.addSubview(label)
        
        label.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.width.equalToSuperview().multipliedBy(0.6)
            
        }
    }
}
extension FavoritesVC: UITableViewDelegate, UITableViewDataSource {
    
    func setupTableView() {
        
        let longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(longPress(_:)))
        
        tableView = UITableView()
        tableView.backgroundColor = .clear
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.register(FavoriteMovieTVC.self, forCellReuseIdentifier: "FavoriteMovieTVC")
        tableView.addGestureRecognizer(longPressGesture)
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints { $0.edges.equalToSuperview() }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favoriteMovies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FavoriteMovieTVC", for: indexPath) as? FavoriteMovieTVC else {
            return UITableViewCell()
        }
        
        let movie = favoriteMovies[indexPath.row]
        
        if let imageData = movie.posterPathData,
           let image = UIImage(data: imageData) {
            cell.image.image = image
        } else {
            cell.image.image = D.Images.defaultImage
        }
        
        cell.title.text = movie.title
        cell.voteLabel.text = "\(D.Texts.voteText): \(movie.voteAverage)"
        cell.yearLabel.text = "\(D.Texts.yearText): \(String(describing: movie.releaseDate.getYear()))"
        cell.genreLabel.text = movie.genreIDS.map { $0 }.joined(separator: ", ")
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movie = favoriteMovies[indexPath.row]
        let vc = FavoriteMovieDetailsVC()
        delegateFavoriteMovie = vc
        navigationController?.pushViewController(vc, animated: true)
        delegateFavoriteMovie?.didSelectFavoriteMovie(movie)
        
    }
    
    @objc private func longPress(_ gestureRecognizer: UILongPressGestureRecognizer) {
        guard gestureRecognizer.state == .began else { return }
        
        let touchPoint = gestureRecognizer.location(in: tableView)
        guard let indexPath = tableView.indexPathForRow(at: touchPoint) else { return }
        
        let movie = favoriteMovies[indexPath.item]
        Haptic.getHaptic()
        
        tableView.performBatchUpdates({
            favoriteMovies.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .left)
        }) { _ in
            self.viewModel.deleteFromFavorite(movie)
        }
    }
}
