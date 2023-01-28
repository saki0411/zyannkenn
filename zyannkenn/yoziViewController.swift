//
//  yoziViewController.swift
//  zyannkenn
//
//  Created by saki on 2023/01/28.
//

import UIKit

class yoziViewController: UIViewController, UICollectionViewDelegate,UICollectionViewDataSource {
   
    @IBOutlet var colectionview: UICollectionView!
    
    var yozi: Int = 10
    
    var yoziArray = ["10","10","10","10","10","10","10","10","10","10"]
  
   
    
    let saveData: UserDefaults = UserDefaults.standard
  
  
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(yozi)
       
        yoziArray = saveData.object(forKey: "yozi") as! [String]
      
        yoziArray[yozi] = String(yozi)
       
      
       
        
            
        // Do any additional setup after loading the view.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return yoziArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
       
        
        let imageView = cell.contentView.viewWithTag(1)as! UIImageView
        let cellImage = UIImage(named: yoziArray[indexPath.row])
        imageView.image = cellImage
        
        saveData.set(yoziArray, forKey: "yozi")
        return cell
      
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
