//
//  Color.swift
//  SnapFashion
//
//  Created by Tom Clark on 2015-04-22.
//  Copyright (c) 2015 SnapFashion. All rights reserved.
//

public struct RGB {
  public var r: CGFloat
  public var g: CGFloat
  public var b: CGFloat
  public var a: CGFloat
}

public struct HSL {
  public var h: CGFloat
  public var s: CGFloat
  public var l: CGFloat
  public var a: CGFloat
}

public struct HSV {
  public var h: CGFloat
  public var s: CGFloat
  public var v: CGFloat
  public var a: CGFloat
}

public struct Color {
  var h: CGFloat = 0.0, s: CGFloat = 0.0, l: CGFloat = 0.0
  var a: CGFloat = 1.0
  
  //HSL Initializers
  init (h: CGFloat, s: CGFloat, l: CGFloat, a: CGFloat=1.0) {
    self.h = h; self.s = s; self.l = l; self.a = a
  }
  public static func hsl(h: CGFloat, s: CGFloat, l: CGFloat, a: CGFloat=1.0) -> Color {
    let color = Color(h: h, s: s, l: l, a: a)
    return color
  }
  //HSV/HSB Initializers
  init (h: CGFloat, s: CGFloat, v: CGFloat, a: CGFloat=1.0) {
    HSVtoHSL(h, s: s, v: v)
    self.a = a
  }
  public static func hsb(h: CGFloat, s: CGFloat, b: CGFloat, a: CGFloat=1.0) -> Color {
    let color = Color(h: h, s: s, v: b, a: a)
    return color
  }
  public static func hsv(h: CGFloat, s: CGFloat, v: CGFloat, a: CGFloat=1.0) -> Color {
    let color = Color(h: h, s: s, v: v, a: a)
    return color
  }
  //RGB Initializer
  init (r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat=1.0) {
    RGBtoHSL(r, g: g, b: b)
    self.a = a
  }
  public static func rgb(r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat=1.0) -> Color {
    let color = Color(r: r, g: g, b: b, a: a)
    return color
  }
}

//Tuple Functions
extension Color {
  public var hsb: (h: CGFloat, s: CGFloat, b: CGFloat, a: CGFloat) {
    let b: CGFloat = ((2*l) + (self.s*(1-abs(2*l-1))))/2
    let s: CGFloat = (2*(b-l))/b
    return (h,s,b,a)
  }
  public var hsv: HSV {
    return HSV(h: h, s: s, v: v, a: a)
  }
  public var rgb: RGB {
    return RGB(r: red, g: green, b: blue, a: a)
  }
  public var hsl: HSL {
    return HSL(h: h, s: s, l: l, a: a)
  }
}

//Converters
extension Color {
  mutating func HSVtoHSL(h: CGFloat, s: CGFloat, v:CGFloat) {
    var l = (2 - s) * v
    var ss = s * v
    ss /= (l <= 1) ? l : 2 - l
    l /= 2
    
    self.h = h
    self.s = ss
    self.l = l
  }
  mutating func RGBtoHSL(r: CGFloat, g: CGFloat, b: CGFloat) {
    assert(r <= 1.0 && g <= 1.0 && b <= 1.0, "Color values must be less than 1.0")
    //RGB need to be between 0.0 and 1.0
    var maxColor: CGFloat = max(r,g,b)
    var minColor: CGFloat = min(r, g, b)
    var h: CGFloat=0.0, s: CGFloat=0.0, l = (maxColor + minColor) / 2;
    
    if maxColor != minColor {
      var d = maxColor - minColor;
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
    self.h = h
    self.s = s
    self.l = l
  }
}

//RGB
extension Color {
  private var q: CGFloat {
    return l < 0.5 ? l * (1 + s) : l + s - l * s
  }
  private var p: CGFloat {
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
  
  var red: CGFloat {
    set {
      RGBtoHSL(newValue, g: green, b: blue)
    }
    get {
      return hue2rgb(p, q: q, t: h + 1/3)
    }
  }
  var green: CGFloat {
    set {
      RGBtoHSL(red, g: newValue, b: blue)
    }
    get {
      let value = hue2rgb(p, q: q, t: h)
      return value
    }
  }
  var blue: CGFloat {
    set {
      RGBtoHSL(red, g: green, b: newValue)
    }
    get {
      return hue2rgb(p, q: q, t: h - 1/3)
    }
  }
}

//HSV/HSB
extension Color {
  var sv: CGFloat {
    set {
      HSVtoHSL(h, s: newValue, v: v)
    }
    get {
      return (2*(b-l))/b
    }
  }
  var v: CGFloat {
    set {
      HSVtoHSL(h, s: sv, v: newValue)
    }
    get {
      return ((2*l) + (s*(1-abs(2*l-1))))/2
    }
  }
  var b: CGFloat {
    set {
      v = newValue
    }
    get {
      return v
    }
  }
}
