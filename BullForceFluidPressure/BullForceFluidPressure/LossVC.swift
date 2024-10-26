//
//  LossVC.swift
//  Bull Force FluidPressure
//
//  Created by Mac on 24/10/24.
//

import UIKit

class LossVC: UIViewController {
    
    @IBOutlet weak var txtElevation1: UITextField!
    @IBOutlet weak var txtElevation2: UITextField!
    @IBOutlet weak var txtPressure1: UITextField!
    @IBOutlet weak var txtPressure2: UITextField!
    @IBOutlet weak var txtDensity: UITextField!
    @IBOutlet weak var txtAccelerationDueToGravity: UITextField!
    @IBOutlet weak var txtVelocity1: UITextField!
    @IBOutlet weak var txtVelocity2: UITextField!
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
        guard let elevation1 = Double(txtElevation1.text ?? ""),
              let elevation2 = Double(txtElevation2.text ?? ""),
              let pressure1 = Double(txtPressure1.text ?? ""),
              let pressure2 = Double(txtPressure2.text ?? ""),
              let density = Double(txtDensity.text ?? ""),
              let gravity = Double(txtAccelerationDueToGravity.text ?? ""),
              let velocity1 = Double(txtVelocity1.text ?? ""),
              let velocity2 = Double(txtVelocity2.text ?? "") else {
            lblResult.text = "Please enter valid numbers."
            lblResult.isHidden = false
            return
        }
        
        let headLoss = (pressure1 / (density * gravity) + velocity1 * velocity1 / (2 * gravity) + elevation1) -
                       (pressure2 / (density * gravity) + velocity2 * velocity2 / (2 * gravity) + elevation2)
        
        lblResult.text = String(format: "Head Loss: %.2f m", headLoss)
        lblResult.isHidden = false
    }
    
    @IBAction func TapOnClear(_ sender: Any) {
        txtElevation1.text = ""
        txtElevation2.text = ""
        txtPressure1.text = ""
        txtPressure2.text = ""
        txtDensity.text = ""
        txtAccelerationDueToGravity.text = ""
        txtVelocity1.text = ""
        txtVelocity2.text = ""
        lblResult.isHidden = true
    }
}
