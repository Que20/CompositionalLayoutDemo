//
//  Utils.swift
//  CompositionalLayoutDemo
//
//  Created by Kévin MAAREK on 26/09/2019.
//  Copyright © 2019 Kévin MAAREK. All rights reserved.
//

import UIKit

public extension UIColor {
   convenience init(red: Int, green: Int, blue: Int) {
       assert(red >= 0 && red <= 255, "Invalid red component")
       assert(green >= 0 && green <= 255, "Invalid green component")
       assert(blue >= 0 && blue <= 255, "Invalid blue component")

       self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
   }

   convenience init(rgb: Int) {
       self.init(
           red: (rgb >> 16) & 0xFF,
           green: (rgb >> 8) & 0xFF,
           blue: rgb & 0xFF
       )
   }
}


public let APP_LIST: [(title: String, category:String, color: Int)] = [
    (title: "Twitter", category: "Social Network", color: 0x00b8d9),
    (title: "Facebook", category: "Social Network", color: 0x4263a6),
    (title: "Freebox", category: "Tools", color: 0x000000),
    (title: "Leboncoin", category: "Shopping", color: 0xfc9403),
    (title: "Pinterest", category: "Social Network", color: 0xb30300),
    (title: "Mariokart", category: "Games", color: 0x40b39a),
    (title: "Whatsapp", category: "Chat", color: 0x00c918),
    (title: "Medium", category: "News", color: 0x8f8f8f),
    (title: "Maps", category: "Navigation", color: 0x00701a),
    (title: "Apple Store", category: "Shopping", color: 0x30cdd9),
    (title: "Spotify", category: "Music", color: 0x32ba39),
    (title: "Youtube", category: "Entertaiment", color: 0xfc0703),
    (title: "MyApp", category: "Hello World", color: 0x00b8d9)
].shuffled()
