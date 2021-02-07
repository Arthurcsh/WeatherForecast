//
//  WeatherViewController.swift
//  Weather Forecast
//
//  Created by Shcheng on 2021/2/6.
//  Copyright © 2021 VolvoCar. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {
    // Gothenburg,Stockholm,Mountain View,London,New York,Berlin
    let cities = [890869,906057,2455920,44418,2459115,638242]
    let weekDays = 6
    var tableView: UITableView!
    var weathers: [MetaWeatherModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initWeatherView()
    }
    
}


/**
 * pragma mark - Extensions
 */
extension WeatherViewController {
    func initWeatherView() {
        tableView = UITableView.Builder().withDataSource(self).withDelegate(self).withEstimatedRowHeight(100).build()
        tableView.register(WeatherTableViewCell.self, forCellReuseIdentifier: String(describing: WeatherTableViewCell.self))
        self.view.addSubview(tableView)
        tableView.fillToSuperView()
        
        for cityId in cities {
            autoreleasepool {
                let api = MetaWetherWoeidAPI(woeid: cityId)
                requestWeatherData(api)
            }
        }
    }
}

extension WeatherViewController: UITableViewDelegate {
    func requestWeatherData(_ api: MetaWetherWoeidAPI) {
        Networking.shared.requestMetaService(MetaWeatherModel.self, url: api.url) { [weak self] (result) in
            switch result {
            case .error:
                print("ERROR: \(result)")
            case .success(let decoded):
//                self?.weathers.append(decoded)
                self?.weathers.insert(decoded, at: 0)
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            }
        }
    }
}

extension WeatherViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard weathers.count > section else {
            return nil
        }
        return weathers[section].title
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return weathers.count > 0 ? weathers.count : 0
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard weathers.count > section else {
            return 0
        }
//        return weathers[section].consolidated_weather.count
        return 2  // retain Today & Tomorrow weather information
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: WeatherTableViewCell.self), for: indexPath) as? WeatherTableViewCell else {
            fatalError("meta response fail to cast")
        }
         let item = weathers[indexPath.section].consolidated_weather[indexPath.row]
        cell.item = item
        
        return cell
    }
    
}
