//
//  SafeEntry.swift
//  SafeEntry
//
//  Created by Charles on 4/12/20.
//

import Foundation

class SafeEntry {
    
    var datetime:Date
    var mainvenue:String
    var minorvenue:String
    
    init(datetime:Date, mainvenue:String, minorvenue:String) {
        self.datetime = datetime
        self.mainvenue = mainvenue
        self.minorvenue = minorvenue
    }
    
}
