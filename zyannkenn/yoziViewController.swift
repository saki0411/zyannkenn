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
    
    var tappedImage : String = ""
    
    
    let saveData: UserDefaults = UserDefaults.standard
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if saveData.object(forKey: "yozi") as? [String] != nil{
            yoziArray = saveData.object(forKey: "yozi") as! [String]
        }
       
        if yozi != nil , yozi != 10 {
            yoziArray[yozi] = String(yozi)
            print(yoziArray)
            print(yozi)
        }else{
           
        }
        
        
        
        
        
        
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        colectionview.reloadData()
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return yoziArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // タップしたセルの画像を取得
        tappedImage = yoziArray[indexPath.item]
        print(tappedImage)
        self.performSegue(withIdentifier: "tobig", sender: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     
        if segue.identifier == "tobig" {
         
            let nextView = segue.destination as! DetailViewController
            nextView.kazu = tappedImage
        }
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

