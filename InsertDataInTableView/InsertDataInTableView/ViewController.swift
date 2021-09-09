//
//  ViewController.swift
//  InsertDataInTableView
//
//  Created by Mac on 18/06/1943 Saka.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var myTF: UITextField!
    
    @IBOutlet weak var myTableView: UITableView!
    
    var games: [String] = ["Cricket","Hockey","Basketball","Football"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func saveButton(_ sender: UIButton) {
        
        guard let data = myTF.text else {return}
        
        games.append(data)
        let alertTitle = "Saving!!"
        let message = "Data has been added succesfully in table"
        let alertBox = UIAlertController(title: alertTitle, message: message, preferredStyle: .alert)
        
        let alertAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        
        alertBox.addAction(alertAction)
        
        present(alertBox, animated: true, completion: nil)
        
        myTableView.reloadData()
        myTF.text = ""
    }
}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return games.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = games[indexPath.row]
        return cell!
    }
    
    
}
