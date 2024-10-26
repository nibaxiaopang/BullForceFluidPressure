//
//  AbsoluteVC.swift
//  Bull Force FluidPressure
//
//  Created by Mac on 24/10/24.
//
import UIKit

class BullForceAbsoluteVC: UIViewController {

    @IBOutlet weak var txtGaugePressure: UITextField!
    @IBOutlet weak var txtAtmosphericPressure: UITextField!
    @IBOutlet weak var lblResult: UILabel!
    @IBOutlet weak var viewResult: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.isHidden = true
        viewResult.isHidden = true
    }
    
    @IBAction func TapOnBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func TapOnCalculate(_ sender: Any) {
        guard let gaugePressureText = txtGaugePressure.text,
              let atmosphericPressureText = txtAtmosphericPressure.text,
              let gaugePressure = Double(gaugePressureText),
              let atmosphericPressure = Double(atmosphericPressureText) else {
            lblResult.text = "Please enter valid numbers"
            viewResult.isHidden = false
            return
        }
        
        let absolutePressure = gaugePressure + atmosphericPressure
        
        lblResult.text = "Absolute Pressure: \(absolutePressure) Pa"
        viewResult.isHidden = false
    }
    
    @IBAction func TapOnClear(_ sender: Any) {
        txtGaugePressure.text = ""
        txtAtmosphericPressure.text = ""
        lblResult.text = ""
        viewResult.isHidden = true
    }
}
