//
//  stopWatch.swift
//  Stopwatch
//
//  Created by administrator on 3/16/19.
//  Copyright © 2019 Jeffrey Marple. All rights reserved.
//

import Foundation

extension Notification.Name{
    static let timerUpdated = Notification.Name("timerUpdated")
}


protocol StopwatchDelegate{
    func timerUpdated()
}

class stopWatch{
    
    var delegate: StopwatchDelegate?
    var timeCount = 0.0{
        didSet{
            delegate?.timerUpdated()
            NotificationCenter.default.post(name: .timerUpdated, object: nil)
        }
    }
    
    var isRunning: Bool {
        return timer != nil
    }
    
    private var timer: Timer?
    
    func start(){
        
        if timer == nil{
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true,
                block: { (timer) in
                    self.timeCount += 0.1
                })
        }
    }
    
    func stop(){
        
        timer?.invalidate()
        timer = nil
    }
    
    func reset(){
        timeCount = 0
    }
    
}
