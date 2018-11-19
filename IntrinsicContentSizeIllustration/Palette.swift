//
//  Palette.swift
//  IntrinsicContentSizeIllustration
//
//  Created by Yosaku Toyama on 2018/11/19.
//  Copyright © 2018年 DeNA. All rights reserved.
//

import UIKit

class Palette {
    private let colors = [
        UIColor(red: 255.0 / 255.0, green: 59.0 / 255.0, blue: 48.0 / 255.0, alpha: 1.0),
        UIColor(red: 255.0 / 255.0, green: 149.0 / 255.0, blue: 0.0 / 255.0, alpha: 1.0),
        UIColor(red: 255.0 / 255.0, green: 204.0 / 255.0, blue: 0.0 / 255.0, alpha: 1.0),
        UIColor(red: 76.0 / 255.0, green: 217.0 / 255.0, blue: 100.0 / 255.0, alpha: 1.0),
        UIColor(red: 90.0 / 255.0, green: 200.0 / 255.0, blue: 250.0 / 255.0, alpha: 1.0),
        UIColor(red: 0.0 / 255.0, green: 122.0 / 255.0, blue: 255.0 / 255.0, alpha: 1.0),
        UIColor(red: 88.0 / 255.0, green: 86.0 / 255.0, blue: 214.0 / 255.0, alpha: 1.0),
        UIColor(red: 255.0 / 255.0, green: 45.0 / 255.0, blue: 85.0 / 255.0, alpha: 1.0)
    ]
    private let delta = 3
    private var index = 0
    
    func nextColor() -> UIColor {
        let color = colors[index]
        index = (index + delta) % colors.count
        return color
    }
}
