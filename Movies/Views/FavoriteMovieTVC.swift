//
//  FavoriteMovieTVC.swift
//  Movies
//
//  Created by Nikita Melnikov on 04.02.2024.
//

import Foundation
import UIKit
import SnapKit

class FavoriteMovieTVC: UITableViewCell {
    
    private var view: UIView!
    var image: UIImageView!
    var title: UILabel!
    var yearLabel: UILabel!
    var voteLabel: UILabel!
    var genreLabel: UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

private extension FavoriteMovieTVC {
    
    func setupView() {
        
        backgroundColor = .clear
        
        view = UIView()
        view.backgroundColor = D.Colors.tabBarUnselectTabColor
        addSubview(view)
        
        image = UIImageView()
        image.contentMode = .scaleToFill
        view.addSubview(image)
        
        let sv = UIStackView()
        sv.axis = .vertical
        sv.spacing = 8
        sv.alignment = .leading
        sv.distribution = .fillEqually
        view.addSubview(sv)
        
        title = UILabel()
        title.font = UIFont(name: "Helvetica-Bold", size: 24)
        title.textColor = D.Colors.standartTextColor
        title.textAlignment = .left
        title.adjustsFontSizeToFitWidth = true
        title.adjustsFontForContentSizeCategory = true
        view.addSubview(title)
        
        yearLabel = UILabel()
        voteLabel = UILabel()
        genreLabel = UILabel()
        
        [yearLabel, voteLabel, genreLabel].forEach { label in
            label.font = UIFont(name: "Helvetica", size: 12)
            label.textColor = D.Colors.standartTextColor
            label.textAlignment = .left
            label.adjustsFontSizeToFitWidth = true
            label.adjustsFontForContentSizeCategory = true
            sv.addArrangedSubview(label)
        }
        
        view.snp.makeConstraints {
            $0.top.bottom.equalToSuperview().inset(4)
            $0.leading.trailing.equalToSuperview()
        }
        
        image.snp.makeConstraints {
            $0.width.equalTo(view.snp.width).multipliedBy(0.2)
            $0.height.equalTo(image.snp.width).multipliedBy(1.5)
            $0.top.leading.bottom.equalToSuperview()
        }
        
        title.snp.makeConstraints {
            $0.height.equalToSuperview().multipliedBy(0.2)
            $0.top.trailing.equalToSuperview().inset(8)
            $0.leading.equalTo(image.snp.trailing).inset(-20)
        }
        
        sv.snp.makeConstraints {
            $0.top.equalTo(title.snp.bottom).inset(-20)
            $0.trailing.bottom.equalToSuperview().inset(20)
            $0.leading.equalTo(image.snp.trailing).inset(-20)
        }
    }
}
