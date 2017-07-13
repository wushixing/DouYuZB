//
//  PageTitleView.swift
//  DYZB
//
//  Created by 吴世兴 on 2017/7/13.
//  Copyright © 2017年 吴世兴. All rights reserved.
//

import UIKit

private let kScrollLineH: CGFloat = 2

class PageTitleView: UIView {
    
    // MARK: - 定义属性
    var titles: [String]
    
    // MARK: - 懒加载属性
    lazy var titleLabels: [UILabel] = [UILabel]()
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.scrollsToTop = false
        scrollView.bounces = false
        return scrollView
    }()
    
    lazy var scrollLine: UIView = {
        let scrollLine = UIView()
        scrollLine.backgroundColor = UIColor.orange
        return scrollLine
    }()

    // MARK: - 自定义构造函数
    init(frame: CGRect, titles: [String]) {
        self.titles = titles
        
        super.init(frame: frame)
        
        // 设置 UI 界面
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

// MARK: - 设置 UI 界面
extension PageTitleView {
    func setupUI() {
        // 1.添加UIScrollView
        addSubview(scrollView)
        scrollView.frame = bounds
        
        // 2.添加title对应的Label
        setupTitleLabels()
        
        // 3.设置底线和滚动的滑块
        setupBottonLineAndScrollLine()
    }
    
    private func setupTitleLabels() {
        for (index, title) in titles.enumerated() {
            // 1.创建UILabel
            let label = UILabel()
            
            // 2.设置Label的属性
            label.text = title
            label.tag = index
            label.font = UIFont.systemFont(ofSize: 16.0)
            label.textAlignment = .center
            
            // 3.设置Label的flame
            let labelW: CGFloat = frame.width / CGFloat(titles.count)
            let labelH: CGFloat = frame.height - kScrollLineH
            let labelX: CGFloat = labelW * CGFloat(index)
            let labelY: CGFloat = 0
            label.frame = CGRect(x: labelX, y: labelY, width: labelW, height: labelH)
            
            // 4.将label添加到scrollView中
            scrollView.addSubview(label)
            titleLabels.append(label)
        }
    }
    private func setupBottonLineAndScrollLine() {
        // 1.添加底线
        let bottonLine = UIView()
        bottonLine.backgroundColor = UIColor.lightGray
        let lineH: CGFloat = 0.5
        bottonLine.frame = CGRect(x: 0, y: frame.height - lineH, width: frame.width, height: lineH)
        addSubview(bottonLine)
        
        // 2.添加scrollLine
        // 2.1.获取第一个Label
        guard let firstLabel = titleLabels.first else { return }
        firstLabel.textColor = UIColor.orange
        
        // 2.2.设置scrollLine的属性
        scrollView.addSubview(scrollLine)
        scrollLine.frame = CGRect(x: firstLabel.frame.origin.x, y: frame.height - kScrollLineH, width: firstLabel.frame.width, height: kScrollLineH)
    }
}
