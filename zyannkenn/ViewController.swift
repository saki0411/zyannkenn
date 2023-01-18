//
//  ViewController.swift
//  zyannkenn
//
//  Created by saki on 2022/11/25.
//

import UIKit


class ViewController: UIViewController {
    @IBOutlet var ImageView: UIImageView!
    @IBOutlet var Label: UILabel!
  
    
    var index: Int = 0
    var aite: Int!
    var syouhai: Int = 0
    var scoreArray = [String]()
    var kaisu: Int! = 0
    var seikai: Int! = 0
    var count: Float = 0.0
    var timer: Timer = Timer()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        aite = Int.random(in: 1...3)
        
        if !timer.isValid{
            timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(self.up), userInfo: nil, repeats: true)
        }
    }
    

    @IBAction func hazimeru(){
        
        
    }
    
    
    @IBAction func gu(){
        aite = Int.random(in: 1...3)
        index = 1
        
        if aite == 1{
            ImageView.image = UIImage(named: "janken_gu")
        }else if aite == 2{
            ImageView.image = UIImage(named: "janken_pa")
        }else{
            ImageView.image = UIImage(named: "janken_choki")
        }
        
        if aite == 1 && index == 1{
            Label.text = "あいこ！"
            syouhai = 1
            scoreArray.append("あいこ")
            kaisu += 1
            
        }else if aite == 2 && index == 1{
            Label.text = "まけ！"
            scoreArray.append("まけ")
            syouhai = 2
            kaisu += 1
        }else if aite == 3 && index == 1{
            Label.text = "かち！"
            scoreArray.append("かち")
            syouhai = 3
            kaisu += 1
            seikai += 1
        }
        
      
        
        if kaisu == 10{
            self.performSegue(withIdentifier: "tothird", sender: nil)
        }
    }
    @IBAction func pa(){
        aite = Int.random(in: 1...3)
        index = 2
        
        if aite == 1{
            ImageView.image = UIImage(named: "janken_gu")
        }else if aite == 2{
            ImageView.image = UIImage(named: "janken_pa")
        }else{
            ImageView.image = UIImage(named: "janken_choki")
        }
        
       
        
        if aite == 1 && index == 2{
            Label.text = "かち！"
            scoreArray.append("かち")
            syouhai = 3
            kaisu += 1
            seikai += 1
        }else if aite == 2 && index == 2{
            Label.text = "あいこ！"
            scoreArray.append("あいこ")
            syouhai = 1
            kaisu += 1
        }else if aite == 3 && index == 2{
            Label.text = "まけ！"
            scoreArray.append("まけ")
            syouhai = 2
            kaisu += 1
        }
        
        
        
        if kaisu == 10{
            self.performSegue(withIdentifier: "tothird", sender: nil)
        }
    }
    
    @IBAction func tyoki(){
        aite = Int.random(in: 1...3)
        index = 3
        
        if aite == 1{
            ImageView.image = UIImage(named: "janken_gu")
        }else if aite == 2{
            ImageView.image = UIImage(named: "janken_pa")
        }else{
            ImageView.image = UIImage(named: "janken_choki")
        }
        
        
        
        if aite == 1 && index == 3{
            Label.text = "まけ！"
            scoreArray.append("まけ")
            syouhai = 2
            kaisu += 1
        }else if aite == 2 && index == 3{
            Label.text = "かち！"
            scoreArray.append("かち")
            syouhai = 3
            kaisu += 1
            seikai += 1
        }else if aite == 3 && index == 3{
            Label.text = "あいこ！"
            scoreArray.append("あいこ")
            syouhai = 1
            kaisu += 1
        }
        
        if kaisu == 10{
            self.performSegue(withIdentifier: "tothird", sender: nil)
            if timer.isValid{
                timer.invalidate()
            }
        }
        
       
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toNext" {
            let nextView = segue.destination as! SenrekiViewController
            nextView.syouhai = syouhai
            nextView.scoreArray = scoreArray
        }
        if segue.identifier == "tothird" {
            let nextnextView = segue.destination as! finishViewController
            nextnextView.seikai = seikai
            nextnextView.count = count
           
        }
    }
    @objc func up(){
        count = count + 0.01
        
    }
    
    
}
    
  
