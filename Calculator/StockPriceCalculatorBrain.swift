//
//  StockPriceCalculatorBrain.swift
//  Calculator
//
//  Created by vinods on 7/17/17.
//  Copyright © 2017 vinods. All rights reserved.
//

import Foundation

class StockPriceCalculatorBrain{
 
 private var netRevenue:Double , numberOfShares: Double,bookValue:Double,baseValue:Double
 
 
 init(netRevenue:Double , numberOfShares: Double,bookValue:Double,baseValue:Double) {
  
  self.netRevenue = netRevenue
  self.numberOfShares = numberOfShares
  self.bookValue = bookValue
  self.baseValue = baseValue
  
 }
 
 func calculateNSYP( ) -> Double {
  
  var nsyp: Double!
   nsyp = self.netRevenue / self.numberOfShares
  return (nsyp)!
 
 }
 
 func calculateStockPrice() -> (Double,Double,Double) {
  
  let nsyp:Double = self.calculateNSYP()
  
  let average:Double = (nsyp + self.bookValue + self.baseValue)/3
 
  let minusTenPercentage:Double = average - (0.1*average)

  
  return (minusTenPercentage,nsyp,average)
 }
 
}
