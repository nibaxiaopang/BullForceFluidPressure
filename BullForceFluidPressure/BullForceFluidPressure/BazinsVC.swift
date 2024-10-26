//
//  BazinsVC.swift
//  Bull Force FluidPressure
//
//  Created by Mac on 24/10/24.
//

import UIKit

class BazinsVC: UIViewController {
    
    @IBOutlet weak var txtDischargeConstant: UITextField!
    @IBOutlet weak var txtWidthOfTheWeir: UITextField!
    @IBOutlet weak var txtAccelerationDueToGravity: UITextField!
    @IBOutlet weak var txtHeadOnTheWeir: UITextField!
    @IBOutlet weak var lblResult: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        lblResult.isHidden = true
    }
   
    @IBAction func TapOnBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func TapOnCalculate(_ sender: Any) {
        guard let dischargeConstantText = txtDischargeConstant.text,
              let widthOfWeirText = txtWidthOfTheWeir.text,
              let accelerationText = txtAccelerationDueToGravity.text,
              let headOnWeirText = txtHeadOnTheWeir.text,
              let C_d = Double(dischargeConstantText),
              let L = Double(widthOfWeirText),
              let g = Double(accelerationText),
              let H = Double(headOnWeirText) else {
            lblResult.text = "Invalid input!"
            lblResult.isHidden = false
            return
        }
        
        let Q = (2.0 / 3.0) * C_d * L * pow(H, 1.5) // m³/s
        
        lblResult.text = String(format: "Flow Rate (Q): %.2f m³/s", Q)
        lblResult.isHidden = false
    }
    
    @IBAction func TapOnClear(_ sender: Any) {
        txtDischargeConstant.text = ""
        txtWidthOfTheWeir.text = ""
        txtAccelerationDueToGravity.text = ""
        txtHeadOnTheWeir.text = ""
        lblResult.isHidden = true
    }
}
