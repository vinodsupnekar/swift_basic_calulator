//
//  SerializationJson.swift
//  Calculator
//
//  Created by vinods on 1/23/18.
//  Copyright © 2018 vinods. All rights reserved.
//

import Foundation

//class SerializationJson{
//
// let arrayEmpty = [String]()
// let str = "string"
//
//// var k = str
// let arraySinleEmement = ["abc"]
//
// let arrayOfStrings = ["abc","efg"]
//
// let arraOfObjects:[Array<Any>]
//
// init() {
//  arraOfObjects = [arrayEmpty,arraySinleEmement,arrayOfStrings]
////
// }
//
//}

struct myStructWithInit {
 let myString: String
 let myInt: Int?
 let myDouble: Double?
 
 init(myString: String, //👈
  myInt: Int? = nil,
  myDouble: Double? = nil) {
  
  self.myString = myString
  self.myInt = myInt
  self.myDouble = myDouble
 }
}

class MyClassWithInit {
 let myString: String?
 let myInt: Int?
 let myDouble: Double?
 
// let myStructVariable = myStructWithInit(myString: <#T##String#>, myInt: <#T##Int?#>, myDouble: <#T##Double?#>)
 
 init(myString: String? = nil, //👈
  myInt: Int? = nil,
  myDouble: Double? = nil) {
  
  self.myString = myString
  self.myInt = myInt
  self.myDouble = myDouble
 }
 
 
 
}


