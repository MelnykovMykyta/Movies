//
//  Haptic.swift
//  Movies
//
//  Created by Nikita Melnikov on 04.02.2024.
//

import Foundation
import UIKit

class Haptic {
    
    static func getHaptic() {
        let haptic = UIImpactFeedbackGenerator(style: .medium)
        haptic.impactOccurred()
    }
}
