//
//  CountDown.swift
//  CountDown_Swift
//
//  Created by 天轩 on 2019/6/29.
//  Copyright © 2019 天轩. All rights reserved.
//

import UIKit

open class TTCountDown: NSObject {
    var timer:DispatchSourceTimer?
    var dateFormatter:DateFormatter?
   public override init() {
        super.init();
        dateFormatter = DateFormatter.init();
        dateFormatter?.dateFormat = "YYYY-MM-dd HH:mm:ss";
        let timeZone:TimeZone = NSTimeZone.local;
        self.dateFormatter?.timeZone = timeZone;
    }
    /**
     用NSDate进行倒计时
     */
    open func countDownWithStratDate(startDate:NSDate,endDate:NSDate,block:@escaping (_ day:String,_ hour:String,_ minute:String,_ second:String)->Void)->Void{
        var timeInval = endDate.timeIntervalSince(startDate as Date);
        
            timer = DispatchSource.makeTimerSource();
            timer?.schedule(deadline: .now(), repeating: 1);
            timer?.setEventHandler(handler: {
                if timeInval<0{
                    self.timer?.cancel();
                    DispatchQueue.main.async {
                       block("0","0","0","0");
                    }
                }else{
                    timeInval = timeInval-1;
                    let inv:Int = Int(timeInval);
                    let day = Int(inv/(3600*24));
                    let hours = (Int(inv)-day*24*3600)/3600;
                    let minute = (inv-day*24*3600-hours*3600)/60;
                    let second = Int(inv)-Int(day*24*3600)-Int(hours*3600)-Int(minute*60)
                    DispatchQueue.main.async {
                        if day==0&&hours==0&&minute==0&&second==0 {
                            self.timer?.cancel();
                        }
                        var hourseString = "";
                        if hours>9 {
                            hourseString = "0\(hours)";
                        }else{
                            hourseString = "\(hours)";
                        }
                        var minString = "";
                        if minute>9 {
                            minString = "0\(minute)";
                        }else{
                            minString = "\(minute)";
                        }
                        var sString = "";
                        if second>9 {
                            sString = "0\(second)";
                        }else{
                            sString = "\(second)";
                        }
                    block("\(day)",hourseString,minString,sString);
                    }
                }
            })
            //启动定时器
        if #available(iOS 10.0, *) {
            timer?.activate()
        } else {
            // Fallback on earlier versions
            timer?.resume();
        }
    }
    
    /**
     使用时间戳来
     */
    open func countDownWithStratTimeStamp(startTimeStamp:Int,endTimeStamp:Int, block:@escaping (_ day:String,_ hour:String,_ minute:String,_ second:String)->Void)->Void{
        
        var timeInval = endTimeStamp - startTimeStamp;
        timer = DispatchSource.makeTimerSource();
        timer?.schedule(deadline: .now(), repeating: 1);
        timer?.setEventHandler(handler: {
            if timeInval<0{
                self.timer?.cancel();
                DispatchQueue.main.async {
                    block("0","0","0","0");
                }
            }else{
                timeInval = timeInval-1;
                let inv:Int = Int(timeInval);
                let day = Int(inv/(3600*24));
                let hours = (Int(inv)-day*24*3600)/3600;
                let minute = (inv-day*24*3600-hours*3600)/60;
                let second = Int(inv)-Int(day*24*3600)-Int(hours*3600)-Int(minute*60)
                DispatchQueue.main.async {
                    if day==0&&hours==0&&minute==0&&second==0 {
                        self.timer?.cancel();
                    }
                    var hourseString = "";
                    if hours>9 {
                          hourseString = "\(hours)";
                    }else{
                        hourseString = "0\(hours)";
                    }
                    var minString = "";
                    if minute>9 {
                        minString = "\(minute)";
                    }else{
                        minString = "0\(minute)";
                    }
                    var sString = "";
                    if second>9 {
                        sString = "\(second)";
                    }else{
                        sString = "0\(second)";
                    }
                    block("\(day)",hourseString,minString,sString);
                }
            }
        })
        //启动定时器
        if #available(iOS 10.0, *) {
            timer?.activate()
        } else {
            // Fallback on earlier versions
            timer?.resume();
        }
    }
    
    /**使用定时器按设置的固定秒回调*/
    open func countDownWithPER_SEC(sec:Double,block:@escaping ()->Void){
        timer = DispatchSource.makeTimerSource();
        timer?.schedule(deadline: .now(), repeating: sec);
        timer?.setEventHandler(handler: {
            block();
        })
        //启动定时器
        if #available(iOS 10.0, *) {
            timer?.activate()
        } else {
            timer?.resume();
            // Fallback on earlier versions
        }
    }
    
    public func destoryTimer(){
        self.timer?.cancel();
    }
}
