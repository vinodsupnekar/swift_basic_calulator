//
//  SwiftInitialization.swift
//  Calculator
//
//  Created by vinods on 1/22/18.
//  Copyright © 2018 vinods. All rights reserved.
//

import Foundation

class PointSwift{
 
 let x : Int
 let y: Int

 init(x: Int , y:Int) {
  self.x = x
  self.y = y
 }
 
 init(x: Int ) {
  self.x = x
  self.y = 2
 }

}


class Graph {
 
 func createGraph()  {
  
  let p1 = PointSwift(x: 1)
 print("point p1.x = \(p1.x) and point p1.x = \(p1.y)")
  
}
}
