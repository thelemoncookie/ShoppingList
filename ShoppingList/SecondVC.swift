//
//  SecondVC.swift
//  ShoppingList
//
//  Created by Darlene Phan on 5/1/16.
//  Copyright © 2016 Darlene Phan. All rights reserved.
//

import Foundation
import UIKit

class SecondVC: UIViewController, UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate {
  
  @IBOutlet weak var textField1: UITextField!
  @IBOutlet weak var textField2: UITextField!
  
  @IBOutlet weak var tableView: UITableView!
  
  //Data Variables
  var items:[[String:String]]?
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    guard let items = items else {
      return 0
    }
    return items.count
  }
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    guard let items = items else {
      return UITableViewCell()
    }
    guard let cell = tableView.dequeueReusableCellWithIdentifier("SecondVCTableViewCell", forIndexPath: indexPath) as? SecondVCTableViewCell else {
    return UITableViewCell()
    }
    let dictionary = items[indexPath.row]
    let key = dictionary.keys.first!
    cell.label1.text = key
    cell.label2.text = dictionary[key]
    return cell
  }
  
  func textFieldShouldReturn(textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    return true
  }
  
  func textFieldDidEndEditing(textField: UITextField) {
    guard textField1.text?.characters.count > 0 else {
      return
    }
    guard textField2.text?.characters.count > 0 else{
      return
    }
    items?.append([textField1.text!: textField2.text!])
    tableView.reloadData()
    textField1.text = ""
    textField2.text = ""

  }
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    title = "Dictionary"
    items = [[String:String]]()
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
}
