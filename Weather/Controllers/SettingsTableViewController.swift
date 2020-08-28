//
//  SettingsTableViewController.swift
//  Weather
//
//  Copyright © 2020 manato. All rights reserved.
//

import Foundation
import UIKit


protocol SettingsDelegate {
  func settingsDone(vm: SettingsViewModel)
}

class SettingsTableViewController: UITableViewController {
  private var settingsViewModel = SettingsViewModel()
  var delegate: SettingsDelegate?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.navigationController?.navigationBar.prefersLargeTitles = true
  }
  
  override func numberOfSections(in tableView: UITableView) -> Int {
    1
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    self.settingsViewModel.units.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let vm = self.settingsViewModel.units[indexPath.row]
    let cell = tableView.dequeueReusableCell(withIdentifier: "SettingsCell", for: indexPath)
    
    cell.textLabel?.text = vm.displayName
    
    if vm == self.settingsViewModel.selectedUnit {
      cell.accessoryType = .checkmark
    }
    
    return cell
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.visibleCells.forEach { $0.accessoryType = .none }
    
    if let cell = tableView.cellForRow(at: indexPath) {
      cell.accessoryType = .checkmark
      
      let unit = Unit.allCases[indexPath.row]
      self.settingsViewModel.selectedUnit = unit
    }
  }
  
  override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
    if let cell = tableView.cellForRow(at: indexPath) {
      cell.accessoryType = .none
    }
  }
  
  @IBAction func done() {
    if let delegate = self.delegate {
      delegate.settingsDone(vm: self.settingsViewModel)
    }
    
    self.dismiss(animated: true)
  }
  
}
