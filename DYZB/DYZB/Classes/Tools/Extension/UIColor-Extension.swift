//
//  UIColor-Extension.swift
//  DYZB
//
//  Created by 吴世兴 on 2017/7/13.
//  Copyright © 2017年 吴世兴. All rights reserved.
//

import UIKit

extension UIColor {
    convenience init(red: CGFloat, green: CGFloat, blue: CGFloat) {
        self.init(red: red / 255, green: green / 255, blue: blue / 255, alpha: 1.0)
    }
}
