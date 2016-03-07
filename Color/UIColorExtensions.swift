//
//  UIColorExtensions.swift
//  ColorSpace
//
//  Created by Tom Clark on 2015-04-22.
//  Copyright (c) 2015 FluidDynamics. All rights reserved.
//

import Foundation

extension UIColor {
  public var colorSpace: ColorSpace? {
    return getRGB()
  }

  public var isWhite: Bool {
    if let rgb = self.colorSpace?.rgb where rgb.r == 1.0 && rgb.g == 1.0 && rgb.b == 1.0 {
      return true
    }
    return false
  }

  public func getHSB() -> ColorSpace? {
    let h = UnsafeMutablePointer<CGFloat>.alloc(1)
    let s = UnsafeMutablePointer<CGFloat>.alloc(1)
    let b = UnsafeMutablePointer<CGFloat>.alloc(1)
    let a = UnsafeMutablePointer<CGFloat>.alloc(1)

    if !getHue(h, saturation: s, brightness: b, alpha: a) {
      return nil
    }
    return ColorSpace(h: h.memory, s: s.memory, v: b.memory, a: a.memory)
  }

  private func getRGB() -> ColorSpace? {
    let r = UnsafeMutablePointer<CGFloat>.alloc(1)
    let g = UnsafeMutablePointer<CGFloat>.alloc(1)
    let b = UnsafeMutablePointer<CGFloat>.alloc(1)
    let a = UnsafeMutablePointer<CGFloat>.alloc(1)

    if !getRed(r, green: g, blue: b, alpha: a) {
      return ColorSpace(r: 1.0, g: 1.0, b: 1.0, a: 1.0)
    }

    return ColorSpace(r: r.memory, g: g.memory, b: b.memory, a: a.memory)
  }
}
