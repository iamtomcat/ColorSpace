//
//  HSV.swift
//  Color
//
//  Created by Tom Clark on 2016-03-07.
//  Copyright © 2016 FluidDynamics. All rights reserved.
//

import Foundation

public struct HSV {
  public let h: CGFloat
  public let s: CGFloat
  public let v: CGFloat
  public let a: CGFloat
}

extension HSV: ColorData {
  var toHSV: HSV {
    return self
  }

  var toRGB: RGB {
    var r = CGFloat(0.0), g = CGFloat(0.0), b = CGFloat(0.0)
    let i = floor(h * 6)
    let f = h * 6 - i;
    let p = v * (1 - s);
    let q = v * (1 - f * s);
    let t = v * (1 - (1 - f) * s);

    switch(i % 6){
    case 0: r = v; g = t; b = p
    case 1: r = q; g = v; b = p
    case 2: r = p; g = v; b = t
    case 3: r = p; g = q; b = v
    case 4: r = t; g = p; b = v
    case 5: r = v; g = p; b = q
    default:
      return RGB(r: 1.0, g: 1.0, b: 1.0, a: 1.0)
    }
    return RGB(r: r, g: g, b: b, a: a)
  }

  var toHSL: HSL {
    return self.toRGB.toHSL
  }
}
