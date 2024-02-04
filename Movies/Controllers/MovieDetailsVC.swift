//
//  MovieDetailsVC.swift
//  Movies
//
//  Created by Nikita Melnikov on 03.02.2024.
//

import Foundation
import UIKit
import SnapKit
import SDWebImage

class MovieDetailsVC: UIViewController {
    
    private var movie: Movie?
    
    private var backButton: UIButton!
    private var tableView: UITableView!
    private var tableViewHeader: DetailsHeaderView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupTableView()
    }
    
    @objc func back() {
        navigationController?.popViewController(animated: true)
    }
}

extension MovieDetailsVC: MovieDelegate {
    func didSelectMovie(_ movie: Movie) {
        self.movie = movie
    }
}

extension MovieDetailsVC: UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate  {
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(DetailsTVC.self, forCellReuseIdentifier: "DetailsTVC")
        tableView.backgroundColor = .clear
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .none
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "DetailsTVC", for: indexPath) as? DetailsTVC,
              let movie = movie else {
            return UITableViewCell()
        }
        
        cell.title.text = movie.title
        cell.yearLabel.text = movie.releaseDate.getYear()
        cell.voteLabel.text = movie.voteAverage.description
        cell.desc.text = movie.overview
        
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard let tableViewHeader = tableView.tableHeaderView as? DetailsHeaderView else { return }
        tableViewHeader.didScroll(scrollView: tableView)
    }
}

private extension MovieDetailsVC {
    
    func setupView() {
        
        view.backgroundColor = D.Colors.mainBackgroundColor
        
        tableView = UITableView()
        view.addSubview(tableView)
        
        backButton = UIButton(type: .system)
        backButton.setImage(UIImage(named: "backButton"), for: .normal)
        backButton.addTarget(self, action: #selector(back), for: .touchUpInside)
        backButton.tintColor = D.Colors.standartTextColor
        view.addSubview(backButton)
        
        let width = view.frame.size.width
        tableViewHeader = DetailsHeaderView(frame: CGRect(x: 0, y: 0, width: width, height: width * 1.5))
        
        if let posterPath = movie?.posterPath,
           let url = URL(string: NetList.Urls.imageBaseUrl + posterPath) {
            tableViewHeader.imageView.sd_setImage(with: url)
        } else {
            tableViewHeader.imageView.image = D.Images.defaultImage
        }
        
        tableView.tableHeaderView = tableViewHeader
        
        backButton.snp.makeConstraints {
            $0.size.equalTo(60)
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(12)
            $0.leading.equalToSuperview().inset(24)
        }
        
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
