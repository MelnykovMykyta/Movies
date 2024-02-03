//
//  ListVC.swift
//  Movies
//
//  Created by Nikita Melnikov on 03.02.2024.
//

import Foundation
import UIKit
import SDWebImage

class ListVC: UIViewController {
   
    let network = NetworkService()
    
    @IBOutlet weak var collectionView: UICollectionView!
    private var list: [Movie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = D.Colors.mainBackgroundColor
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(MovieCVC.self, forCellWithReuseIdentifier: "MovieCVC")
        collectionView.collectionViewLayout = UICollectionViewFlowLayout()
        collectionView.backgroundColor = .clear
        
        network.fetchMoviesList { result in
            switch result {
            case .success(let moviesList):
                self.list = moviesList.results
                self.collectionView.reloadData()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

extension ListVC: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCVC", for: indexPath as IndexPath) as? MovieCVC
        else {
            return UICollectionViewCell()
        }
       
        cell.label.text = list[indexPath.row].originalTitle
        if let url = URL(string: "https://image.tmdb.org/t/p/original/\(list[indexPath.row].posterPath)") {
            cell.image.sd_setImage(with: url)
        }
        return cell
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
