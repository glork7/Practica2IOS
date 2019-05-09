//
//  ViewController.swift
//  practica2
//
//  Created by Alumne on 29/04/2019.
//  Copyright © 2019 GRV. All rights reserved.
//

import UIKit
import AVFoundation



class ViewController: UIViewController {

    @IBOutlet var PlayButton: UIBarButtonItem!
    var player:AVAudioPlayer?
    var instruments:AVAudioPlayer?
    let audioFile = "harry"
    let audioFile1 = "flute"
    let audioFile2 = "trumpet"
    let audioFile3 = "violin"
    let audioFile4 = "guitar"
    let audioFile5 = "lalala"
    let audioFile6 = "drum"
    
    @IBAction func tap(_ sender: UITapGestureRecognizer) {
        setOffAudio()
        if let Image1URL = Bundle.main.url(forResource: audioFile1, withExtension: "mp3"){
            instruments = try! AVAudioPlayer(contentsOf: Image1URL)
            instruments!.play()
        }
        
    }
    
    @IBAction func tap2(_ sender: UITapGestureRecognizer) {
        setOffAudio()
        if let Image1URL = Bundle.main.url(forResource: audioFile2, withExtension: "wav"){
            instruments = try! AVAudioPlayer(contentsOf: Image1URL)
            instruments!.play()
        }
        
    }
    
    @IBAction func tap3(_ sender: UITapGestureRecognizer) {
        setOffAudio()
        if let Image1URL = Bundle.main.url(forResource: audioFile3, withExtension: "wav"){
            instruments = try! AVAudioPlayer(contentsOf: Image1URL)
            instruments!.play()
        }
    }
    
    @IBAction func tap4(_ sender: UITapGestureRecognizer) {
        setOffAudio()
        if let Image1URL = Bundle.main.url(forResource: audioFile4, withExtension: "wav"){
            instruments = try! AVAudioPlayer(contentsOf: Image1URL)
            instruments!.play()
        }
    }
    
    @IBAction func tap5(_ sender: UITapGestureRecognizer) {
        setOffAudio()
        if let Image1URL = Bundle.main.url(forResource: audioFile5, withExtension: "wav"){
            instruments = try! AVAudioPlayer(contentsOf: Image1URL)
            instruments!.play()
        }
    }
    
    @IBAction func tap6(_ sender: UITapGestureRecognizer) {
        setOffAudio()
        if let Image1URL = Bundle.main.url(forResource: audioFile6, withExtension: "mp3"){
            instruments = try! AVAudioPlayer(contentsOf: Image1URL)
            instruments!.play()
        }
    }
    
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        do{
            try AVAudioSession.sharedInstance().setActive(true)
            audioStart()
            setOnAudio()
        } catch {
            print("Error")
        }
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.tap(_:)))
        self.view.addGestureRecognizer(tapGesture)
        self.view.isUserInteractionEnabled = true
        
    }
    
    
    @IBAction func PlayActionButton(_ sender: UIBarButtonItem) {
        
        
        if sender.tag == 0 {
            if player!.isPlaying{
                 setOffAudio()
            }else {
                 setOnAudio()
            }
        }else {
            resetAudio()
        }
    }
    private func audioStart(){
        if let backgroundURL = Bundle.main.url(forResource: audioFile, withExtension: "wav"){
            player = try! AVAudioPlayer(contentsOf: backgroundURL)
            player!.numberOfLoops=Int(-1)
            player!.prepareToPlay()
            }
        }


    private func setOnAudio() {
        player!.play()
        self.PlayButton.title = "Pause"
    }
    
    private func setOffAudio() {
        player!.pause()
        self.PlayButton.title = "Play"
    }
    
    private func resetAudio(){
        player!.currentTime = 0
        setOffAudio()
    }
    
    
    
    
}

