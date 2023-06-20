//
//  CALayer+Extensions.swift
//  iOS10-HW11-Alexandr-Ivanov
//
//  Created by Александр Иванов on 15.06.2023.
//

import UIKit

extension CALayer {
    func addShadows() {
        self.shadowColor = UIColor.black.cgColor
        self.shadowOpacity = 0.2
        self.shadowOffset = CGSize(width: 0, height: 7)
        self.shadowRadius = 10
        self.shouldRasterize = true
        self.rasterizationScale = UIScreen.main.scale
    }
}
