//
//  EnterMobile.swift
//  Hotel Lock
//
//  Created by Alpha-mac3 on 14/12/1945 Saka.
//

import UIKit

class EnterMobileViewController: UIViewController {
    @IBOutlet weak var countryCodeTextField: UITextField!
    var countryCodes = [[String]]()
    var selectedRow: Int = 0
    @IBOutlet weak var mobileTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.countryCodes = getAllCountryCodes()
              picker()
          
        // Do any additional setup after loading the view.
    }
    
    func getAllCountryCodes() -> [[String]] {
           var countrys = [[String]]()
           let countryList = CountryCodeModel.Constants.codePrefixes
           for item in countryList {
               countrys.append(item.value)
           }
           let sorted = countrys.sorted(by: {$0[0] < $1[0]})
           return sorted
       }
    func picker(){
            let picker = UIPickerView()
            picker.delegate = self
            picker.dataSource = self
            countryCodeTextField.inputView = picker
            picker.selectRow(selectedRow, inComponent: 0, animated: false)
        }
        
    @IBAction func requestedOtpClicked(_ sender: UIButton) {
        if mobileTextField.text?.isEmpty ?? true {
            showAlert(message: "Please enter mobile number")
        } else {
            guard let mobileNumber = mobileTextField.text else {
                // Handle the case where text field text is nil
                return
            }
            
            let cleanedMobileNumber = mobileNumber.replacingOccurrences(of: " ", with: "").replacingOccurrences(of: "-", with: "")
            
            if cleanedMobileNumber.count == 10, let _ = Int(cleanedMobileNumber) {
                // Mobile number is valid
                print("Valid mobile number: \(cleanedMobileNumber)")
            } else {
                // Mobile number is not valid
                showAlert(message: "Please enter 10 digit mobile number")
                
            }
            
        }
        let otpVC =  UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "EnterOtpViewController") as? EnterOtpViewController
        self.navigationController?.pushViewController(otpVC!, animated: true)

    }
    func showAlert(message: String) {
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}


extension EnterMobileViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    // MARK: - UIPickerView Delegate Methods
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return countryCodes.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let code = countryCodes[row]
        return "\(code[0]) +\(code[1])"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let code = countryCodes[row]
        countryCodeTextField.text = "+\(code[1])"
    }
}
