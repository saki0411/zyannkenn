//
//  startViewController.swift
//  zyannkenn
//
//  Created by saki on 2023/01/18.
//

import UIKit

class startViewController: UIViewController {
    @IBOutlet var countLabel: UILabel!
    
    var time = 4
        var timer = Timer()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        // Do any additional setup after loading the view.
    }
    

    @IBAction func start(){
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { (timer) in
                   self.time -= 1
                   self.countLabel.text = String(self.time)

                   if self.time == 0 {
                       self.performSegue(withIdentifier: "next", sender: nil)
                   }
               })
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            timer.invalidate()
        }
}
