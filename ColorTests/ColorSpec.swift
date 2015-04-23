//
//  ColorSpec.swift
//  Color
//
//  Created by Tom Clark on 2015-04-22.
//  Copyright (c) 2015 FluidDynamics. All rights reserved.
//

import Quick
import Nimble
import Color

class ColorSpec: QuickSpec {
  override func spec() {
    describe("Color Object initialization") {
      it("should be initialized with RGB") {
        let color: Color = Color.rgb(1.0, g: 0.7, b: 0.6, a: 1.0)
        expect(color.rgb.r).to(beCloseTo(1.0, within: 0.001))
        expect(color.rgb.g).to(beCloseTo(0.7, within: 0.001))
        expect(color.rgb.b).to(beCloseTo(0.6, within: 0.001))
        expect(color.rgb.a).to(equal(1.0))
      }
      it("should be initialized with RGB with alpha") {
        let color = Color.rgb(1.0, g: 0.7, b: 0.6, a: 0.8)
        expect(color.rgb.r).to(beCloseTo(1.0, within: 0.001))
        expect(color.rgb.g).to(beCloseTo(0.7, within: 0.001))
        expect(color.rgb.b).to(beCloseTo(0.6, within: 0.001))
        expect(color.rgb.a).to(equal(0.8))
      }
      it("should be initialized with HSL") {
        let color = Color.hsl(1.0, s: 1.0, l: 1.0)
        expect(color.hsl.h).to(equal(1.0))
        expect(color.hsl.s).to(equal(1.0))
        expect(color.hsl.l).to(equal(1.0))
        expect(color.hsl.a).to(equal(1.0))
      }
      it("should be initialized with HSV") {
        let color = Color.hsv(1.0, s: 1.0, v: 1.0)
        expect(color.hsv.h).to(equal(1.0))
        expect(color.hsv.s).to(equal(1.0))
        expect(color.hsv.v).to(equal(1.0))
        expect(color.hsv.a).to(equal(1.0))
      }
      it("should be initialized with HSB") {
        let color = Color.hsb(1.0, s: 1.0, b: 1.0)
        expect(color.hsb.h).to(equal(1.0))
        expect(color.hsb.s).to(equal(1.0))
        expect(color.hsb.b).to(equal(1.0))
        expect(color.hsb.a).to(equal(1.0))
      }
    }
    describe("RGB color converters") {
      var color: Color!
      beforeEach {
        color = Color.rgb(0.407843137, g: 0.631372549, b: 0.243137255)
      }
      
      it("should convert RGB to HSL") {
        expect(color.hsl.h).to(beCloseTo(0.262638889, within: 0.001))
        expect(color.hsl.s).to(beCloseTo(0.4439, within: 0.001))
        expect(color.hsl.l).to(beCloseTo(0.4373, within: 0.001))
      }
      it("should convert RGB to HSB") {
        expect(color.hsb.h).to(beCloseTo(0.262638889, within: 0.001))
        expect(color.hsb.s).to(beCloseTo(0.6149, within: 0.001))
        expect(color.hsb.b).to(beCloseTo(0.6314, within: 0.001))
      }
    }
    describe("HSL color converters") {
      var color: Color!
      beforeEach {
//        color = Color(h: <#CGFloat#>, s: <#CGFloat#>, l: <#CGFloat#>, a: <#CGFloat#>)
      }
      
      it("should convert HSL to RGB") {
        
      }
      it("should convert HSL to HSV/HSB") {
        
      }
    }
    describe("HSB color converters") {
      it("should convert HSB to RGB") {
        
      }
      it("should convert HSB to HSL") {
        
      }
    }
  }
}
