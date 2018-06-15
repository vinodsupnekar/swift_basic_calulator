//
//  ViewController.swift
//  Calculator
//
//  Created by vinods on 7/12/17.
//  Copyright © 2017 vinods. All rights reserved.
//

import UIKit

class Music { }
class Pop: Music { }
class Rock: Music { }


class ViewController: UIViewController {
 
 @IBOutlet private weak var display: UILabel!
 @IBOutlet private weak var imageView: UIImageView!
 
 private var userInMiddleOfTyping = false
 
 @IBAction private func touchAllDigits(_ sender: UIButton) {
  
  let digit = sender.currentTitle!
  
  if userInMiddleOfTyping {
   let textCurrentDisplay = display.text!
   display.text = textCurrentDisplay + digit
   
  }else{
   
   display.text = digit
  }
  userInMiddleOfTyping = true
  
//  reverse()
  
  imageDraw()
  
 }
 
 
 func imageDraw()  {
  
  let color = UIColor.red
  let size = CGSize(width: 200, height: 200)
  
  UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
  UIGraphicsGetCurrentContext()!.setFillColor(color.cgColor)
  UIGraphicsGetCurrentContext()!.fill(CGRect(origin: .zero, size: size))
  let colorImage = UIGraphicsGetImageFromCurrentImageContext()
  
  imageView.image = colorImage
  UIGraphicsEndImageContext()
  
 }
 
 
 func reverse()  {
  
  
  class Music { }
  class Pop: Music { }
  class Rock: Music { }
  
  Pop() as Music // OK, some might disagree but Music *is* a super class of Pop
  Pop() as? Rock  // Compile error: 'Pop' is not convertable to 'Rock'
  
  let pop: AnyObject = Pop()
  
//  pop as Music // Compile error: 'AnyObject' is not convertible to 'Music'
  

 let c =  pop as? Music // Pop
 let vv = pop as! Music // Pop
  
  pop as? Rock // nil
//  pop as! Rock // Runtime error signal SIGABRT
 
  var a:String  = "Hello"
  var b:String  = "World"
  
  a = a + b
  let index1=a.index(a.startIndex, offsetBy:a.count-b.count)
   // store initial string b in string a
  
  b = a.substring(to: index1)
  
  let index=a.index(a.startIndex, offsetBy:b.count)
  // store intial string a in string b
  
  a = a.substring(from:index)
  
  // print String after swapping
  
  print(a)
  
  print(b)

 }
 
 private var  displayValue: Double{
  
  get{
   return Double (display.text!)!
  }
  set{
   display.text = String(newValue)
  }
  
 }
 
 private var brain = CalculatorBrain()
 
 @IBAction private func performOperation(_ sender: UIButton) {
 
  if userInMiddleOfTyping{
   brain.setOperand( displayValue)
   userInMiddleOfTyping = false
  }
  
  if let mathematicalSymbol = sender.currentTitle{
   brain.performOperation( mathematicalSymbol)
   displayValue = brain.result
  }
 }
 
 var savedProgram: CalculatorBrain.PropertyList?
 
 @IBAction func save() {
  savedProgram = brain.program
 }
 @IBAction func restore() {
  
  if savedProgram != nil {
   brain.program = savedProgram!
   displayValue = brain.result
  }
  
 }
}

