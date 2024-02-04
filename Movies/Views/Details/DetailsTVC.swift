//
//  DetailsTVC.swift
//  Movies
//
//  Created by Nikita Melnikov on 04.02.2024.
//

import Foundation
import UIKit
import SnapKit

class DetailsTVC: UITableViewCell {
    
    var title: UILabel!
    var yearLabel: UILabel!
    var voteLabel: UILabel!
    var desc: UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

private extension DetailsTVC {
    
    func setupView() {
        
        backgroundColor = .clear
        
        title = UILabel()
        title.font = UIFont(name: "Helvetica-Bold", size: 32)
        title.textAlignment = .center
        title.adjustsFontSizeToFitWidth = true
        title.numberOfLines = 2
        addSubview(title)
        
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.distribution = .fillEqually
        sv.spacing = 8
        sv.alignment = .center
        addSubview(sv)
        
        yearLabel = UILabel()
        voteLabel = UILabel()
        
        [yearLabel, voteLabel].forEach { label in
            label.font = UIFont(name: "Helvetica-Bold", size: 24)
            label.textAlignment = .center
            label.adjustsFontSizeToFitWidth = true
            sv.addArrangedSubview(label)
        }
        
        let descSV = UIStackView()
        descSV.axis = .horizontal
        descSV.distribution = .fillEqually
        descSV.spacing = 8
        descSV.alignment = .center
        addSubview(descSV)
        
        [D.Texts.yearText, D.Texts.voteText].forEach { text in
            let label = UILabel()
            label.text = text
            label.font = UIFont(name: "Helvetica", size: 14)
            label.textAlignment = .center
            label.adjustsFontSizeToFitWidth = true
            descSV.addArrangedSubview(label)
        }
        
        desc = UILabel()
        desc.font = UIFont(name: "Helvetica-Light", size: 18)
        desc.textAlignment = .justified
        desc.numberOfLines = 0
        addSubview(desc)
        
        title.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview().inset(20)
        }
        
        sv.snp.makeConstraints {
            $0.top.equalTo(title.snp.bottom).inset(-20)
            $0.leading.trailing.equalToSuperview().inset(20)
        }
        
        descSV.snp.makeConstraints {
            $0.top.equalTo(sv.snp.bottom)
            $0.leading.trailing.equalToSuperview().inset(20)
        }
        
        desc.snp.makeConstraints {
            $0.top.equalTo(descSV.snp.bottom).inset(-20)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.bottom.equalToSuperview().inset(40)
        }
    }
}
