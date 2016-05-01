//
//  ViewController.swift
//  ShoppingList
//
//  Created by Darlene Phan on 5/1/16.
//  Copyright © 2016 Darlene Phan. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
  
  var items = [String]()
  
  @IBOutlet weak var textField: UITextField!
  
  @IBOutlet weak var button: UIButton!
  
  @IBOutlet weak var tableView: UITableView!
  
  
  @IBAction func addButton(sender: UIButton) {
    let newItem = textField.text
    items.append(newItem!)
    tableView.reloadData()
    textField.resignFirstResponder()
    textField.text = ""
    
  }
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return items.count
  }//end numberOfRowsInSection
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
    cell.textLabel?.text = items[indexPath.row]
    return cell
  }//end cellForRowAtIndexPath
  
  func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    let selectedRow = tableView.cellForRowAtIndexPath(indexPath)!
    if selectedRow.accessoryType == UITableViewCellAccessoryType.None {
      selectedRow.accessoryType = UITableViewCellAccessoryType.Checkmark
      selectedRow.tintColor = UIColor.greenColor()
    }
    else {
      selectedRow.accessoryType = UITableViewCellAccessoryType.None
    }//end if else statement
  }//end didSelectRowFunc
  
  func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
    let deleteRow:UITableViewCell = tableView.cellForRowAtIndexPath(indexPath)!
    if editingStyle == UITableViewCellEditingStyle.Delete {
      items.removeAtIndex(indexPath.row)
      tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
      deleteRow.accessoryType = UITableViewCellAccessoryType.None
    }//end if statement
  }//end commitEditingStyle func
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}





















