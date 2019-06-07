//
//  PrayersInterfaceController.swift
//  Rosary 3 WatchKit Extension
//
//  Created by Phillip Rusa on 4/19/19.
//  Copyright © 2019 Rusa. All rights reserved.
//

import WatchKit
import Foundation
import WatchConnectivity


class PrayersInterfaceController: WKInterfaceController {

    
    @IBOutlet weak var PrayerBox: WKInterfaceLabel!
    @IBOutlet weak var PrayerHeader: WKInterfaceLabel!
    

    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        self.setTitle("Close")
        
        let Prayers = context as? [String]
        //let PrayerText = context as? String
        //let PrayerTitle = context as? String
        
        let PrayerText = Prayers![0]
        let PrayerTitle = Prayers![1]
        
        PrayerHeader.setText(PrayerText)
        PrayerBox.setText(PrayerTitle)
        
        // Configure interface objects here.
    }
    
    
   
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
