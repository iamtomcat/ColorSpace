//
//  ColorSpec.swift
//  Color
//
//  Created by Tom Clark on 2015-04-22.
//  Copyright (c) 2015 FluidDynamics. All rights reserved.
//

import Quick
import Nimble
import ColorSpace

class ColorSpec: QuickSpec {
  override func spec() {
    describe("RGB color converters") {
      var color: ColorSpace!
      beforeEach {
        // RGB: #68a13e
        color = ColorSpace(r: 0.407843137, g: 0.631372549, b: 0.243137255)
      }
      
      it("should convert RGB to HSL") {
        expect(color.hsl.h).to(beCloseTo(0.262638889, within: 0.001))
        expect(color.hsl.s).to(beCloseTo(0.4439, within: 0.001))
        expect(color.hsl.l).to(beCloseTo(0.4373, within: 0.001))
      }

      it("should convert RGB to HSV") {
        expect(color.hsv.h).to(beCloseTo(0.262638889, within: 0.001))
        expect(color.hsv.s).to(beCloseTo(0.6149, within: 0.001))
        expect(color.hsv.v).to(beCloseTo(0.6314, within: 0.001))
      }

      it("should return an RGB object") {
        expect(color.rgb.r).to(equal(0.407843137))
        expect(color.rgb.g).to(equal(0.631372549))
        expect(color.rgb.b).to(equal(0.243137255))
      }
    }

    describe("HSL color converters") {
      var color: ColorSpace!
      beforeEach {
        // RGB: #14a36a
        color = ColorSpace(h: 0.433555556, s: 0.7814, l: 0.3588)
      }
      
      it("should convert HSL to RGB") {
        expect(color.rgb.r).to(beCloseTo(0.078431373, within: 0.001))
        expect(color.rgb.g).to(beCloseTo(0.639215686, within: 0.001))
        expect(color.rgb.b).to(beCloseTo(0.415686275, within: 0.001))
      }

      it("should convert HSL to HSV/HSB") {
        expect(color.hsv.h).to(beCloseTo(0.433555556, within: 0.001))
        expect(color.hsv.s).to(beCloseTo(0.8773, within: 0.001))
        expect(color.hsv.v).to(beCloseTo(0.6392, within: 0.001))
      }

      it("should return an HSL object") {
        expect(color.hsl.h).to(equal(0.433555556))
        expect(color.hsl.s).to(equal(0.7814))
        expect(color.hsl.l).to(equal(0.3588))
      }
    }

    describe("HSV color converters") {
      var color: ColorSpace!

      context("using decimal numbers") {
        beforeEach {
          // RGB: #ba31a0
          color = ColorSpace(h: 0.864972222, s: 0.7366, v: 0.7294)
        }

        it("should convert HSV to RGB") {
          expect(color.rgb.r).to(beCloseTo(0.729411765, within: 0.001))
          expect(color.rgb.g).to(beCloseTo(0.192156863, within: 0.001))
          expect(color.rgb.b).to(beCloseTo(0.62745098, within: 0.001))
        }

        it("should convert HSV to HSL") {
          expect(color.hsl.h).to(beCloseTo(0.864972222, within: 0.001))
          expect(color.hsl.s).to(beCloseTo(0.583, within: 0.001))
          expect(color.hsl.l).to(beCloseTo(0.4608, within: 0.001))
        }

        it("should return an HSV object") {
          expect(color.hsv.h).to(equal(0.864972222))
          expect(color.hsv.s).to(equal(0.7366))
          expect(color.hsv.v).to(equal(0.7294))
        }
      }
      context("using a number between 0 and 360") {
        beforeEach {
          // RGB: #ba31a0
          color = ColorSpace(h360: 311.38999992, s: 0.7366, v: 0.7294)
        }

        it("should convert HSV to RGB") {
          expect(color.rgb.r).to(beCloseTo(0.729411765, within: 0.001))
          expect(color.rgb.g).to(beCloseTo(0.192156863, within: 0.001))
          expect(color.rgb.b).to(beCloseTo(0.62745098, within: 0.001))
        }

        it("should convert HSV to HSL") {
          expect(color.hsl.h).to(beCloseTo(0.864972222, within: 0.001))
          expect(color.hsl.s).to(beCloseTo(0.583, within: 0.001))
          expect(color.hsl.l).to(beCloseTo(0.4608, within: 0.001))
        }

        it("should return an HSV object") {
          expect(color.hsv.h).to(beCloseTo(0.864972222, within: 0.001))
          expect(color.hsv.s).to(equal(0.7366))
          expect(color.hsv.v).to(equal(0.7294))
        }
      }
    }
  }
}
