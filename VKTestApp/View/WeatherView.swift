//
//  WeatherView.swift
//  VKTestApp
//
//  Created by Sergio Mascarpone on 16.07.24.
//

import UIKit

class WeatherView: UIView {
    
    var weatherType: WeatherType = .wind {
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
        case .wind:
            addWindAnimation()
        case .fog:
            addFogAnimation()
        case .snow:
            addSnowAnimation()
        case .cloudy:
            addCloudyAnimation()
        case .storm:
            addStormAnimation()
        }
    }
    
    //MARK: Weather Animation
    private func addClearAnimation() {
        // Example: Add sun animation
        let sunLayer = CAEmitterLayer()
        sunLayer.emitterPosition = CGPoint(x: bounds.midX, y: bounds.midY)
        //sunLayer.emitterSize = CGSize(width: bounds.width, height: 1)
        
        let sunCell = CAEmitterCell()
        sunCell.birthRate = 10
        sunCell.lifetime = 10.0
        sunCell.velocity = 250
        sunCell.scale = 0.1
        sunCell.emissionRange = .pi
        sunCell.contents = UIImage(named: "sunImg")?.cgImage
        
        sunLayer.emitterCells = [sunCell]
        animationLayer.addSublayer(sunLayer)
    }
    
    private func addRainAnimation() {
        // Example: Add rain animation
        let rainLayer = CAEmitterLayer()
        rainLayer.emitterPosition = CGPoint(x: bounds.midX, y: bounds.midY)
        
        let rainCell = CAEmitterCell()
        rainCell.birthRate = 10
        rainCell.lifetime = 10.0
        rainCell.velocity = 250
        rainCell.scale = 0.1
        rainCell.emissionRange = .pi
        rainCell.contents = UIImage(named: "rainDropImg")?.cgImage
        
        rainLayer.emitterCells = [rainCell]
        animationLayer.addSublayer(rainLayer)
    }
    
    private func addWindAnimation() {
        // Example: Add storm animation with rain and lightning
        let lightningLayer = CAEmitterLayer()
        //lightningLayer.emitterShape = .circle
        lightningLayer.emitterPosition = CGPoint(x: bounds.midX, y: bounds.midY)
        
        let lightningCell = CAEmitterCell()
        lightningCell.birthRate = 10
        lightningCell.lifetime = 10.0
        lightningCell.velocity = 250
        lightningCell.scale = 0.1
        lightningCell.emissionRange = .pi
        lightningCell.contents = UIImage(named: "windImg")?.cgImage
        
        lightningLayer.emitterCells = [lightningCell]
        animationLayer.addSublayer(lightningLayer)
    }
    
    private func addFogAnimation() {
        // Example: Add fog animation
        let fogLayer = CAEmitterLayer()
        //fogLayer.emitterShape = .circle
        fogLayer.emitterPosition = CGPoint(x: bounds.midX, y: bounds.midY)
        //fogLayer.emitterSize = CGSize(width: bounds.width, height: 1)
        
        let fogLayerCell = CAEmitterCell()
        fogLayerCell.birthRate = 10
        fogLayerCell.lifetime = 10.0
        fogLayerCell.velocity = 250
        fogLayerCell.scale = 0.1
        fogLayerCell.emissionRange = .pi
        fogLayerCell.contents = UIImage(named: "fogImg")?.cgImage
        
        fogLayer.emitterCells = [fogLayerCell]
        animationLayer.addSublayer(fogLayer)
    }
    
    private func addSnowAnimation() {
        // Example: Add snow animation
        let snowLayer = CAEmitterLayer()
        snowLayer.emitterPosition = CGPoint(x: bounds.midX, y: bounds.midY)
        
        let snowCell = CAEmitterCell()
        snowCell.birthRate = 10
        snowCell.lifetime = 10.0
        snowCell.velocity = 250
        snowCell.scale = 0.1
        snowCell.emissionRange = .pi
        snowCell.contents = UIImage(named: "snowImg")?.cgImage
        
        snowLayer.emitterCells = [snowCell]
        animationLayer.addSublayer(snowLayer)
    }
    
    private func addCloudyAnimation() {
        // Example: Add cloudy animation
        let cloudyLayer = CAEmitterLayer()
        cloudyLayer.emitterPosition = CGPoint(x: bounds.midX, y: bounds.midY)
        
        let cloudyCell = CAEmitterCell()
        cloudyCell.birthRate = 10
        cloudyCell.lifetime = 10.0
        cloudyCell.velocity = 250
        cloudyCell.scale = 0.1
        cloudyCell.emissionRange = .pi
        cloudyCell.contents = UIImage(named: "cloudyImg")?.cgImage
        
        cloudyLayer.emitterCells = [cloudyCell]
        animationLayer.addSublayer(cloudyLayer)
    }
    
    private func addStormAnimation() {
        // Example: Add storm animation
        let stormLayer = CAEmitterLayer()
        stormLayer.emitterPosition = CGPoint(x: bounds.midX, y: bounds.midY)
        
        let stormCell = CAEmitterCell()
        stormCell.birthRate = 10
        stormCell.lifetime = 10.0
        stormCell.velocity = 250
        stormCell.scale = 0.1
        stormCell.emissionRange = .pi
        stormCell.contents = UIImage(named: "stormImg")?.cgImage
        
        stormLayer.emitterCells = [stormCell]
        animationLayer.addSublayer(stormLayer)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        animationLayer.frame = frame
    }
}
