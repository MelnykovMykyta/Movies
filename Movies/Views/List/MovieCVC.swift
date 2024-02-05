//
//  MovieCVC.swift
//  Movies
//
//  Created by Nikita Melnikov on 03.02.2024.
//

import UIKit

class MovieCVC: UICollectionViewCell {
    
    var image: UIImageView!
    var label: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

extension MovieCVC {
    
    private func setupViews() {
        
        contentView.backgroundColor = .clear
        
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.376, green: 0.369, blue: 0.424, alpha: 0.5)
        view.layer.cornerRadius = 12
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor(red: 0.376, green: 0.369, blue: 0.424, alpha: 1).cgColor
        view.layer.masksToBounds = true
        contentView.addSubview(view)
        
        image = UIImageView()
        view.addSubview(image)
        
        label = UILabel()
        label.font = UIFont(name: "Helvetica-Bold", size: 14)
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        contentView.addSubview(label)
        
        view.snp.makeConstraints{
            $0.top.leading.trailing.equalToSuperview()
        }
        
        image.snp.makeConstraints {
            $0.width.equalTo(view.snp.width)
            $0.height.equalTo(image.snp.width).multipliedBy(1.5)
            $0.edges.equalToSuperview()
        }
        
        label.snp.makeConstraints {
            $0.top.equalTo(view.snp.bottom).inset(-8)
            $0.leading.trailing.bottom.equalToSuperview().inset(8)
        }
    }
}
