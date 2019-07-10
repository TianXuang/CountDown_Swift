//
//  TZNavigationView.swift
//  JieMProject_SF
//
//  Created by 天轩 on 2019/4/10.
//  Copyright © 2019 天轩. All rights reserved.
//

import UIKit
import SnapKit

struct  TTNavigationConfig {
    ///标题文字
    var title:String?
    ///左侧图片名称 目前支持图片文字
    var leftImage:String?
    ///右侧名称 可以为数组、图片、文字
    var rightAny:String?
    ///navigation的父视图
    var superView:UIView
    ///背景颜色
    var backgroundColor:UIColor = UIColor.white
    ///文字大小
    var fontSize:CGFloat = 17
    ///文字颜色
    var textColor:UIColor = UIColor.black
   
    init(bgView:UIView) {
        self.superView = bgView;
    }
}
class TTNavigationView: UIView {
    
    open var config:TTNavigationConfig?
    
    
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
        _titleLabel.backgroundColor = UIColor.clear;
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
    convenience init(frame:CGRect,leftString:String?,title:String?,rightAny:Any?,config:TTNavigationConfig) {
        self.init(frame:frame);
        self.config = config;
        creatUI()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func creatUI(){
        if let title = self.config?.title {
            self.addSubview(self.titleLabel);
            self.titleLabel.textColor = config?.textColor ?? UIColor.black;
            self.titleLabel.font = UIFont.systemFont(ofSize: self.config?.fontSize ?? CGFloat(17));
            self.titleLabel.text = title;
            self.titleLabel.snp.makeConstraints { (make) in
                make.centerX.equalTo(self);
                make.centerY.equalTo(self).offset(UIApplication.shared.statusBarFrame.height/2);
            };
        }
       
        if let left = config?.leftImage {
            self.addSubview(self.leftBtn);
            
            self.leftBtn.snp.makeConstraints { (make) in
                make.centerY.equalTo(self.titleLabel);
                make.left.equalTo(self).offset(15);
            };
            if let image = UIImage.init(named: left) {
                self.leftBtn.setImage(image, for: .normal);
            }else{
                self.leftBtn.setTitle(left, for: .normal);
            }
        }
        
        if let right = config?.rightAny {
            self.addSubview(self.rightBtn);
            self.rightBtn.snp.makeConstraints { (make) in
                make.centerY.equalTo(self.titleLabel);
                make.right.equalTo(self).offset(-15);
            };
            
            if let image = UIImage.init(named: right) {
                self.leftBtn.setImage(image, for: .normal);
            }else{
                self.leftBtn.setTitle(right, for: .normal);
            }
        }
    }
    
     static public func TTNavigationSettingConfig(Config:TTNavigationConfig,_ leftBtnClick: ()->Void)->TTNavigationView{
       let view = TTNavigationView.init(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 88), leftString: Config.leftImage, title: Config.title, rightAny: Config.rightAny ?? [],config: Config);
        Config.superView.addSubview(view)
        view.leftBtn.addTarget(view, action: #selector(view.awqe), for: .touchUpInside);
        return view;
    }
    
    @objc func awqe() {
        
    }
}
