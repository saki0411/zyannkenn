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
    
    
    
    var seikai: Int = 0
    var count: Float = 0.0
    var timeArray = [String]()
    var seikaiArray = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        seitoukaisuLabel.text = String(seikai)
        timekekkaLabel.text = String(format: "%.2f", count)
        timeArray.append(String(format: "%.2f", count ))
        seikaiArray.append(String(seikai))
        
        
        // Do any additional setup after loading the view.
    }
    @IBAction func modoru(){
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "tostart" {
            let nextView = segue.destination as! startViewController
            nextView.timeArray = timeArray
            nextView.seikaiArray = seikaiArray
            
            
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
