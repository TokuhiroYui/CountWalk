//
//  ViewController.swift
//  CountWalk
//
//  Created by 徳弘佑衣 on 2015/05/08.
//  Copyright (c) 2015年 徳弘佑衣. All rights reserved.
//


import UIKit
import CoreMotion

class ViewController: UIViewController {
    
    //表示するラベル
    @IBOutlet weak var label: UILabel!
    //CMPedometerの変数を作成
    let pedometer = CMPedometer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //メソッドを呼び出し
        self.startStepCounting()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    //カウント用メソッド
    func startStepCounting() {
        // CMPedometerが利用できるか確認
        if CMPedometer.isStepCountingAvailable() {
            // 計測開始
            pedometer.startPedometerUpdatesFromDate(NSDate(), withHandler: {
                data, error in dispatch_async(dispatch_get_main_queue(), {
                        // 歩数
                        let steps = data.numberOfSteps
                        // 結果をラベルに出力
                        self.label.text = "Steps: \(steps)"
                })
            })
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

