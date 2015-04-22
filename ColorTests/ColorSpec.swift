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
        let color = Color(r: 1.0, g: 0.7, b: 0.6)
        expect(color.red).to(beCloseTo(1.0, within: 0.001))
        expect(color.green).to(beCloseTo(0.7, within: 0.001))
        expect(color.blue).to(beCloseTo(0.6, within: 0.001))
        expect(color.a).to(equal(1.0))
      }
      it("should be initialized with RGB with alpha") {
        let color = Color(r: 1.0, g: 0.7, b: 0.6, a: 0.8)
        expect(color.red).to(beCloseTo(1.0, within: 0.001))
        expect(color.green).to(beCloseTo(0.7, within: 0.001))
        expect(color.blue).to(beCloseTo(0.6, within: 0.001))
        expect(color.a).to(equal(0.8))
      }
      it("should be initialized with HSL") {
        let color = Color(h: 1.0, s: 1.0, l: 1.0)
        expect(color.h).to(equal(1.0))
        expect(color.s).to(equal(1.0))
        expect(color.l).to(equal(1.0))
        expect(color.a).to(equal(1.0))
      }
      it("should be initialized with HSV") {
        let color = Color(h: 1.0, s: 1.0, v: 1.0)
      
      }
      it("should be initialized with HSB") {
        let color = Color(h: 1.0, s: 1.0, b: 1.0)

      }
    }
  }
}
