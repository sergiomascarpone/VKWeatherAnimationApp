//
//  ViewController.swift
//  VKTestApp
//
//  Created by Sergio Mascarpone on 16.07.24.
//

import UIKit

class WeatherViewController: UIViewController {
    
    let viewModel = WeatherViewModel()
    var weatherView = WeatherView()
    var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupCollectionView()
        setupWeatherView()
        displayRandomWeather()
    }
    
    private func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 100, height: 50)
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(WeatherCell.self, forCellWithReuseIdentifier: WeatherCell.reuseIdentifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    private func setupWeatherView() {
        weatherView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(weatherView)
        NSLayoutConstraint.activate([
            weatherView.topAnchor.constraint(equalTo: collectionView.bottomAnchor),
            weatherView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            weatherView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            weatherView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func displayRandomWeather() {
        let randomWeather = viewModel.getRandomWeather()
        weatherView.weatherType = randomWeather.type
    }
}

extension WeatherViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.weathers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WeatherCell.reuseIdentifier, for: indexPath) as! WeatherCell
        let weather = viewModel.weathers[indexPath.item]
        cell.configure(with: weather)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedWeather = viewModel.weathers[indexPath.item]
        UIView.transition(with: weatherView, duration: 0.5, options: .transitionCrossDissolve, animations: {
            self.weatherView.weatherType = selectedWeather.type
        }, completion: nil)
    }
}


//import UIKit
//
//class WeatherAnimationViewController: UIViewController {
//    
//    var collectionView: UICollectionView!
//    let layout = UICollectionViewFlowLayout()
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        setupCollectionView()
//        
//    }
//    
//    func setupCollectionView() {
//        
//        view.backgroundColor = .systemBackground
//        layout.scrollDirection = .horizontal
//        layout.minimumInteritemSpacing = 10
//        layout.minimumLineSpacing = 20
//        
//        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
//        collectionView.backgroundColor = .cyan
//        collectionView.dataSource = self
//        collectionView.register(WeatherCell.self, forCellWithReuseIdentifier: "WeatherCell")
//        collectionView.register(UICollectionView.self, forCellWithReuseIdentifier: "DefaultCell")
//        collectionView.translatesAutoresizingMaskIntoConstraints = false
//        self.view.addSubview(collectionView)
//        
//        
//        NSLayoutConstraint.activate([
//            collectionView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
//            collectionView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
//            collectionView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
//            collectionView.heightAnchor.constraint(equalToConstant: 100)
//        ])
//        
//    }
//}
//
//extension WeatherAnimationViewController: UICollectionViewDataSource {
//    
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        8
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WeatherCell", for: indexPath) as? WeatherCell
//        else {
//            return collectionView.dequeueReusableCell(withReuseIdentifier: "DefaultCell", for: indexPath)
//        }
//        
//        cell.setup()
//        return cell
//    }
//}

