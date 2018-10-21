//
//  AppDelegate.swift
//  StarlingDemoApp
//
//  Created by Matthew Reagan on 10/20/18.
//

import Cocoa
import Starling_Mac

extension SoundIdentifier {
    static let zrr = SoundIdentifier("zrr")
    static let radar = SoundIdentifier("radar")
}

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!
    @IBOutlet weak var overlapCheckbox: NSButton!
    
    let starling = Starling()
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        
        starling.load(resource: "zrr", type: "wav", for: .zrr)
        starling.load(resource: "radarPulse", type: "wav", for: .radar)
        
        // Continually prints debug information
        // to the console. Useful to monitor
        // the general state of the sound engine:
        //
        // starling.beginPeriodicDiagnostics()
    }


    // MARK: - Demo Actions
    
    @IBAction func playEffect1Clicked(_ sender: Any) {
        starling.play(.zrr, allowOverlap: overlapCheckbox.state == .on)
    }
    
    
    @IBAction func playEffect2Clicked(_ sender: Any) {
        starling.play(.radar, allowOverlap: overlapCheckbox.state == .on)
    }
    
    @IBAction func playBothClicked(_ sender: Any) {
        starling.play(.zrr, allowOverlap: overlapCheckbox.state == .on)
        starling.play(.radar, allowOverlap: overlapCheckbox.state == .on)
    }
}

