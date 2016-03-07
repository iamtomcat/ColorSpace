//
//  RGB.swift
//  Color
//
//  Created by Tom Clark on 2016-03-07.
//  Copyright © 2016 FluidDynamics. All rights reserved.
//

import Foundation

public struct RGB {
  public let r: CGFloat
  public let g: CGFloat
  public let b: CGFloat
  public let a: CGFloat

  public init(r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) {
    self.r = min(max(0.0, r), 1.0)
    self.g = min(max(0.0, g), 1.0)
    self.b = min(max(0.0, b), 1.0)
    self.a = min(max(0.0, a), 1.0)
  }
}

extension RGB: ColorData {
  var toRGB: RGB {
    return self
  }

  var toHSL: HSL {
    let maxColor = max(r, g, b)
    let minColor = min(r, g, b)
    var h = CGFloat(0.0), s = CGFloat(0.0), l = (maxColor + minColor) / 2

    if maxColor != minColor {
      let d = maxColor - minColor
      s = l > 0.5 ? d / (2 - maxColor - minColor) : d / (maxColor + minColor)
      switch maxColor {
      case r: h = (g - b) / d + (g < b ? 6 : 0)
      case g: h = (b - r) / d + 2
      case b: h = (r - g) / d + 4
      default:
        break
      }
      h /= 6
    }
    return HSL(h: h, s: s, l: l, a: a)
  }

  var toHSV: HSV {
    return self.toHSL.toHSV
  }
}
