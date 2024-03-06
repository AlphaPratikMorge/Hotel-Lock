//
//  StaffDashboardLockViewController.swift
//  Hotel Lock
//
//  Created by Alpha-mac3 on 16/12/1945 Saka.
//

import UIKit

class StaffDashboardLockViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func staffUnlockRoomButton(_ sender: Any) {
        let staffControlLockVc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "StaffControlLockViewController") as! StaffControlLockViewController
        
        self.navigationController?.pushViewController(staffControlLockVc, animated: true)
    }
    

}
