//
//  ViewController.swift
//  Lab3
//
//  Created by Jessica Choi on 10/29/17.
//  Copyright © 2017 Jessica Choi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var detailField: UITextField!
    @IBOutlet weak var creatorField: UITextField!
    @IBOutlet weak var rewardField: UITextField!
    @IBOutlet weak var cacheLabel: UITextView!
    
    var counter = 0
    
    @IBAction func addGeoCache(_ sender: UIButton) {
        let title = titleField.text
        let details = detailField.text
        let creator = creatorField.text
        let reward = rewardField.text
        
        if title == "" || details == "" || creator == "" || reward == "" {
            cacheLabel.text = "All fields need to be filled."
        } else {
            let dict: [String: String] = ["title": title!, "details": details!, "creator": creator!, "reward": reward!]
            let geo = GeoCache(fromDictionary: dict)
            var geocaches = loadCachesFromDefaults()
            geocaches.append(geo!)
            saveCachesToDefaults(geocaches)
        }
    }
    
    @IBAction func nextCache(_ sender: UIButton) {
        var Geocaches: [GeoCache] = loadCachesFromDefaults()
        counter += 1
        if counter >= Geocaches.count {
            counter = 0
        }
        if Geocaches.count > 0 {
            let geocache = Geocaches[counter]
            cacheLabel.text = geocache.description
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

