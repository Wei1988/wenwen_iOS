//
//  GCDHelper.swift
//  wenwen
//
//  Created by Wei Zhang on 2017/11/11.
//  Copyright © 2017年 wenwenkeji. All rights reserved.
//

import Foundation

typealias WWVoidBlock = (() -> Void)

func UIThreadRun(_ mainTask:@escaping () -> Void) {
    DispatchQueue.main.async(execute: mainTask)
}

// used in network request, fast cache, UI prepare
func highProrityThreadRun(_ mainTask:@escaping () -> Void) {
    DispatchQueue.global(qos: .userInteractive).async(execute: mainTask)
}

// used in background operations
func lowProrityThreadRun(_ mainTask:@escaping () -> Void) {
    DispatchQueue.global(qos: .background).async(execute: mainTask)
}

@discardableResult
func delay(_ time: TimeInterval, task:@escaping () -> Void) -> ((_ cancel: Bool) -> Void)? {
    func dispatch_later(_ block:@escaping () -> Void) {
        DispatchQueue.main.asyncAfter(
            deadline: DispatchTime.now() + Double(Int64(time * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC),
            execute: block)
    }
    
    var closure: (WWVoidBlock)? = task
    var result: ((_ cancel: Bool) -> Void)?
    let delayedClosure: (_ cancel: Bool) -> Void = {
        cancel in
        if let internalClosure = closure {
            if !cancel {
                DispatchQueue.main.async(execute: internalClosure)
            }
        }
        closure = nil
        result = nil
    }
    result = delayedClosure
    dispatch_later {
        if let delayedClosure = result {
            delayedClosure(false)
        }
    }
    return result
}

func cancel(_ task: ((_ cancel: Bool) -> Void)?) {
    task?(true)
}
