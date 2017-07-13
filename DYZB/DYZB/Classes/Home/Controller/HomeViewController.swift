//
//  HomeViewController.swift
//  DYZB
//
//  Created by 吴世兴 on 2017/7/12.
//  Copyright © 2017年 吴世兴. All rights reserved.
//

import UIKit

private let kTitleViewH: CGFloat = 40

class HomeViewController: UIViewController {
    // MARK: - 懒加载属性
    lazy var pageTitleView: PageTitleView = {
        let titleFlame = CGRect(x: 0, y: kStatusBarH + kNavigationBarH, width: kScreenW, height: kTitleViewH)
        let titles = ["推荐","手游","娱乐","游戏","趣玩"]
        let titleView = PageTitleView(frame: titleFlame, titles: titles)
        return titleView
    }()
    
    lazy var pageContentView: PageContentView = {
        // 1.确定内容的frame
        let contentH = kScreenH - kStatusBarH - kNavigationBarH - kTitleViewH
        let contentFrame = CGRect(x: 0, y: kStatusBarH + kNavigationBarH + kTitleViewH, width: kScreenW, height: contentH)
        
        // 2.确定所有的子控制器
        var childVcs = [UIViewController]()
        for _ in 0..<5 {
            let vc = UIViewController()
            vc.view.backgroundColor = UIColor(red: CGFloat(arc4random_uniform(255)), green: CGFloat(arc4random_uniform(255)), blue: CGFloat(arc4random_uniform(255)))
            childVcs.append(vc)
        }
        let contentView = PageContentView(frame: contentFrame, childVcs: childVcs, parentViewController: self)
        return contentView
    }()

    // MARK: - 系统回调函数
    override func viewDidLoad() {
        super.viewDidLoad()

        // 设置 UI 界面
        setupUI()
    }
}


// MARK: - 设置 UI 界面
extension HomeViewController {
    func setupUI() {
        
        // 0.不需要调整UIScrollView的内边距
        automaticallyAdjustsScrollViewInsets = false
        
        // 1.设置导航栏
        setupNavigationBar()
        
        // 2.设置导航栏的颜色
        navigationController?.navigationBar.barTintColor = UIColor.orange
        
        // 3.添加titleView
        view.addSubview(pageTitleView)
        
        // 4.添加ContentView
        view.addSubview(pageContentView)
        pageContentView.backgroundColor = UIColor.purple
    }
    
    private func setupNavigationBar() {
        // 1.设置左边的Item
        navigationItem.leftBarButtonItem = UIBarButtonItem(imageName: "homeLogoIcon")
        
        // 2.设置右边的Item
        let size = CGSize(width: 40, height: 40)
        
        let historyBtn = UIBarButtonItem(imageName: "viewHistoryIcon", highImageName: "viewHistoryIconHL", size: size)
        let gameBtn = UIBarButtonItem(imageName: "home_newGameicon", highImageName: "home_newGameicon_clicked", size: size)
        let searchBtn = UIBarButtonItem(imageName: "home_newSeacrhcon", highImageName: "", size: size)
        let qrcodeBtn = UIBarButtonItem(imageName: "home_newSaoicon", highImageName: "", size: size)
        
        navigationItem.rightBarButtonItems = [historyBtn, gameBtn, searchBtn, qrcodeBtn]
    }
}
