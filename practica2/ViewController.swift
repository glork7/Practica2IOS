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

    @IBOutlet var flute: UIImageView!
    @IBOutlet var trumpet: UIImageView!
    @IBOutlet var violin: UIImageView!
    @IBOutlet var guitar: UIImageView!
    @IBOutlet var micro: UIImageView!
    @IBOutlet var drum: UIImageView!
    
    @IBOutlet var PlayButton: UIBarButtonItem!
    
    var player:AVAudioPlayer?
    var instruments:SystemSoundID = 0
    var pinchGesture = UIPinchGestureRecognizer()
    let audioFile = "harry"
    let audioFile1 = "flute"
    let audioFile2 = "trumpet"
    let audioFile3 = "violin"
    let audioFile4 = "guitar"
    let audioFile5 = "lalala"
    let audioFile6 = "drum"
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        do{
            try AVAudioSession.sharedInstance().setActive(true)
            audioStart()
            setOnAudio()
        } catch {
            print("Error")
        }
        
        pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(ViewController.pinch(_ :)))
        pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(ViewController.pinch2(_ :)))
        pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(ViewController.pinch3(_ :)))
        pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(ViewController.pinch4(_ :)))
        pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(ViewController.pinch5(_ :)))
        pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(ViewController.pinch6(_ :)))
    }
    
    @objc func pinchedView(_ sender: UIPinchGestureRecognizer,_ imageView: UIImageView) {
        switch sender.state{
        case .changed:
        self.view.bringSubviewToFront(imageView)
        sender.view?.transform = (sender.view?.transform)!.scaledBy(x: sender.scale, y: sender.scale)
        sender.scale = 1.0
        case .ended:
        sender.view?.transform = .identity
        default:
            break
        }
    }
    
    @IBAction func pinch(_ sender: UIPinchGestureRecognizer) {
        pinchedView(sender, flute)
    }
    @IBAction func pinch2(_ sender: UIPinchGestureRecognizer) {
        pinchedView(sender, trumpet)
    }
    @IBAction func pinch3(_ sender: UIPinchGestureRecognizer) {
        pinchedView(sender, violin)
    }
    @IBAction func pinch4(_ sender: UIPinchGestureRecognizer) {
        pinchedView(sender, guitar)
    }
    @IBAction func pinch5(_ sender: UIPinchGestureRecognizer) {
        pinchedView(sender, micro)
    }
    @IBAction func pinch6(_ sender: UIPinchGestureRecognizer) {
        pinchedView(sender, drum)
    }
    
    @objc func rotatedView(_ sender: UIRotationGestureRecognizer,_ imageView: UIImageView) {
        switch sender.state{
        case .changed:
                let animator = UIViewPropertyAnimator(duration: 1, curve: .easeInOut) {
                    imageView.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
                }
            animator.startAnimation()
        case .ended:
            sender.view?.transform = .identity
        default:
            break
            }
        
    }
    
    @IBAction func rotate(_ sender: UIRotationGestureRecognizer) {
        rotatedView(sender, flute)
    }
    
    @IBAction func rotate2(_ sender: UIRotationGestureRecognizer) {
        rotatedView(sender, trumpet)
    }
    @IBAction func rotate3(_ sender: UIRotationGestureRecognizer) {
        rotatedView(sender, violin)
    }
    @IBAction func rotate4(_ sender: UIRotationGestureRecognizer) {
        rotatedView(sender, guitar)
    }
    @IBAction func rotate5(_ sender: UIRotationGestureRecognizer) {
        rotatedView(sender, micro)
    }
    @IBAction func rotate6(_ sender: UIRotationGestureRecognizer) {
        rotatedView(sender, drum)
    }
    
    @IBAction func tap(_ sender: UITapGestureRecognizer) {
        setOffAudio()
        if let ImageURL = Bundle.main.url(forResource: audioFile1, withExtension: "mp3"){
            AudioServicesCreateSystemSoundID(ImageURL as CFURL, &instruments)
        }
        AudioServicesPlaySystemSound(instruments)
        
    }
    
    @IBAction func tap2(_ sender: UITapGestureRecognizer) {
        setOffAudio()
        if let ImageURL = Bundle.main.url(forResource: audioFile2, withExtension: "wav"){
            AudioServicesCreateSystemSoundID(ImageURL as CFURL, &instruments)
        }
        AudioServicesPlaySystemSound(instruments)
        
    }
    
    @IBAction func tap3(_ sender: UITapGestureRecognizer) {
        setOffAudio()
        if let ImageURL = Bundle.main.url(forResource: audioFile3, withExtension: "wav"){
            AudioServicesCreateSystemSoundID(ImageURL as CFURL, &instruments)
        }
        AudioServicesPlaySystemSound(instruments)
    }
    
    @IBAction func tap4(_ sender: UITapGestureRecognizer) {
        setOffAudio()
        if let ImageURL = Bundle.main.url(forResource: audioFile4, withExtension: "wav"){
            AudioServicesCreateSystemSoundID(ImageURL as CFURL, &instruments)
        }
        AudioServicesPlaySystemSound(instruments)
    }
    
    @IBAction func tap5(_ sender: UITapGestureRecognizer) {
        setOffAudio()
        if let ImageURL = Bundle.main.url(forResource: audioFile5, withExtension: "wav"){
            AudioServicesCreateSystemSoundID(ImageURL as CFURL, &instruments)
        }
        AudioServicesPlaySystemSound(instruments)
    }
    
    @IBAction func tap6(_ sender: UITapGestureRecognizer) {
        setOffAudio()
        if let ImageURL = Bundle.main.url(forResource: audioFile6, withExtension: "mp3"){
            AudioServicesCreateSystemSoundID(ImageURL as CFURL, &instruments)
        }
        AudioServicesPlaySystemSound(instruments)
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

