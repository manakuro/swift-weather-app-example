//
//  WeatherListTableViewController.swift
//  Weather
//
//  Copyright © 2020 manato. All rights reserved.
//

import Foundation
import UIKit


class WeatherListTableViewController: UITableViewController {
  private var weatherListViewModel = WeatherListViewModel()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.navigationController?.navigationBar.prefersLargeTitles = true
  }
  
  override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    100
  }
  
  override func numberOfSections(in tableView: UITableView) -> Int {
    1
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    self.weatherListViewModel.numberOfRows(section)
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherCell", for: indexPath) as! WeatherCell
    let vm = self.weatherListViewModel.modelAt(indexPath.row)
    
    cell.configure(vm)
    
    return cell
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "AddWeatherCityViewController" {
      prepareSegueForAddWeatherCityViewController(segue: segue)
    } else if segue.identifier == "SettingsTableViewController" {
      prepareSegueForSettingsTableViewController(segue: segue)
    }
  }
  
  private func prepareSegueForAddWeatherCityViewController(segue: UIStoryboardSegue) {
    guard let nav = segue.destination as? UINavigationController else {
      fatalError("NAV NOT FOUND")
    }
    
    guard let vc = nav.viewControllers.first as? AddWeatherCityViewController else {
      fatalError("AddWeatherCityViewController NOT FOUND")
    }
    
    vc.delegate = self
  }
  
  private func prepareSegueForSettingsTableViewController(segue: UIStoryboardSegue) {
    guard let nav = segue.destination as? UINavigationController else {
      fatalError("NAV NOT FOUND")
    }
    
    guard let vc = nav.viewControllers.first as? SettingsTableViewController else {
      fatalError("SettingsTableViewController NOT FOUND")
    }
    
    vc.delegate = self
  }
}

extension WeatherListTableViewController: AddWeatherDelegate {
  func addWeatherDidSave(vm: WeatherViewModel) {
    self.weatherListViewModel.set(vm)
    self.tableView.reloadData()
  }
}


extension WeatherListTableViewController: SettingsDelegate {
  func settingsDone(vm: SettingsViewModel) {
    self.weatherListViewModel.updateUnit(to: vm.selectedUnit)
    self.tableView.reloadData()
  }
}
