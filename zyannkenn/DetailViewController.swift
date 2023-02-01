//
//  DetailViewController.swift
//  zyannkenn
//
//  Created by saki on 2023/01/29.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!
    
    var kazu = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // UIImageViewを作成し、画像を設定
        imageView.image = UIImage(named: kazu)
        print(kazu)
        print("a")
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
