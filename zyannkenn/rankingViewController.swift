//
//  rankingViewController.swift
//  zyannkenn
//
//  Created by saki on 2023/01/20.
//

import UIKit

class rankingViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var TableView: UITableView!
    @IBOutlet var seikailabel: UILabel!
    @IBOutlet var timeLabel: UILabel!
    
    
    var timeArray = [String]()
    var time2Array = [String]()
    var seikaiArray = [String]()
    var seikai2Array = [String]()
    let saveData: UserDefaults = UserDefaults.standard
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        seikai2Array = saveData.object(forKey: "seikai") as! [String]
        time2Array = saveData.object(forKey: "time") as! [String]

        print(seikai2Array)
        print(time2Array.last!)
       
        if time2Array.contains(timeArray) {
            
            print("a")
          
        }else{
            seikai2Array.append(contentsOf: seikaiArray)
                        time2Array.append(contentsOf: timeArray)
            print(seikai2Array)
            print(time2Array.last!)
            print(timeArray.last!)
            // Do any additional setup after loading the view.
           
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
          super.viewWillAppear(animated)
        TableView.reloadData()
        
       
        }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return time2Array.count
       
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // セルを取得する
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let label1 = cell.contentView.viewWithTag(1) as! UILabel
              let label2 = cell.contentView.viewWithTag(2) as! UILabel
        
        
        
        
        saveData.set(seikai2Array, forKey: "seikai")
        saveData.set(time2Array, forKey: "time")
       
    
        time2Array.sort()
        label1.text = seikai2Array[indexPath.row]
        label2.text = time2Array[indexPath.row]
       
        
        
        
        saveData.set(seikai2Array, forKey: "seikai")
        saveData.set(time2Array, forKey: "time")
        
    
        
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

   
    
    @IBAction func sakuzyo(){
        seikai2Array = saveData.object(forKey: "seikai") as! [String]
        seikai2Array = [String]()
        time2Array = saveData.object(forKey: "time") as! [String]
        time2Array = [String]()
        saveData.set(seikai2Array, forKey: "seikai")
        saveData.set(time2Array, forKey: "time")
        
        
        TableView.reloadData()
    }
}

