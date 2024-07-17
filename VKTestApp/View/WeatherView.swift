//
//  WeatherView.swift
//  VKTestApp
//
//  Created by Sergio Mascarpone on 16.07.24.
//

import UIKit

class WeatherView: UIView {
    
    var weatherType: WeatherType = .storm {
        didSet {
            updateView()
        }
    }
    
    private let animationLayer = CALayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        layer.addSublayer(animationLayer)
        animationLayer.frame = bounds
    }
    
    private func updateView() {
        animationLayer.sublayers?.forEach { $0.removeFromSuperlayer() }
        
        switch weatherType {
        case .clear:
            addClearAnimation()
        case .rain:
            addRainAnimation()
        case .storm:
            addStormAnimation()
        case .fog:
            addFogAnimation()
        }
    }
    
    private func addClearAnimation() {
        // Example: Add sun animation
        let sunLayer = CAEmitterLayer()
        //        let sunSize = CGSize(width: 100, height: 100)
        //        sunLayer.frame = CGRect(
        //            x: (bounds.width-sunSize.width) / 2,
        //            y: (bounds.height - sunSize.height) / 2,
        //            width: sunSize.width,
        //            height: sunSize.height
        //        )
//        sunLayer.emitterShape = .circle
        sunLayer.emitterPosition = CGPoint(x: bounds.midX, y: bounds.midY)
        //sunLayer.emitterSize = CGSize(width: bounds.width, height: 1)
        
        let sunCell = CAEmitterCell()
        sunCell.birthRate = 10
        sunCell.lifetime = 10.0
        sunCell.velocity = 250
        sunCell.scale = 0.1
        sunCell.emissionRange = .pi
        sunCell.contents = UIImage(named: "sunImage")?.cgImage
        
        sunLayer.emitterCells = [sunCell]
        animationLayer.addSublayer(sunLayer)
    }
    
    private func addRainAnimation() {
        // Example: Add rain animation
        let rainLayer = CAEmitterLayer()
//        rainLayer.emitterShape = .circle
        rainLayer.emitterPosition = CGPoint(x: bounds.midX, y: bounds.midY)
        //        rainLayer.emitterSize = CGSize(width: bounds.width, height: 1)
        
        let rainCell = CAEmitterCell()
        rainCell.birthRate = 10
        rainCell.lifetime = 10.0
        rainCell.velocity = 250
        rainCell.scale = 0.1
        rainCell.emissionRange = .pi
        rainCell.contents = UIImage(named: "rainDrop")?.cgImage
        
        rainLayer.emitterCells = [rainCell]
        animationLayer.addSublayer(rainLayer)
    }
    
    private func addStormAnimation() {
        // Example: Add storm animation with rain and lightning
        let lightningLayer = CAEmitterLayer()
//        lightningLayer.emitterShape = .circle
        lightningLayer.emitterPosition = CGPoint(x: bounds.midX, y: bounds.midY)
        //        lightningLayer.emitterSize = CGSize(width: bounds.width, height: 1)
        
        let lightningCell = CAEmitterCell()
        lightningCell.birthRate = 10
        lightningCell.lifetime = 10.0
        lightningCell.velocity = 250
        lightningCell.scale = 0.1
        lightningCell.emissionRange = .pi
        lightningCell.contents = UIImage(named: "lightning")?.cgImage
        
        lightningLayer.emitterCells = [lightningCell]
        animationLayer.addSublayer(lightningLayer)
    }
    
    private func addFogAnimation() {
        // Example: Add fog animation
        let fogLayer = CAEmitterLayer()
//        fogLayer.emitterShape = .circle
        fogLayer.emitterPosition = CGPoint(x: bounds.midX, y: bounds.midY)
        //        fogLayer.emitterSize = CGSize(width: bounds.width, height: 1)
        
        let fogLayerCell = CAEmitterCell()
        fogLayerCell.birthRate = 10
        fogLayerCell.lifetime = 10.0
        fogLayerCell.velocity = 250
        fogLayerCell.scale = 0.1
        fogLayerCell.emissionRange = .pi
        fogLayerCell.contents = UIImage(named: "fogImage")?.cgImage
        
        fogLayer.emitterCells = [fogLayerCell]
        animationLayer.addSublayer(fogLayer)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        animationLayer.frame = frame
    }
}
