//
//  ConfigDoorViewController.swift
//  Hotel Lock
//
//  Created by Alpha-mac3 on 15/12/1945 Saka.
//

import UIKit
import DropDown

class ConfigDoorViewController: UIViewController {
    @IBOutlet weak var roomDromDownView:UIView!
    @IBOutlet weak var roomLabel:UILabel!
    
    @IBOutlet weak var innerRoomDromDownView:UIView!
    @IBOutlet weak var innerRoomLabel:UILabel!

    let dropDown1 = DropDown()
    let dropDown2 = DropDown()

    let roomArray = ["1","2","3","4"]
    override func viewDidLoad() {
        super.viewDidLoad()
        dropDown1.anchorView = roomDromDownView
        dropDown2.anchorView = innerRoomDromDownView

        dropDown1.dataSource = roomArray
        dropDown2.dataSource = roomArray

    }
    

    @IBAction func roomDropDownButton(_ sender: Any) {
        dropDown1.show()
    }
    
    @IBAction func innerRoomDropDownButton(_ sender: Any) {
        dropDown2.show()
    }
}
