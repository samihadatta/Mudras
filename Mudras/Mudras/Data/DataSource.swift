//
//  DataSource.swift
//  Mudras
//
//  Created by Samiha Datta on 5/9/19.
//  Copyright © 2019 Samiha Datta. All rights reserved.
//

import UIKit

class DataSource {
    private var mudras = [Mudra]()
    private var sections = [String]()
    
    var count: Int {
        return mudras.count
    }
    
    var numberOfSections: Int {
        return sections.count
    }
    
    // MARK:- Public
    init() {
        mudras = loadMudrasFromDisk()
        for mudra in mudras {
            print(mudra.name)
        }
    }
    
    func indexPathForMudra(_ mudra: Mudra) -> IndexPath {
        // pre: receives a Mudra
        // post: returns provided Mudra's IndexPath
        let section = sections.firstIndex(of: mudra.type)!
        var item = 0
        for (index, currentMudra) in mudrasForSection(section).enumerated() {
            if currentMudra === mudra {
                item = index
                break
            }
        }
        return IndexPath(item: item, section: section)
    }
    
    func numberOfMudrasInSection(_ index: Int) -> Int {
        // pre: receives the index corresponding to a section in the sections array of this class
        // post: returns the number of mudras in that section
        let mudrasInSection = mudrasForSection(index)
        return mudrasInSection.count
    }
    
    func mudraForItemAtIndexPath(_ indexPath: IndexPath) -> Mudra? {
        // pre: receives an IndexPath
        // post: returns the Mudra object at that IndexPath or the Mudra object at the corresponding location in the mudras array
        if indexPath.section > 0 {
            let mudrasInSection = mudrasForSection(indexPath.section)
            return mudrasInSection[indexPath.item]
        } else {
            return mudras[indexPath.item]
        }
    }
    
    func titleForSectionAtIndexPath(_ indexPath: IndexPath) -> String? {
        // pre: returns an IndexPath
        // post: returns the section title for that IndexPath
        if indexPath.section < sections.count {
            return sections[indexPath.section]
        }
        return nil
    }
    
    
    // MARK:- Private
    private func loadMudrasFromDisk() -> [Mudra] {
        // pre: none
        // post: loads list of Mudra objects from Mudra.plist. returns array of Mudra objects from aforementioned list.
        sections.removeAll(keepingCapacity: false)
        if let path = Bundle.main.path(forResource: "Mudras", ofType: "plist") {
            if let dictArray = NSArray(contentsOfFile: path) {
                var mudras: [Mudra] = []
                for item in dictArray {
                    if let dict = item as? NSDictionary {
                        let name = dict["name"] as! String
                        let type = dict["type"] as! String
                        let meaning = dict["meaning"] as! String
                        let index = dict["index"] as! Int
//                        let indexPointer = dict["index"] as? String //NSNumber//as! Int
//                        let index = indexPointer != nil ? indexPointer!.toInt() : 0
                        let photo = dict["photo"] as! String
                        let mudra = Mudra(name: name, type: type, meaning: meaning, index: index, photo: photo)
                        if !sections.contains(type) {
                            sections.append(type)
                        }
                        mudras.append(mudra)
                    }
                }
                return mudras
            }
        }
        return []
    }
    
    private func absoluteIndexForIndexPath(_ indexPath: IndexPath) -> Int {
        // pre: receives an IndexPath
        // post: returns the absolute index of received IndexPath
        var index = 0
        for i in 0..<indexPath.section {
            index += numberOfMudrasInSection(i)
        }
        index += indexPath.item
        return index
    }
    
    private func mudrasForSection(_ index: Int) -> [Mudra] {
        // pre: receives an index corresponding to a section of mudras
        // post: returns an array of the Mudra objects in that section
        let section = sections[index]
        let mudrasInSection = mudras.filter { (mudra: Mudra) -> Bool in
            return mudra.type == section
        }
        return mudrasInSection
    }

}
