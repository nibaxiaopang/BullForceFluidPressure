//
//  AluminumVC.swift
//  Bull Force FluidPressure
//
//  Created by Mac on 24/10/24.
//

import UIKit

class BullForceAluminumVC: UIViewController {
    
    @IBOutlet weak var txtAllowableStress: UITextField!
    @IBOutlet weak var txtWallThickness: UITextField!
    @IBOutlet weak var txtPipeOutsideDiameter: UITextField!
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
        guard let allowableStressText = txtAllowableStress.text,
              let wallThicknessText = txtWallThickness.text,
              let outsideDiameterText = txtPipeOutsideDiameter.text,
              let allowableStress = Double(allowableStressText),
              let wallThickness = Double(wallThicknessText),
              let outsideDiameter = Double(outsideDiameterText) else {
            lblResult.text = "Please enter valid numbers"
            viewResult.isHidden = false
            return
        }
        
        guard allowableStress > 0, wallThickness > 0, outsideDiameter > 0 else {
            lblResult.text = "Invalid input values"
            viewResult.isHidden = false
            return
        }
        
        let pressureRating = (2 * allowableStress * wallThickness) / outsideDiameter
        
        lblResult.text = String(format: "Pressure Rating: %.2f psi", pressureRating)
        viewResult.isHidden = false
    }
    
    @IBAction func TapOnClear(_ sender: Any) {
        txtAllowableStress.text = ""
        txtWallThickness.text = ""
        txtPipeOutsideDiameter.text = ""
        lblResult.text = ""
        viewResult.isHidden = true
    }
}
