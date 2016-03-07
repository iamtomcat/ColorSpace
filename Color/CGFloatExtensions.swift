//
//  CGFloatExtensions.swift
//  Color
//
//  Created by Tom Clark on 2016-03-07.
//  Copyright © 2016 FluidDynamics. All rights reserved.
//

import Foundation

extension CGFloat {
  func clamp(min: CGFloat, max: CGFloat) -> CGFloat {
    return Swift.min(Swift.max(min, self), max)
  }
}
