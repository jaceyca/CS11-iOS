//
//  Geocache.swift
//  Lab3
//
//  Created by Jessica Choi on 10/29/17.
//  Copyright © 2017 Jessica Choi. All rights reserved.
//

import Foundation

struct GeoCache {
    var title: String
    var details: String
    var creator: String
    var reward: String
    
    init?(fromDictionary dict: [String: String]) {
        if let title = dict["title"] {
            self.title = title
        } else {
            return nil
        }
        if let details = dict["details"] {
            self.details = details
        } else {
            return nil
        }
        if let creator = dict["creator"] {
            self.creator = creator
        } else {
            return nil
        }
        if let reward = dict["reward"] {
            self.reward = reward
        } else {
            return nil
        }
    }
    
    var dictionary : [String: String] {
        let dict: [String: String] = ["title": title, "details": details, "creator": creator, "reward": reward]
        return dict
    }
    
    var description : String {
        let desc: String = "Title: \(title), details: \(details), creator: \(creator), reward: \(reward)"
        return desc
    }
}

func loadCachesFromDefaults() -> [GeoCache] {
    var geocaches: [GeoCache] = []
    if let defaults = UserDefaults.standard.array(forKey: "caches") {
        for i in defaults {
            let geo = i as! [String: String]
            geocaches.append(GeoCache (fromDictionary: geo)!)
        }
    }
    return geocaches
}

func saveCachesToDefaults(_ caches: [GeoCache]) {
    var cacheDict : [[String: String]] = []
    for i in caches {
        let geo = i.dictionary as [String: String]
        cacheDict.append(geo)
    }
    UserDefaults.standard.set(cacheDict, forKey:"caches")
    UserDefaults.standard.synchronize()
}








