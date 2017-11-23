//
//  TonalTools.swift
//  MusicianKit
//
//  Created by Nikhil Singh on 9/26/17.
//  Copyright © 2017 Nikhil Singh. All rights reserved.
//

import UIKit

infix operator =~

public enum HarmonicFunction {
    case undetermined, tonic, dominant, subdominant
}

public enum KeyType {
    case major, minor
    
    public var pattern: [Int] {
        return (self == .major) ? [0, 2, 4, 5, 7, 9, 11] : [0, 2, 3, 5, 7, 8, 10]
    }
}
