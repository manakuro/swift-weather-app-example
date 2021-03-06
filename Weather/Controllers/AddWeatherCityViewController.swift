//
//  AddWeatherCityViewController.swift
//  Weather
//
//  Copyright © 2020 manato. All rights reserved.
//

import Foundation
import UIKit

protocol AddWeatherDelegate {
  func addWeatherDidSave(vm: WeatherViewModel)
}

class AddWeatherCityViewController: UIViewController {
  var delegate: AddWeatherDelegate?
  private var addCityViewModel = AddCityViewModel()
  
  @IBOutlet weak var cityNameTextField: BindingTextField! {
    didSet {
      self.cityNameTextField.bind {
        self.addCityViewModel.city = $0
      }
    }
  }
  @IBOutlet weak var stateTextField: BindingTextField! {
    didSet {
      self.stateTextField.bind {
        self.addCityViewModel.state = $0
      }
    }
  }
  
  @IBOutlet weak var zipCodeTextField: BindingTextField! {
    didSet {
      self.zipCodeTextField.bind {
        self.addCityViewModel.zipCode = $0
      }
    }
  }
  
  @IBAction func saveCityButtonPressed() {
    if let city = cityNameTextField.text {
      let url = URL(string: "\(Environment.API_URL)&q=\(city)")!
      
      let resource = Resource<Weather>(url: url) { data in
        guard let data = try? JSONDecoder().decode(Weather.self, from: data) else {
          print("DEOCDE FAILED")
          return nil
        }
        return data
      }
      
      Webservice().load(resource: resource) { [weak self] result in
        let vm = WeatherViewModel(model: result)
        
        guard let delegate = self?.delegate else { return }
        
        delegate.addWeatherDidSave(vm: vm)
        self?.dismiss(animated: true)
      }
    }
  }
  
  @IBAction func close() {
    self.dismiss(animated: true)
  }
}
