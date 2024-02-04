//
//  NavigationBarController.swift
//  Movies
//
//  Created by Nikita Melnikov on 03.02.2024.
//

import Foundation
import UIKit

class NavigationBarController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
}

private extension NavigationBarController {
    
    func setupView() {
        view.backgroundColor = D.Colors.mainBackgroundColor
        navigationBar.isHidden = true
    }
}
