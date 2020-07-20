//
//  ViewController.swift
//  Clef Buddy
//
//  Copyright 2020 MacMania Networks, LLC
//
//  Created by Benjamin Fryxell on 7/12/20.
//
import UIKit
import AVFoundation
class ViewController: UIViewController {
    let img = [UIImage.init(named: "b1.png"), UIImage.init(named: "b2.png"), UIImage.init(named: "b3.png"), UIImage.init(named: "b4.png"), UIImage.init(named: "b5.png"), UIImage.init(named: "b6.png"), UIImage.init(named: "b7.png"), UIImage.init(named: "b8.png"), UIImage.init(named: "b9.png"), UIImage.init(named: "b10.png"), UIImage.init(named: "b11.png"), UIImage.init(named: "b12.png"), UIImage.init(named: "b13.png"), UIImage.init(named: "b14.png"), UIImage.init(named: "b15.png"), UIImage.init(named: "b16.png"), UIImage.init(named: "b17.png"), UIImage.init(named: "b18.png"), UIImage.init(named: "b19.png"), UIImage.init(named: "b20.png"), UIImage.init(named: "b21.png"), UIImage.init(named: "b22.png"), UIImage.init(named: "r1.png"), UIImage.init(named: "r2.png"), UIImage.init(named: "r3.png"), UIImage.init(named: "r4.png"), UIImage.init(named: "r5.png"), UIImage.init(named: "r6.png"), UIImage.init(named: "r7.png"), UIImage.init(named: "r8.png"), UIImage.init(named: "r9.png"), UIImage.init(named: "r10.png"), UIImage.init(named: "r11.png"), UIImage.init(named: "r12.png"), UIImage.init(named: "r13.png"), UIImage.init(named: "r14.png"), UIImage.init(named: "r15.png"), UIImage.init(named: "r16.png"), UIImage.init(named: "t1.png"), UIImage.init(named: "t2.png"), UIImage.init(named: "t3.png"), UIImage.init(named: "t4.png"), UIImage.init(named: "t5.png"), UIImage.init(named: "t6.png"), UIImage.init(named: "t7.png"), UIImage.init(named: "t8.png"), UIImage.init(named: "t9.png"), UIImage.init(named: "t10.png"), UIImage.init(named: "t11.png"), UIImage.init(named: "t12.png"), UIImage.init(named: "t13.png"), UIImage.init(named: "t14.png"), UIImage.init(named: "t15.png"), UIImage.init(named: "t16.png"), UIImage.init(named: "t17.png"), UIImage.init(named: "t18.png"), UIImage.init(named: "t19.png"), UIImage.init(named: "t20.png"), UIImage.init(named: "t21.png"), UIImage.init(named: "t22.png")];
    let sounds = [6541, 7342, 8241, 8731, 9800, 11000, 12350, 13080, 14680, 16480, 17460, 19600, 22000, 24690, 26160, 29370, 32960, 34920, 39200, 44000, 49390, 52330, 14680, 16480, 17460, 19600, 22000, 24690, 26160, 29370, 32960, 34920, 39200, 44000, 49390, 52330, 58733, 65925, 19600, 22000, 24690, 26160, 29370, 32960, 34920, 39200, 44000, 49390, 52330, 58733, 65925, 69846, 78399, 88000, 98777, 104650, 117466, 131851, 139691];
    let notes = ["c", "d", "e", "f", "g", "a", "b",
        "c", "d", "e", "f", "g", "a", "b", "c", "d", "e", "f", "g", "a", "b", "c",
        "d", "e", "f", "g", "a", "b", "c", "d", "e", "f", "g", "a", "b", "c", "d", "e",
        "g", "a", "b", "c", "d", "e", "f", "g", "a", "b", "c", "d", "e", "f", "g", "a",
        "b", "c", "d", "e", "f"];
    var qstn = 0;
    var score = 0;
    var streak = 0;
    var level = "";
    var snd: AVAudioPlayer?;
    @IBOutlet weak var rightWrong: UILabel!
    @IBOutlet weak var scoreStreak: UILabel!
    @IBOutlet weak var imgContainer: UIImageView!
    @IBOutlet weak var aB: UIButton!
    @IBOutlet weak var bB: UIButton!
    @IBOutlet weak var cB: UIButton!
    @IBOutlet weak var dB: UIButton!
    @IBOutlet weak var eB: UIButton!
    @IBOutlet weak var fB: UIButton!
    @IBOutlet weak var gB: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func pressA(_ sender: Any) {
        gameFunc(ans: "a");
    }
    @IBAction func pressB(_ sender: Any) {
        gameFunc(ans: "b");
    }
    @IBAction func pressC(_ sender: Any) {
        gameFunc(ans: "c");
    }
    @IBAction func pressD(_ sender: Any) {
        gameFunc(ans: "d");
    }
    @IBAction func pressE(_ sender: Any) {
        gameFunc(ans: "e");
    }
    @IBAction func pressF(_ sender: Any) {
        gameFunc(ans: "f");
    }
    @IBAction func pressG(_ sender: Any) {
        gameFunc(ans: "g");
    }
    func gameFunc(ans: String)
      {
          if(ans == notes[qstn-1])
          {
              streak+=1;
              score+=1;
              rightWrong.text = "Correct!";
              let newScoreR = String(score) + "/" + String(streak);
              scoreStreak.text = newScoreR;
              playF(fq: sounds[qstn-1]);
          }
          else {
            streak+=1;
            rightWrong.text = "Sorry, it was " + notes[qstn-1].uppercased() + ".";
            let newScoreW = String(score) + "/" + String(streak);
            scoreStreak.text = newScoreW;
          }
          
          if(level == "easy"){
              qstn = Int.random(in: 1 ... 15);
          }
          else if(level == "medium"){
              qstn = Int.random(in: 1 ... 37);
          }
          else if(level == "hard"){
              qstn = Int.random(in: 1 ... 49);
          }
          else if(level == "inferno"){
              qstn = Int.random(in: 1 ... 59);
          }
         imgContainer.image = img[qstn-1];
      }
    @IBAction func easyButton(_ sender: Any) {
        level = "easy";
        aB.isEnabled = true;
        bB.isEnabled = true;
        cB.isEnabled = true;
        dB.isEnabled = true;
        eB.isEnabled = true;
        fB.isEnabled = true;
        gB.isEnabled = true;
        qstn = Int.random(in: 1 ... 15);
        imgContainer.image = img[qstn-1];
    }
    @IBAction func mediumButton(_ sender: Any) {
        level = "medium";
        aB.isEnabled = true;
        bB.isEnabled = true;
        cB.isEnabled = true;
        dB.isEnabled = true;
        eB.isEnabled = true;
        fB.isEnabled = true;
        gB.isEnabled = true;
        qstn = Int.random(in: 1 ... 37);
        imgContainer.image = img[qstn-1];
    }
    @IBAction func hardButton(_ sender: Any) {
        level = "hard";
        aB.isEnabled = true;
        bB.isEnabled = true;
        cB.isEnabled = true;
        dB.isEnabled = true;
        eB.isEnabled = true;
        fB.isEnabled = true;
        gB.isEnabled = true;
        qstn = Int.random(in: 1 ... 49);
        imgContainer.image = img[qstn-1];
    }
    @IBAction func infernoButton(_ sender: Any) {
        level = "inferno";
        aB.isEnabled = true;
        bB.isEnabled = true;
        cB.isEnabled = true;
        dB.isEnabled = true;
        eB.isEnabled = true;
        fB.isEnabled = true;
        gB.isEnabled = true;
        qstn = Int.random(in: 1 ... 59);
        imgContainer.image = img[qstn-1];
    }
    func playF(fq: Int)
    {
        let pathSmall = String(fq) + ".mp3";
        let pathLarge = Bundle.main.path(forResource: pathSmall, ofType:nil)!;
        let url = URL(fileURLWithPath: pathLarge)
        do {
            snd = try AVAudioPlayer(contentsOf: url)
            snd?.play()
        } catch {
            
        }
    }
    
    @IBAction func reset(_ sender: Any) {
        level = "";
        imgContainer.image = nil;
        score = 0;
        streak = 0;
        rightWrong.text = "";
        scoreStreak.text = "";
        aB.isEnabled = false;
        bB.isEnabled = false;
        cB.isEnabled = false;
        dB.isEnabled = false;
        eB.isEnabled = false;
        fB.isEnabled = false;
        gB.isEnabled = false;
    }
    
    @IBAction func toSite(_ sender: Any) {
        if let url = NSURL(string: "https://celloben.com")
        {
            UIApplication.shared.open(url as URL, options:[:], completionHandler:nil)
        }
    }
    
}
