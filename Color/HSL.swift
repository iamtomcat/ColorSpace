//
//  HSL.swift
//  Color
//
//  Created by Tom Clark on 2016-03-07.
//  Copyright © 2016 FluidDynamics. All rights reserved.
//

import Foundation

public struct HSL {
  public let h: CGFloat
  public let s: CGFloat
  public let l: CGFloat
  public let a: CGFloat
}

extension HSL: ColorData {
  var toHSL: HSL {
    return self
  }

  var toRGB: RGB {
    var q: CGFloat {
      return l < 0.5 ? l * (1 + s) : l + s - l * s
    }
    var p: CGFloat {
      return 2 * l - q
    }
    func hue2rgb(p: CGFloat, q: CGFloat, t: CGFloat) -> CGFloat {
      var tempt = t
      if tempt < 0 { tempt += CGFloat(1.0) }
      if tempt > 1 { tempt -= 1.0 }
      if tempt < 1/6 { return p + (q - p) * 6 * tempt }
      if tempt < 1/2 { return q }
      if tempt < 2/3 { return p + (q - p) * (2/3 - tempt) * 6 }
      return p
    }
    let r = hue2rgb(p, q: q, t: h + 1/3)
    let g = hue2rgb(p, q: q, t: h)
    let b = hue2rgb(p, q: q, t: h - 1/3)

    return RGB(r: r, g: g, b: b, a: a)
  }

  var toHSV: HSV {
    let v = ((2*l) + (self.s*(1-abs(2*l-1))))/2
    let s = v == 0 ? 0 : (2*(v-l))/v

    return HSV(h: h, s: s, v: v, a: a)
  }
}
