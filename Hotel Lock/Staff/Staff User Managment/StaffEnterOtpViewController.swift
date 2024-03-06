//
//  StaffEnterOtpViewController.swift
//  Hotel Lock
//
//  Created by Alpha-mac3 on 15/12/1945 Saka.
//

import UIKit

class StaffEnterOtpViewController: UIViewController {

    @IBOutlet weak var enterOtpTF: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated:true);

        // Do any additional setup after loading the view.
    }
    @IBAction func staffBackBtnTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func verifyOtpButton(_ sender: Any) {
        if enterOtpTF.text?.isEmpty ?? true  {
            showAlert(message: "Please Enter OTP.")
        } else {
            guard let otp = enterOtpTF.text else {
                // Handle the case where text field text is nil
                return
            }
            
            let cleanedOtpNumber = otp.replacingOccurrences(of: " ", with: "").replacingOccurrences(of: "-", with: "")
            
            if cleanedOtpNumber.count == 6, let _ = Int(cleanedOtpNumber) {
                // Mobile number is valid
                print("Valid otp number: \(cleanedOtpNumber)")
            } else {
                // Mobile number is not valid
                showAlert(message: "Please enter 6 digit otp number")
                
            }
        }
            let staffDashboardVC = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "StaffDashboardLockViewController") as! StaffDashboardLockViewController
            
            self.navigationController?.pushViewController(staffDashboardVC, animated: true)
        }

    
    func showAlert(message: String) {
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    

}
