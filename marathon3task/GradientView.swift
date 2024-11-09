//
//  GradientView.swift
//  marathon3task
//
//  Created by Vika on 09.11.24.
//

import UIKit

class GradientSquareView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    private func setupView() {
        // Настройка градиента
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.yellow.cgColor, UIColor.systemPink.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0) // верхний левый угол
        gradientLayer.endPoint = CGPoint(x: 1, y: 1) // нижний правый угол
        gradientLayer.frame = bounds
        gradientLayer.cornerRadius = 10
        layer.insertSublayer(gradientLayer, at: 0)

        // Настройка тени
        layer.shadowColor = UIColor.systemPink.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: 5, height: 5)
        layer.shadowRadius = 10
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.sublayers?.first?.frame = bounds
    }
}

