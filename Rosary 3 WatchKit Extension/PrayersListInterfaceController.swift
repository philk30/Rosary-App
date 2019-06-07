//
//  PrayersListInterfaceController.swift
//  Rosary 3 WatchKit Extension
//
//  Created by Phillip Rusa on 4/13/19.
//  Copyright © 2019 Rusa. All rights reserved.
//

import Foundation
import WatchKit
import WatchConnectivity



class PrayersListInterfaceController: WKInterfaceController, WKCrownDelegate {

    var PrayerText: String = ""
    var PrayerTitle: String = ""
    //var Prayers = [String]()

    
    @IBAction func OurFather() {
        //PrayerBox.setText("Hail Mary:v \(PrayerText)")
    }
    

    
    override func contextForSegue(withIdentifier segueIdentifier: String) -> Any? {
        
        switch(segueIdentifier){
            
        case "OurFatherSegue":
            PrayerTitle = "Lord's Prayer"
            PrayerText = "Our Father, Who art in Heaven, hallowed be Your name; Your Kingdom come, Your will be done on earth as it is in Heaven. Give us this day our daily bread; and forgive us our trespasses as we forgive those who trespass against us; and lead us not into temptation, but deliver us from evil. Amen."

            
        case "HailMarySegue":
            PrayerTitle = "Hail Mary"
            PrayerText = "Hail Mary full of Grace, the Lord is with thee. Blessed are you among women and blessed is the fruit of your womb Jesus. Holy Mary Mother of God, pray for us sinners now and at the hour of our death Amen. "
            
        case "GloryBeSegue":
            PrayerTitle = "Glory Be"
            PrayerText = "Glory be to the Father and to the Son and to the Holy Spirit. As it was in the beginning is now, and ever shall be, world without end. Amen. "
        
        case "ApostlesCreedSegue":
            PrayerTitle = "Apostle's Creed"
            PrayerText = "I believe in God, the Father Almighty, Creator of Heaven and earth; and in Jesus Christ, His only Son Our Lord, He ascended into Heaven, and sitted at the right hand of God, the Father almighty; from then He shall come to judge the living and the dead."
            
        default:
            break
        }
        
        let Prayers = [PrayerTitle, PrayerText]
        //print(Prayers[0])
        

        
        return Prayers
        
        
        
    }
    

   
    
override func awake(withContext context: Any?) {
    super.awake(withContext: context)
    crownSequencer.delegate=self
    
    // Configure interface objects here.
}


override func willActivate() {
    // This method is called when watch view controller is about to be visible to user
    super.willActivate()
    crownSequencer.focus()
}

override func didDeactivate() {
    // This method is called when watch view controller is no longer visible
    super.didDeactivate()
}

}


