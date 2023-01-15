//
//  SenrekiViewController.swift
//  zyannkenn
//
//  Created by saki on 2023/01/15.
//

import UIKit

class SenrekiViewController: UIViewController {
    @IBOutlet var label: UILabel!

    var syouhai : Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(syouhai)
        label.text = String(syouhai)
        

        // Do any additional setup after loading the view.
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
