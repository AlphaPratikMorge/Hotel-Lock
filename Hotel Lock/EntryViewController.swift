//
//  EntryViewController.swift
//  Hotel Lock
//
//  Created by Alpha-mac3 on 15/12/1945 Saka.
//

import UIKit

class EntryViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func guestEntryButton(_ sender: Any) {
        let guestEnterMobileVC = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "EnterMobileViewController") as! EnterMobileViewController
        
        self.navigationController?.pushViewController(guestEnterMobileVC, animated: true)
    }
    
    @IBAction func staffEntryButton(_ sender: Any) {
        let staffEnterMobileVC = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "StaffEnterMobileNoViewController") as! StaffEnterMobileNoViewController
        
        self.navigationController?.pushViewController(staffEnterMobileVC, animated: true)
    }
    
}
