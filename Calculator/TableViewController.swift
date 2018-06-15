//
//  TableViewController.swift
//  Calculator
//
//  Created by vinods on 1/29/18.
//  Copyright © 2018 vinods. All rights reserved.
//

import UIKit

class TableViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

 @IBOutlet var tableView: UITableView!
 
 let arrayTexts = ["ajshksdfkjsdhfkj","sdkfsfkslflsdfjksdf","sdkfsfkslflsdfjksdfsdkfsfkslflsdfjksdfsdkfsfkslflsdfjksdfsdkfsfkslflsdfjksdf"]
 
    override func viewDidLoad() {
     super.viewDidLoad()

     tableView.register(UINib.init(nibName: DifferentTableViewCell.reuseIdentifier, bundle: nil), forCellReuseIdentifier: DifferentTableViewCell.reuseIdentifier)
     

    }
 
 
// func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//  switch indexPath.row {
//  case 1:
//   return 60
//  default:
//   return UITableViewAutomaticDimension
//  }
// }

 func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
  return arrayTexts.count
 }
 
 func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
  
  let cellCustom: DifferentTableViewCell = tableView.dequeueReusableCell(withIdentifier: DifferentTableViewCell.reuseIdentifier, for: indexPath) as! DifferentTableViewCell
  
  cellCustom.customLabel.text = arrayTexts[indexPath.row]
  
  return cellCustom
 }
 
     override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
 

}
