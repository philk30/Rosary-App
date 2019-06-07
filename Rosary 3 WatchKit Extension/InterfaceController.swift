//
//  InterfaceController.swift
//  Rosary 3 WatchKit Extension
//
//  Created by Phillip Rusa on 4/13/19.
//  Copyright © 2019 Rusa. All rights reserved.
//

import WatchKit
import Foundation
import WatchConnectivity


class InterfaceController: WKInterfaceController, WKCrownDelegate {

    
    @IBOutlet weak var Mystery: WKInterfaceLabel!
    @IBOutlet weak var BeadVal: WKInterfaceLabel!
    
    @IBAction func ResetValues() {
        Mystery.setText("---")
        BeadVal.setText("0")
        valueDisplay=0
        value=0
    }
    var BeadValue: Int = 1
    var value = 0
    var valueDisplay = 0
    var crownAccumulator = 0.0
    
    let FirstMysteries = ["The Resurrection of Jesus Christ", "The Annunciation of the Lord to Mary", "The Agony of Jesus in the Garden", "The Resurrection of Jesus Christ", "The Baptism in the Jordan", "The Agony of Jesus in the Garden","The Annunciation of the Lord to Mary" ]
    
    let SecondMysteries = ["The Ascension of Jesus to Heaven", "The Visitation of Mary to Elizabeth", "The Scourging at the Pillar", "The Ascension of Jesus to Heaven", "The Wedding at Cana", "The Scourging at the Pillar","The Ascension of Jesus to Heaven"]
    
    let ThirdMysteries = ["The Descent of the Holy Ghost","The Nativity of our Lord Jesus Christ", "Jesus is Crowned with Thorns", "The Descent of the Holy Ghost", "The Proclamation of the Kingdom", "Jesus is Crowned with Thorns", "The Nativity of our Lord Jesus Christ"]
    
    
    let FourthMysteries = ["The Assumption of Mary into Heaven", "The Presentation of our Lord", "Jesus Carried the Cross", "The Assumption of Mary into Heaven", "The Transfiguration", "Jesus Carried the Cross","The Presentation of our Lord"]
    
    let FifthMysteries = ["Mary is Crowned as Queen of Heaven and Earth", "Finding Jesus in the Temple at age 12", "The Crucifixion of our Lord", "Mary is Crowned as Queen of Heaven and Earth", "The Institution of the Eucharist", "The Crucifixion of our Lord", "Finding Jesus in the Temple at age 12"]
    
    let date = Date()
    let cal = Calendar.current
    let index = Calendar.current.component(.weekday, from: Date())
    
    
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        crownSequencer.delegate=self
        
        // Configure interface objects here.
    }
    
    
    func crownDidRotate(_ crownSequencer: WKCrownSequencer?, rotationalDelta: Double) {
        
        crownAccumulator += rotationalDelta
        
        
        
        if crownAccumulator > 0.5 {
            value += 1
            crownAccumulator = 0.0
            WKInterfaceDevice.current().play(.directionUp)
        } else if crownAccumulator < -0.5 {
            value -= 1
            crownAccumulator = 0.0
            WKInterfaceDevice.current().play(.directionDown)
        }
        
        switch value{
            
        case Int.min..<0:
            value = 0
            BeadVal.setText("0")
            Mystery.setText("---")
            
            
        case 0:
            valueDisplay = value
            
        case 1:
            Mystery.setText("---")
            BeadVal.setText("Apostle's Creed")
            
        case 2:
            Mystery.setText("---")
            BeadVal.setText("Our Father")
            
        case 3...5:
            Mystery.setText("---")
            valueDisplay = value - 2
            BeadVal.setText("Hail Mary: \(valueDisplay)")
            
        case 6...15:
            Mystery.setText("I: \(FirstMysteries[index-1])")
            valueDisplay = value - 5
            BeadVal.setText("Hail Mary: \(valueDisplay)")
        case 16, 27, 38, 49:
            //second mystery
            valueDisplay = value
            BeadVal.setText("\("Glory Be")")
            
        case 17...26:
            valueDisplay = value - 16
            Mystery.setText("II: \(SecondMysteries[index-1])")
            BeadVal.setText("Hail Mary: \(valueDisplay)")
            
            //case 27:
        //  valueDisplay = value
        case 28...37:
            Mystery.setText("III: \(ThirdMysteries[index-1])")
            valueDisplay = value - 27
            BeadVal.setText("Hail Mary: \(valueDisplay)")
            
            //case 38:
        //  valueDisplay = value
        case 39...48:
            Mystery.setText("IV: \(FourthMysteries[index-1])")
            valueDisplay = value - 38
            BeadVal.setText("Hail Mary: \(valueDisplay)")
            
            //case 49:
            valueDisplay = value
        case 50...59:
            Mystery.setText("V: \(FifthMysteries[index-1])")
            valueDisplay = value - 49
            BeadVal.setText("Hail Mary: \(valueDisplay)")
            
        case 59...Int.max:
            value = 59
            
            
        default:
            valueDisplay = value
        }
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
