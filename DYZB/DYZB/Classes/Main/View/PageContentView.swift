//
//  PageContentView.swift
//  DYZB
//
//  Created by 吴世兴 on 2017/7/13.
//  Copyright © 2017年 吴世兴. All rights reserved.
//

import UIKit

class PageContentView: UIView {
    
    // MARK: - 定义属性
    private var childVcs: [UIViewController]
    private var parentViewController: UIViewController

    init(frame: CGRect, childVcs: [UIViewController], parentViewController: UIViewController) {
        self.childVcs = childVcs
        self.parentViewController = parentViewController
        
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
