//
//  UIColor+BrightColor.swift
//  TrafficSignal
//
//  Created by NextAuth on 03/03/2022.
//

import Foundation
import UIKit

extension UIColor {
  struct BrightColor {
    static var red: UIColor  { return UIColor(red: 255/255, green: 0/255, blue: 5/255, alpha: 1) }
    static var yellow: UIColor { return UIColor(red: 241/255, green: 245/255, blue: 5/255, alpha: 1) }
    static var green: UIColor { return UIColor(red: 15/255, green: 217/255, blue: 69/255, alpha: 1) }
  }
}
