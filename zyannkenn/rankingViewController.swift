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
    var dateArray = [String]()
    var date2Array = [String]()
    let saveData: UserDefaults = UserDefaults.standard
    var  zenbu: [String: String] = [:]
    var zenbunumber = Int()
    var zenbunumber2 = Int()
    var zenbunumber3 = Int()
    var zenbuArray = [[String]]()
    var zenbu2Array = [[[String]]]()
    var sectionTitle = [String]()
    var sectionnumber = Int()
    var zenbunumber4 =  [String]()
    var zenbunumber5 = Int()
    var zenbunumber6 = Int()
    var zenbunumber7 =  [[String]]()
    var time2 = String()
    
    
    var newValueIndex: Int?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(seikai2Array)
        print(time2Array)
        print(date2Array)
        if saveData.object(forKey: "seikai") as? [String] != nil{
            seikai2Array = saveData.object(forKey: "seikai") as! [String]
            time2Array = saveData.object(forKey: "time") as! [String]
            date2Array = saveData.object(forKey: "date") as! [String]
            
            
        }
        
        
        if time2Array.contains(timeArray) {
            
            print("a")
            
        }else{
            seikai2Array.append(contentsOf: seikaiArray)
            time2Array.append(contentsOf: timeArray)
            date2Array.append(contentsOf: dateArray)
            
            // Do any additional setup after loading the view.
            
        }
        
        
        
        zenbunumber = 0
        zenbunumber2 = 0
        zenbunumber3 = 0
        sectionnumber = 0
        
        
        //   zenbu = ["seikai": seikai2Array[0],"time": time2Array[0],"date": date2Array[0]]
        if zenbu2Array.contains(zenbuArray){
            print("c")
        }else{
            for _ in seikai2Array {
                
                zenbu.updateValue(seikai2Array[zenbunumber], forKey:String(zenbunumber) + "seikai" )
                zenbuArray.append(contentsOf: [Array(zenbu.values)])
                zenbu.removeValue(forKey:String(zenbunumber) + "seikai")
                
                zenbu.updateValue(time2Array[zenbunumber], forKey:String(zenbunumber2) + "time")
                zenbuArray.append(contentsOf: [Array(zenbu.values)])
                zenbu.removeValue(forKey:String(zenbunumber2) + "time")
                
                zenbu.updateValue(date2Array[zenbunumber], forKey:String(zenbunumber3) + "date" )
                zenbuArray.append(contentsOf: [Array(zenbu.values)])
                zenbu.removeValue(forKey:String(zenbunumber3) + "date")
                
                
                zenbu2Array.append(contentsOf: [zenbuArray])
                zenbuArray = []
                print(zenbu)
                
                zenbunumber += 1
                zenbunumber2 += 1
                zenbunumber3 += 1
                sectionnumber += 1
                zenbunumber4.append(String(zenbunumber))
                sectionTitle.append(String(sectionnumber + 1))
                print(zenbunumber4)
            }
            
            
            
        }
        print(zenbu)
        print(zenbuArray)
        print(zenbu2Array)
        
        zenbu2Array.sort{$0[1][0] < $1[1][0]}
        
        /*    zenbu2Array.sort{$0[1] > $1[1]}
         for i in 0 ..< 10{
         let a = zenbu2Array[i][0]
         let b = zenbu2Array[i][1]
         }
         */
        
        
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // return time2Array.count
        return zenbu2Array.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // セルを取得する
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let label1 = cell.contentView.viewWithTag(1) as! UILabel
        let label2 = cell.contentView.viewWithTag(2) as! UILabel
        let label3 = cell.contentView.viewWithTag(3) as! UILabel
        let label4 = cell.contentView.viewWithTag(4) as! UILabel
        
        
        
        /*     if indexPath.row == date2Array.count - 1 {
         cell.backgroundColor = UIColor(red: 255/255, green: 206/255, blue: 243/255, alpha: 1.0)
         }else{
         cell.backgroundColor = UIColor.clear
         }
         
         */
        
        
        saveData.set(seikai2Array, forKey: "seikai")
        saveData.set(time2Array, forKey: "time")
        saveData.set(date2Array, forKey: "date")
        
        
        print(zenbunumber)
        print(timeArray)
        
        if timeArray.isEmpty {
            
        }else{
            time2 = timeArray[0]
            zenbunumber7 = zenbu2Array.first(where: { $0.contains([[time2]])})!
            zenbunumber6 = zenbu2Array.firstIndex(of: zenbunumber7) ?? 1
            
            
            
            
            
        }
        
        
        
        if indexPath.row == zenbunumber6{
            cell.contentView.backgroundColor = UIColor(red: 255/255, green: 206/255, blue: 243/255, alpha: 1.0)
            print("c")
        }else{
            cell.contentView.backgroundColor =  UIColor.clear
            print("DDD")
        }
        
        
        
        
        
        label1.text = zenbu2Array[indexPath.row][0][0]
        label2.text = zenbu2Array[indexPath.row][1][0]
        label3.text = zenbu2Array[indexPath.row][2][0]
        label4.text = zenbunumber4[indexPath.row]
        
        
        
        
        
        
        
        
        saveData.set(seikai2Array, forKey: "seikai")
        saveData.set(time2Array, forKey: "time")
        saveData.set(date2Array, forKey: "date")
        
        
        
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
        date2Array = saveData.object(forKey: "date") as! [String]
        date2Array = [String]()
        
        saveData.set(seikai2Array, forKey: "seikai")
        saveData.set(time2Array, forKey: "time")
        saveData.set(date2Array, forKey: "date")
        
        
        TableView.reloadData()
        
    }
}




