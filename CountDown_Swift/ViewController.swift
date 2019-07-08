//
//  ViewController.swift
//  CountDown_Swift
//
//  Created by 天轩 on 2019/6/29.
//  Copyright © 2019 天轩. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    convenience init(name:String) {
        self.init()
    }
    
    var count:TTCountDown? = nil
    override func viewDidLoad() {
        super.viewDidLoad()
     
        let count = TTCountDown.init();
        //使用时间来倒计时
//      count.countDownWithStratDate(startDate: NSDate.init(), endDate: NSDate.init(timeIntervalSinceNow: 2000)) { (day, hours, mine, sec) in

//            print("\(day)==\(hours)==\(mine)===\(sec)");
//        }
        
        
        var cc = 0;
        //按固定秒数来刷新数据
        count.countDownWithPER_SEC(sec: 5) {
            cc = cc+1;
            if cc == 5 {
                //销毁
                count.destoryTimer()
            }
            print("111");
        }
        self.count = count;
        
        
//        let ttnav = TTNavigationView.init(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 88), leftImageOrString: "",title: "首页");
//        ttnav.backgroundColor = UIColor.red
//        self.view.addSubview(ttnav);
        
      let config = TTNavigationConfig.init(title: "biaoti", leftImage: "111", rightAny: [])
        TTNavigationView.TTNavigationSettingConfig(Config: config) {
            
        };
        
        
        
    }

}

