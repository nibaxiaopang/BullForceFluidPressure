//
//  AcousticFormulaVC.swift
//  Bull Force FluidPressure
//
//  Created by Mac on 24/10/24.
//

import UIKit

class BullForceAcousticFormulaVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.isHidden = true
    }
  
    @IBAction func TapOnBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
        
    @IBAction func TapOnCalculte(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "AcousticVC") as! BullForceAcousticVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
