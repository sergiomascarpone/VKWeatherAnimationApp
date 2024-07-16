//
//  WeatherView.swift
//  VKTestApp
//
//  Created by Sergio Mascarpone on 16.07.24.
//

import UIKit

class WeatherView: UIView {
    
    var weatherType: WeatherType = .clear {
        didSet {
            updateView()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        backgroundColor = .blue // Начальный цвет, который будет заменен в зависимости от типа погоды
    }
    
    private func updateView() {
        switch weatherType {
        case .clear:
            backgroundColor = .blue
        case .rain:
            backgroundColor = .gray
        case .storm:
            backgroundColor = .darkGray
        case .fog:
            backgroundColor = .lightGray
        }
    }
}
