//
//  StaffEnterMobileNoViewController.swift
//  Hotel Lock
//
//  Created by Alpha-mac3 on 15/12/1945 Saka.
//

import UIKit

class StaffEnterMobileNoViewController: UIViewController {

    @IBOutlet weak var mobileNumberTF: UITextField!
    @IBOutlet weak var countryCodeTF: UITextField!
   
    
    var countryCodes = [[String]]()
    var selectedRow: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.countryCodes = getAllCountryCodes()
              picker()
        
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
            countryCodeTF.inputView = picker
            picker.selectRow(selectedRow, inComponent: 0, animated: false)
        }
        
    @IBAction func requestOtpButton(_ sender: Any) {
        if mobileNumberTF.text?.isEmpty ?? true {
            showAlert(message: "Please enter mobile number")
        } else {
            guard let mobileNumber = mobileNumberTF.text else {
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
        let staffOtpVC =  UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "StaffEnterOtpViewController") as? StaffEnterOtpViewController
        self.navigationController?.pushViewController(staffOtpVC!, animated: true)

    }
    func showAlert(message: String) {
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
}

extension StaffEnterMobileNoViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
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
        countryCodeTF.text = "+\(code[1])"
    }
}
