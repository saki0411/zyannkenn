//
//  finishViewController.swift
//  zyannkenn
//
//  Created by saki on 2023/01/18.
//

import UIKit

class finishViewController: UIViewController {
    @IBOutlet var seitouLabel: UILabel!
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var seitoukaisuLabel: UILabel!
    @IBOutlet var timekekkaLabel: UILabel!
    @IBOutlet var yozizyukugoLabel: UILabel!
    @IBOutlet var yoziLabel: UILabel!
    
    
    
    var seikai: Int = 0
    var count: Float = 0.0
    var timeArray = [String]()
    var seikaiArray = [String]()
    
    let date = Date()
    let df = DateFormatter()
    var dateArray = [String]()
    
    var yoziArray = ["明鏡止水","一期一会","風林火山","因果応報","試行錯誤","反面教師","臥薪嘗胆","温故知新","七転八起","本末転倒"]
    var yozirandom: Int = 10
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        seitoukaisuLabel.text = String(seikai)
        timekekkaLabel.text = String(format: "%.2f", count)
        timeArray.append(String(format: "%.2f", count ))
        seikaiArray.append(String(seikai))
        
        df.dateFormat = "MM/dd/yyyy hh:mm"
        dateArray.append(df.string(from: date))
        
        if seikai == 10{
            yoziLabel.text = "四字熟語獲得！"
            yozirandom  = Int.random(in: 0...9)
            yozizyukugoLabel.text = (yoziArray[yozirandom])
        }
        
        // Do any additional setup after loading the view.
    }
    @IBAction func modoru(){
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "tostart" {
            let nextView = segue.destination as! startViewController
            nextView.timeArray = timeArray
            nextView.seikaiArray = seikaiArray
            nextView.dateArray = dateArray
            nextView.yozi = yozirandom
            
            
            
        }
        
        
        /*
         // MARK: - Navigation
         
         // In a storyboard-based application, you will often want to do a little preparation before navigation
         override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         // Get the new view controller using segue.destination.
         // Pass the selected object to the new view controller.
         }
         */
        
    }
}
