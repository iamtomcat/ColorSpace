//
//  UIColorSpec.swift
//  Color
//
//  Created by Tom Clark on 2016-03-07.
//  Copyright © 2016 FluidDynamics. All rights reserved.
//

import Foundation

import Nimble
import Quick
import Color

class UIColorSpec : QuickSpec {

  override func spec() {
    describe("UIColor Extension") {
      var sut: UIColor!
      beforeEach {
        // #816836
        sut = UIColor(red: 0.505882353, green: 0.407843137, blue: 0.211764706, alpha: 1.0)
      }

      it("should return a Color object") {
        let hsv = sut.getHSB()
        expect(hsv).to(equal(Color(r: 0.505882353, g: 0.407843137, b: 0.211764706, a: 1.0)))
      }
    }
  }
}
