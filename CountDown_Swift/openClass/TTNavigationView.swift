//
//  TZNavigationView.swift
//  JieMProject_SF
//
//  Created by 天轩 on 2019/4/10.
//  Copyright © 2019 天轩. All rights reserved.
//

import UIKit
import SnapKit
///导航栏类型
enum TTNavigationType:Int {
    ///只展示标题
    case TTNavigation_onlyTitle = 0
    ///展示标题和左侧按钮
    case TTNavigation_onlyLeft
    ///展示标题和右侧按钮
    case TTNavigation_onlyRight
    ///左右两侧都展示
    case TTNavigation_leftRight
}

struct TTNavigationConfig {
    ///标题文字
    var title:String?
    ///左侧图片名称 目前支持图片
    var leftImage:String
    ///右侧名称 可以为数组、图片、文字
    var rightAny:Any?
}
class TTNavigationView: UIView {
    
    open var letfImageString:String?;
    
    open var titleString:String?
    
    open var rightAny:Any?
    
    /**左侧按钮*/
    let leftBtn:UIButton = {
        let image:UIImage? = UIImage.init(named: "")
        let _left = UIButton.init(type: .custom);
        _left.setImage(image, for: .normal);
        _left.setImage(image, for: .selected)
        _left.backgroundColor = UIColor.blue
        return _left;
    }()
    //右侧按钮
    let rightBtn:UIButton = {
        let image:UIImage? = UIImage.init(named: "");
        let _right = UIButton.init(type: .custom);
        _right.setImage(image, for: .normal);
        _right.setImage(image, for: .selected)
        _right.backgroundColor = UIColor.green
        return _right;
    }();
    //中间文字
    let titleLabel:UILabel = {
        let _titleLabel = UILabel.init();
        _titleLabel.backgroundColor = UIColor.yellow;
        _titleLabel.text = "221321131"
        _titleLabel.textColor = UIColor.black;
        _titleLabel.font = UIFont.systemFont(ofSize: 17)
        return _titleLabel;
    }();
    //默认初始化方法
    override init(frame: CGRect) {
        super.init(frame: frame);
    }
    ///便利初始化方法
    ///
    /// - Parameter frame:位置
    /// - Parameter leftImage:图片名称
    /// - Returns: 对象
    convenience init(frame:CGRect,leftString:String,title:String,rightAny:Any) {
        self.init(frame:frame);
        self.titleString = title;
        self.letfImageString = leftString;
        self.rightAny = rightAny;
        creatUI()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func creatUI(){
        self.addSubview(self.titleLabel);
        self.titleLabel.text = self.titleString;
        self.titleLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(self);
            make.centerY.equalTo(self).offset(UIApplication.shared.statusBarFrame.height/2);
        };
        
        self.addSubview(self.leftBtn);
        self.leftBtn.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.titleLabel);
            make.left.equalTo(self).offset(15);
        };
        
        self.addSubview(self.rightBtn);
        self.rightBtn.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.titleLabel);
            make.right.equalTo(self).offset(-15);
        };
        
    }
    
    static public func TTNavigationSettingConfig(Config:TTNavigationConfig,_ leftBtnClick:()->Void){
        TTNavigationView.init(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 88), leftString: Config.leftImage, title: Config.title ?? "", rightAny: Config.rightAny ?? []);

        
        
    }
}
