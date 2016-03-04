//
//  Color.swift
//
//  Created by Tom Clark on 2015-04-22.
//  Copyright (c) 2015 FluidDynamics. All rights reserved.
//

public protocol OSColor {
  var OSColor: UIColor { get }
}

public protocol ColorData {
  var toRGB: RGB { get }
  var toHSL: HSL { get }
  var toHSV: HSV { get }
}


public struct HSL: ColorData {
  public let h: CGFloat
  public let s: CGFloat
  public let l: CGFloat
  public let a: CGFloat

  public var toHSL: HSL {
    return self
  }

  public var toRGB: RGB {
    var q: CGFloat {
      return l < 0.5 ? l * (1 + s) : l + s - l * s
    }
    var p: CGFloat {
      return 2 * l - q
    }
    func hue2rgb(p: CGFloat, q: CGFloat, t: CGFloat) -> CGFloat {
      var tempt: CGFloat = t
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

  public var toHSV: HSV {
    let v = ((2*l) + (self.s*(1-abs(2*l-1))))/2
    let s = v == 0 ? 0 : (2*(v-l))/v

    return HSV(h: h, s: s, v: v, a: a)
  }
}

public struct RGB: ColorData {
  public let r: CGFloat
  public let g: CGFloat
  public let b: CGFloat
  public let a: CGFloat

  public var toRGB: RGB {
    return self
  }

  public var toHSL: HSL {
    let maxColor = max(r, g, b)
    let minColor = min(r, g, b)
    var h = CGFloat(0.0), s = CGFloat(0.0), l = (maxColor + minColor) / 2;

    if maxColor != minColor {
      let d = maxColor - minColor;
      s = l > 0.5 ? d / (2 - maxColor - minColor) : d / (maxColor + minColor);
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

  public var toHSV: HSV {
    return self.toHSL.toHSV
  }
}

public struct HSV: ColorData {
  public let h: CGFloat
  public let s: CGFloat
  public let v: CGFloat
  public let a: CGFloat

  public var toHSV: HSV {
    return self
  }

  public var toRGB: RGB {
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

  public var toHSL: HSL {
    return self.toRGB.toHSL
  }
}

extension Color: OSColor {
  public var OSColor: UIColor {
    return UIColor()
  }
}

public struct Color {
  private let data: ColorData

  public init(h: CGFloat, s: CGFloat, v: CGFloat, a: CGFloat=1.0) {
    self.data = HSV(h: h, s: s, v: v, a: a)
  }

  public init(h: CGFloat, s: CGFloat, l: CGFloat, a: CGFloat=1.0) {
    self.data = HSL(h: h, s: s, l: l, a: a)
  }

  public init(r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat=1.0) {
    self.data = RGB(r: r, g: g, b: b, a: a)
  }

  public var rgb: RGB {
    return data.toRGB
  }

  public var hsl: HSL {
    return data.toHSL
  }

  public var hsv: HSV {
    return data.toHSV
  }
}
