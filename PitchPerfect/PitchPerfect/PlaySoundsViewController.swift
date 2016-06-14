//
//  PlayViewController.swift
//  PitchPerfect
//
//  Created by Ranjith on 6/10/16.
//  Copyright © 2016 Ranjith. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {
    
    var recordedAudioURL: NSURL!
    var audioFile:AVAudioFile!
    var audioEngine:AVAudioEngine!
    var audioPlayerNode:AVAudioPlayerNode!
    var stopTimer:NSTimer!
    
    @IBOutlet weak var snailButton: UIButton!
    @IBOutlet weak var RabbitButton: UIButton!
    @IBOutlet weak var ChipmuckButton: UIButton!
   
    @IBOutlet weak var EchoButton: UIButton!
    @IBOutlet weak var ReverbButton: UIButton!
    @IBOutlet weak var DarthVaderButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    enum ButtonType: Int  { case Slow = 0, Fast, Chipmunk, Vader, Echo, Reverb }
    
    @IBAction func playSoundForButton(sender: UIButton)
    {
        print("play")
        switch(ButtonType(rawValue: sender.tag)!){
        case .Slow:
            playSound(rate:0.5)
        case .Fast:
            playSound(rate:1.5)
        case .Chipmunk:
            playSound(pitch:1000)
        case .Vader:
            playSound(pitch:-1000)
        case .Echo:
            playSound(echo:true)
        case .Reverb:
            playSound(reverb:true)
            
        }
        
        configureUI(.Playing)
        
    }
    
    @IBAction func stopButtonPressed(sender: AnyObject){
        print("stop")
        stopAudio()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAudio()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        configureUI(.NotPlaying)
    }
}

