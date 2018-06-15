//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by vinods on 7/12/17.
//  Copyright © 2017 vinods. All rights reserved.
//

import Foundation

func multiply(oprand1: Double,oprand2: Double) -> Double {
 return oprand1 * oprand2
}

class CalculatorBrain {
 private var accumulator = 0.0
 
 private var internalProgram = [AnyObject]()
 
 func setOperand(_ operand: Double){
  accumulator = operand
  internalProgram.append(operand as AnyObject)
 }
 
 enum Operation {
  case Constant(Double)
  case UnaryOperation((Double)->Double)
  case BinaryOperation((Double,Double)->Double)
  case Equals
 }
 
 func resultOfBinary()->Double {
  return 0.0
 }
 
 var operations : Dictionary<String,Operation> = [
  "∏" : Operation.Constant(Double.pi),
  "e" : Operation.Constant(M_E),
  "√" : Operation.UnaryOperation(sqrt),
  "cos" : Operation.UnaryOperation(sqrt),
  "×" : Operation.BinaryOperation({$0 * $1}
  ),
  "+" : Operation.BinaryOperation({$0 + $1}),
  "-" : Operation.BinaryOperation({$0 - $1}),
  "/" : Operation.BinaryOperation({$0 / $1}),
  "=" : Operation.Equals
 ]
 
 func performOperation(_ symbol: String){
  
  internalProgram.append(symbol as AnyObject)
  
  if let operation = operations[symbol]{
   switch operation {
   case Operation.Constant(let value):
    accumulator = value
    if pending != nil {
     accumulator = pending!.binaryFunction(pending!.firstOperand, accumulator)
     pending = nil
    }
    break
    
   case Operation.UnaryOperation(let function):
    accumulator = function(accumulator)
    break
    
   case Operation.BinaryOperation(let function):
    if pending != nil {
     accumulator = pending!.binaryFunction(pending!.firstOperand, accumulator)
     pending = PendingBinaryOperationInfo(binaryFunction: function, firstOperand: accumulator)
    }else{
     pending = PendingBinaryOperationInfo(binaryFunction: function, firstOperand: accumulator)
    }
    break
    
   case Operation.Equals:
    if pending != nil {
     accumulator = pending!.binaryFunction(pending!.firstOperand, accumulator)
     pending = nil
    }
    
    break
    
   default: break
   }
   
  }
 }
 
 private var pending: PendingBinaryOperationInfo?
 
 struct PendingBinaryOperationInfo{
  var binaryFunction: (Double,Double) -> Double
  var firstOperand: Double
  
 }
 
 var result:Double{
  get{
   return accumulator
  }
 } // Makes it read-only property
 
 typealias PropertyList = AnyObject
 
 var program : PropertyList {
  
  get{
   return internalProgram as CalculatorBrain.PropertyList
  }
  set{
   clear()
   
   if let arrayOfOps = newValue as? [AnyObject] {
    
    for op in arrayOfOps{
     if op is Double {
      setOperand(op as! Double)
     }else if op is String{
      performOperation(op as! String)
     }
    }
    
   }
   
  }
  
 }
 
 func clear()  {
  accumulator = 0.0
  pending = nil
  internalProgram.removeAll()
 }
 
 
 
}

