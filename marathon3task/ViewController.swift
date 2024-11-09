//
//  ViewController.swift
//  marathon3task
//
//  Created by Vika on 07.11.24.
//

import UIKit

class ViewController: UIViewController {
    
    private var squareView = UIView()
    private let slider = UISlider()
    private let rightPadding: CGFloat = 25
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupView()
    }
    
    func setupView() {

        squareView = GradientSquareView()
//        squareView.backgroundColor = .systemBlue
//        squareView.layer.cornerRadius = 12
        squareView.translatesAutoresizingMaskIntoConstraints = false
 
        slider.minimumValue = 0
        slider.maximumValue = 1
        slider.value = 0
        slider.minimumTrackTintColor = .systemPink
        slider.thumbTintColor = .systemPink
        slider.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(squareView)
        view.addSubview(slider)
        
        NSLayoutConstraint.activate([

            squareView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            squareView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 100),
            squareView.widthAnchor.constraint(equalToConstant: 100),
            squareView.heightAnchor.constraint(equalToConstant: 100),
            
            slider.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            slider.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            slider.topAnchor.constraint(equalTo: squareView.layoutMarginsGuide.topAnchor, constant: 150)
        ])
        
        slider.addTarget(self, action: #selector(sliderValueChanged(_:)), for: .valueChanged)
        slider.addTarget(self, action: #selector(sliderReleased(_:)), for: [.touchUpInside, .touchUpOutside])
    }
    
    @objc func sliderValueChanged(_ sender: UISlider) {
        let progress = CGFloat(sender.value)
        
        let finalX = view.bounds.width - view.layoutMargins.right - squareView.bounds.width - rightPadding
        let startX = view.layoutMargins.left
        
        // текущая позиция X, вращения и масштаба
        let currentX = startX + (finalX - startX) * progress
        let rotationAngle = CGFloat.pi / 2 * progress
        let scale = 1.0 + 0.5 * progress
        
        squareView.transform = CGAffineTransform.identity
            .translatedBy(x: currentX - startX, y: 0)
            .rotated(by: rotationAngle)
            .scaledBy(x: scale, y: scale)
    }

    @objc func sliderReleased(_ sender: UISlider) {
        UIView.animate(withDuration: 0.5) {
            sender.value = 1.0
            
            let finalX = self.view.bounds.width - self.view.layoutMargins.right - self.squareView.bounds.width - self.rightPadding
            self.squareView.transform = CGAffineTransform.identity
                .translatedBy(x: finalX - self.view.layoutMargins.left, y: 0)
                .rotated(by: .pi / 2)
                .scaledBy(x: 1.5, y: 1.5)
        }
    }
}
