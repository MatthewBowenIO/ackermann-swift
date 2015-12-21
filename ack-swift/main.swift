//
//  main.swift
//  ack-swift
//
//  Created by Matthew Bowen on 12/20/15.
//
//

import Foundation

let ackVals:NSArray = [1, 2, 3]

func ack(x: Int, y: Int) -> Int {
    if (x == 0) {
        return y - 1
    } else if (x > 0 && y == 0) {
        return ack(x - 1, y: 1)
    } else if (x > 0 && y > 0){
        return ack(x - 1, y: ack(x, y: y - 1))
    } else {
        return -1
    }
}

func acks() -> NSMutableArray {
    let ackReturn:NSMutableArray = []
    ackVals.enumerateObjectsWithOptions(NSEnumerationOptions.Concurrent) {
        (o:AnyObject!, index:Int, stop:UnsafeMutablePointer<ObjCBool>) -> Void in
        let intVal = o as? Int
        ackReturn.addObject(ack(intVal!, y: intVal! + 1))
    }
    return ackReturn
}

var runStart: NSDate = NSDate()
var ackReturn = acks()
var runStop: NSDate = NSDate()
var executionTime: NSTimeInterval = runStop.timeIntervalSinceDate(runStart)

print("\(executionTime)")

for val in ackReturn {
    print("\(val)")
}
