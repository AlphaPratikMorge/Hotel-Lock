//
//  StaffControlLockViewController.swift
//  Hotel Lock
//
//  Created by Alpha-mac3 on 15/12/1945 Saka.
//

import UIKit

class StaffControlLockViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var buttonsArray = ["GET SYSTEM PASSWORD","SET TIME","GET TIME","SET SYSTEM PASSWORD","RESET LOCK","BATTERY STATUS","FIRMWARE VERSION","CONFIG DOOR","GET AUDIT","ADD SERIAL NUMBER","ADD BLE NAME","GUEST INFO"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    
}
extension StaffControlLockViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        buttonsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? BleListCell
        
        cell?.listLabel.text = buttonsArray[indexPath.row]
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if buttonsArray[indexPath.row] == "CONFIG DOOR" {
            let configDoorVc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "ConfigDoorViewController") as! ConfigDoorViewController
            
            self.navigationController?.pushViewController(configDoorVc, animated: true)
        }
        else {
            showAlert(message: "\(buttonsArray[indexPath.row]) is selected")
        }
    }
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}

