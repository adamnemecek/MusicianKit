//
//  PostTonalTools.swift
//  MusicianKit
//
//  Created by Nikhil Singh on 9/24/17.
//  Copyright © 2017 Nikhil Singh. All rights reserved.
//

import UIKit

public typealias PitchClass = Int

public enum MatrixForm {
    case p, i, r, ri
}

open class PostTonalTools {
    
    private static let notes: Dictionary<String, Int> = ["C": 0, "D": 2, "E": 4, "F": 5, "G": 7, "A": 9, "B": 11]

    public static func nn2n(_ noteNames: [String]) -> [PitchClass?] {
        return noteNames.flatMap { noteMap($0) }
    }
    
    public static func noteMap(_ noteName: String) -> PitchClass? {
        var ext = noteName.uppercased()
        let letter = ext.characters.popFirst()
        
        guard let letterName = letter else { return nil }
        guard var note = notes[String(letterName)] else { return nil }
        
        for c in ext.characters {
            switch String(c) {
            case "#": note += 1
            case "b": note -= 1
            case "x": note += 2
            default: return nil
            }
        }
        
        return note
    }
    
    public static func noteMap24(_ noteName: String) -> PitchClass? {
        var ext = noteName.uppercased()
        let letter = ext.characters.popFirst()
        
        guard let letterName = letter else { return nil }
        guard var note = notes[String(letterName)] else { return nil }
        note *= 2
        
        for c in ext.characters {
            switch String(c) {
            case "#": note += 2
            case "b": note -= 2
            case "x": note += 4
            case "+": note += 1
            case "d": note -= 1
            default: return nil
            }
        }
        
        return note
    }
}

