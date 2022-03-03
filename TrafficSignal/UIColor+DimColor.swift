//
//  UIColor+DimColor.swift
//  TrafficSignal
//
//  Created by NextAuth on 03/03/2022.
//

import Foundation
import UIKit

extension UIColor {
  struct DimColor {
      static var red: UIColor  { return UIColor(red: 143/255, green: 42/255, blue: 34/255, alpha: 1) }
      static var yellow: UIColor { return UIColor(red: 143/255, green: 137/255, blue: 34/255, alpha: 1) }
      static var green: UIColor { return UIColor(red: 33/255, green: 128/255, blue: 43/255, alpha: 1) }
  }
}
