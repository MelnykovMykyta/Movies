//
//  FavoriteDetailsTVC.swift
//  Movies
//
//  Created by Nikita Melnikov on 05.02.2024.
//

import Foundation
import UIKit
import SnapKit

class FavoriteDetailsTVC: UITableViewCell {
    
    var title: UILabel!
    var yearLabel: UILabel!
    var genresLabel: UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

private extension FavoriteDetailsTVC {
    
    func setupView() {
        
        backgroundColor = .clear
        
        title = UILabel()
        title.font = UIFont(name: "Helvetica-Bold", size: 32)
        title.textAlignment = .center
        title.adjustsFontSizeToFitWidth = true
        title.numberOfLines = 2
        addSubview(title)
        
        let sv = UIStackView()
        sv.axis = .vertical
        sv.distribution = .fillEqually
        sv.spacing = 8
        sv.alignment = .center
        addSubview(sv)
        
        yearLabel = UILabel()
        genresLabel = UILabel()
        
        [yearLabel, genresLabel].forEach { label in
            label.font = UIFont(name: "Helvetica-Bold", size: 20)
            label.textAlignment = .center
            label.adjustsFontSizeToFitWidth = true
            sv.addArrangedSubview(label)
        }
        
        title.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview().inset(20)
        }
        
        sv.snp.makeConstraints {
            $0.top.equalTo(title.snp.bottom).inset(-20)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.bottom.equalToSuperview().inset(40)
        }
    }
}

