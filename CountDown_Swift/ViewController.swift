//
//  ViewController.swift
//  CountDown_Swift
//
//  Created by 天轩 on 2019/6/29.
//  Copyright © 2019 天轩. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var count:CountDown? = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let count = CountDown.init();
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
    }


}

