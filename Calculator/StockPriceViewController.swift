//
//  StockPriceViewController.swift
//  Calculator
//
//  Created by vinods on 7/17/17.
//  Copyright © 2017 vinods. All rights reserved.
//

import UIKit

class StockPriceViewController: UIViewController,UITextFieldDelegate {
 
 @IBOutlet var textBasePrice: UITextField!
 @IBOutlet var bookValue: UITextField!
 @IBOutlet var numberOfShares: UITextField!
 @IBOutlet var stockPrice: UITextField!
 @IBOutlet var netRevenue: UITextField!
 
 @IBOutlet var errorMessage: UILabel!
 
 
 @IBOutlet var viewBasePrice: UIView!
 
 @IBOutlet var viewRevenue: UIView!
 
 @IBOutlet var viewShares: UIView!
 
 @IBOutlet var viewBookValue: UIView!
 
 @IBOutlet var viewStockPrice: UIView!
 
 @IBOutlet var labelNSYP: UILabel!
 
 @IBOutlet var labelAvgTrade: UILabel!
 
 override func viewDidLoad() {
  super.viewDidLoad()
  
  // Do any additional setup after loading the view.
  initialiseView()
  //     reset(nil)
  
//  moveToNextView()
  
  useEnum()
  
 }
 
 
 
 func useEnum(){
  print(Gender.Male)
  print(Gender.Male.hashValue)
  print(Age.young.rawValue)
  print(Age.young.hashValue)
  
  print(WeekDay.Monday.day())
  
  var str = "abc"
  var fun = { (_ str:String) in
    print(str)
  }
  
  str = "efg"
  fun(str)
  
 }
 
 
 enum Gender{
  case Male
  case Female
 }
 
 enum Age :Int{
  case young = 20
  case adult = 30
 }
 
 enum WeekDay: String{
  
  case Monday
  case Tuesday
  
  func day() -> String{
   return  self.rawValue
  }
  
 }
 
 func viewUISettings(view:UIView){
  view.layer.borderColor = UIColor.black.cgColor
  view.layer.borderWidth = 1.0
 }
 
 func initialiseView()  {
  textBasePrice.delegate = self
  bookValue.delegate = self
  numberOfShares.delegate = self
  netRevenue.delegate = self
  stockPrice.delegate = self
  
  self.viewUISettings(view: self.viewBasePrice)
   self.viewUISettings(view: self.viewBookValue)
   self.viewUISettings(view: self.viewRevenue)
   self.viewUISettings(view: self.viewShares)
   self.viewUISettings(view: self.viewStockPrice)
 
  
  self.addKeyBoardDoneButton()
  
  textBasePrice.addTarget(self, action:#selector(textChanged(textfield:)),for: UIControlEvents.editingDidEnd)
  bookValue.addTarget(self, action:#selector(textChanged(textfield:)),for: UIControlEvents.editingChanged)
  numberOfShares.addTarget(self, action:#selector(textChanged(textfield:)),for: UIControlEvents.editingChanged)
  netRevenue.addTarget(self, action:#selector(textChanged(textfield:)),for: UIControlEvents.editingChanged)
  stockPrice.addTarget(self, action:#selector(textChanged(textfield:)),for: UIControlEvents.editingChanged)
  
  let graph = Graph()
  graph.createGraph()
//  print("point is \(graph.createGraph())")
  
 }
 
 
 func addKeyBoardDoneButton() {
  
  let rect = CGRect(x: 0, y: 0, width: 320, height: 50)
  

  
  let doneToolBar: UIToolbar = UIToolbar.init(frame: rect)
  
  doneToolBar.barStyle = UIBarStyle.blackTranslucent
  
  let flexSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
		
  let done: UIBarButtonItem = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.done, target: self, action:#selector(StockPriceViewController.doneButtonAction))
  done.tintColor = UIColor.white;
  
  let items = NSMutableArray()
  items.add(flexSpace)
  items.add(done)
  
  doneToolBar.items = items as? [UIBarButtonItem]
  doneToolBar.sizeToFit()
  
  self.textBasePrice.inputAccessoryView = doneToolBar
  self.bookValue.inputAccessoryView = doneToolBar
  self.netRevenue.inputAccessoryView = doneToolBar
  self.numberOfShares.inputAccessoryView = doneToolBar
  //   self.textBasePrice.inputAccessoryView = doneToolBar
  
 }
 
 func doneButtonAction() {
  self.textBasePrice.resignFirstResponder()
  self.bookValue.resignFirstResponder()
  self.netRevenue.resignFirstResponder()
  self.numberOfShares.resignFirstResponder()
 }
 
 override func didReceiveMemoryWarning() {
  super.didReceiveMemoryWarning()
  // Dispose of any resources that can be recreated.
 }
 
 @IBAction func reset(_ sender: Any?) {
  
  textBasePrice.text = ""
  bookValue.text = ""
  numberOfShares.text = ""
  stockPrice.text = ""
  netRevenue.text = ""
  labelAvgTrade.text = ""
  labelNSYP.text = ""
  
 }
 
 func validateFields()-> Bool{
  
  var messege:String = ""
		
  if textBasePrice.text!.characters.count == 0 {
   messege = "Enter Base Price"
  }else if netRevenue.text!.characters.count == 0 {
   messege = "Enter revenue"
  }else  if numberOfShares.text!.characters.count == 0 {
   messege = "Enter Number Of Shares"
  }
  else  if bookValue.text!.characters.count == 0 {
   messege = "Enter book value"
  }
  
  
  
  if messege.characters.count>0{
   errorMessage.text = messege
   return false
  }
  
  return true
  
 }
 
 
 @IBAction func calculateStock(_ sender: Any) {
  
  if !self.validateFields(){
   return
  }
  let stockCalulator = StockPriceCalculatorBrain(netRevenue: Double( netRevenue.text!)!,numberOfShares: Double(numberOfShares.text!)!,bookValue: Double(bookValue.text!)!,baseValue:Double(textBasePrice.text!)!)
  
  let tuple:(result:Double,nsyp:Double,trade:Double) = stockCalulator.calculateStockPrice()
		
  stockPrice.text = String(tuple.result.rounded())
  
  labelNSYP.text = String(tuple.nsyp.rounded())
 labelAvgTrade.text = String (tuple.trade.rounded())
  
  moveToNextView()
 }
 
 func moveToNextView() {
  
  let nextView: TableViewController = TableViewController(nibName: "TableViewController", bundle: nil)
  
  self.navigationController?.pushViewController(nextView, animated: true)
  
 }
 
 func textFieldShouldReturn(_ textField: UITextField) -> Bool {
  textField.resignFirstResponder()
  return true
  
 }
 
 func textChanged(textfield:UITextField) {
  //  let str:String = textfield.text!
  //  if str.isEmpty{
  //   textfield.text = "0"
  //  }
  //  else if Double(str)==0{
  //
  //  }
 }
 
 /*
  // MARK: - Navigation
  
  // In a storyboard-based application, you will often want to do a little preparation before navigation
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
  // Get the new view controller using segue.destinationViewController.
  // Pass the selected object to the new view controller.
  }
  */
 
}
