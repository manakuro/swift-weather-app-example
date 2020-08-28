//
//  WeatherListTableViewController.swift
//  Weather
//
//  Copyright © 2020 manato. All rights reserved.
//

import Foundation
import UIKit


class WeatherListTableViewController: UITableViewController, AddWeatherDelegate {
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
    guard let nav = segue.destination as? UINavigationController else {
      fatalError("NAV NOT FOUND")
    }
    
    guard let addWeatherCityVC = nav.viewControllers.first as? AddWeatherCityViewController else {
      fatalError("AddWeatherCityViewController NOT FOUND")
    }
    
    addWeatherCityVC.delegate = self
  }
  
  func addWeatherDidSave(vm: WeatherViewModel) {
    self.weatherListViewModel.set(vm)
    self.tableView.reloadData()
  }
}
