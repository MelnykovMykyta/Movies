//
//  AnimationVC.swift
//  Movies
//
//  Created by Nikita Melnikov on 02.02.2024.
//

import Foundation
import UIKit
import SnapKit
import Lottie

class AnimationVC: UIViewController {
    
    private var animatedView: LottieAnimationView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        animatedView.play() { _ in
            VCChanger.changeVC(vc: NavigationTabBarController())
        }
    }
}

private extension AnimationVC {
    
    func setupView() {
        view.backgroundColor = D.Colors.mainBackgroundColor
        
        animatedView = LottieAnimationView(name: "MoviesAnimation")
        animatedView.animationSpeed = 2
        animatedView.contentMode = .scaleAspectFit
        view.addSubview(animatedView)
        
        animatedView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.horizontalEdges.equalToSuperview()
        }
    }
}
