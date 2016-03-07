//
//  UIColorExtensions.swift
//  Color
//
//  Created by Tom Clark on 2015-04-22.
//  Copyright (c) 2015 FluidDynamics. All rights reserved.
//

import Foundation

extension UIColor {
  public func getHSB() -> Color? {
    let h = UnsafeMutablePointer<CGFloat>.alloc(1)
    let s = UnsafeMutablePointer<CGFloat>.alloc(1)
    let b = UnsafeMutablePointer<CGFloat>.alloc(1)
    let a = UnsafeMutablePointer<CGFloat>.alloc(1)

    if !getHue(h, saturation: s, brightness: b, alpha: a) {
      return nil
    }
    return Color(h: h.memory, s: s.memory, v: b.memory, a: a.memory)
  }
}

