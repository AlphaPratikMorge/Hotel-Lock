//
//  EnterOtpViewController.swift
//  Hotel Lock
//
//  Created by Alpha-mac3 on 14/12/1945 Saka.
//

import UIKit

class EnterOtpViewController: UIViewController {
    
    @IBOutlet weak var otpTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated:true);

        // Do any additional setup after loading the view.
    }
    @IBAction func backBtnTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func continueBtnTapped(_ sender: UIButton) {
        if otpTextField.text?.isEmpty ?? true {
            showAlert(message: "Please Enter OTP.")
        }else
        {
            let controlPanelVC = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "ControlPanelViewController") as! ControlPanelViewController
            
            self.navigationController?.pushViewController(controlPanelVC, animated: true)
        }
    }
    func showAlert(message: String) {
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    
}
