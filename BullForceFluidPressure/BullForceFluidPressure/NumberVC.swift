//
//  NumberVC.swift
//  Bull Force FluidPressure
//
//  Created by Mac on 24/10/24.
//

import UIKit

class NumberVC: UIViewController {
    
    @IBOutlet weak var txtNumber: UITextField!
    @IBOutlet weak var lblResult: UILabel!
    
    let bernoulliNumbers: [Double] = [1.0, -0.5, 0.16666666666666666, 0.0,
                                       -0.03333333333333333, 0.0, 0.023809523809523808,
                                       0.0, -0.03333333333333333, 0.0,
                                       0.07575757575757576] // You can extend this as needed

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        lblResult.isHidden = true
    }
   
    @IBAction func TapOnBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func TapOnCalculate(_ sender: Any) {
        lblResult.isHidden = true
        guard let numberText = txtNumber.text,
              let n = Int(numberText),
              n >= 0, n < bernoulliNumbers.count else {
            lblResult.text = "Invalid input! Enter a number between 0 and \(bernoulliNumbers.count - 1)."
            lblResult.isHidden = false
            return
        }
        
        let bernoulliNumber = bernoulliNumbers[n]
        
        lblResult.text = String(format: "B(%d): %.6f", n, bernoulliNumber)
        lblResult.isHidden = false
    }
    
    @IBAction func TapOnClear(_ sender: Any) {
        txtNumber.text = ""
        lblResult.isHidden = true
    }
}
