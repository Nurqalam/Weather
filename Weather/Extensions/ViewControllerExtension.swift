//
//  ViewControllerExtension.swift
//  Weather
//
//  Created by Nurqalam on 25.03.2022.
//

import UIKit


extension MainViewController {
    
    func presentSearchAlertController(withTitle: String?,
                                      message: String?,
                                      style: UIAlertController.Style,
                                      completionHandler: @escaping (String) -> Void) {
        let alert = UIAlertController(title: "Enter city name", message: nil, preferredStyle: .alert)
        alert.addTextField { (tf) in
            let cities = ["Almaty", "Astana"]
            tf.placeholder = cities.randomElement()
        }
        
        let search = UIAlertAction(title: "Search", style: .default) { (action) in
            let textField = alert.textFields?.first
            guard let cityName = textField?.text else {return}
            if cityName != "" {
                let city = cityName.split(separator: " ").joined(separator: "%20")
                completionHandler(city)
            }
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        
        alert.addAction(search)
        alert.addAction(cancel)
        present(alert, animated: true, completion: nil)
        
    }
}


extension MainViewController {
    
    func mapRounded() {
        searchButton.layer.masksToBounds = false
        searchButton.layer.cornerRadius = searchButton.frame.self.height / 2
        searchButton.clipsToBounds = true
    }
    
}
