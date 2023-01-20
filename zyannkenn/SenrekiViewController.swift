//
//  SenrekiViewController.swift
//  zyannkenn
//
//  Created by saki on 2023/01/15.
//

import UIKit

class SenrekiViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet var label: UILabel!
    @IBOutlet weak var TableView: UITableView!

    var syouhai : Int = 0
   var scoreArray = [String]()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // print(syouhai)
       label.text = String(syouhai)
       
      

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
          super.viewWillAppear(animated)
        TableView.reloadData()
        
        }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    
 

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
// セルの数
        // #warning Incomplete implementation, return the number of rows
        return scoreArray.count
        
    }

    
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // セルを取得する
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "katicell", for: indexPath)
        
      /*  if syouhai == 1{
            cell.textLabel!.text = "あいこ"
                        }
        if syouhai == 2{
            cell.textLabel!.text = "負け"
                        }
        if syouhai == 3{
            cell.textLabel!.text = "勝ち"
        }
       */
        cell.textLabel?.text = scoreArray[indexPath.row]
        // セルに表示する値を設定する
        print(scoreArray)
        return cell
    }
}
