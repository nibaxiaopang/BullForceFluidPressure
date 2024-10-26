//
//  LossFormulaVC.swift
//  Bull Force FluidPressure
//
//  Created by Mac on 24/10/24.
//

import UIKit

class LossFormulaVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.isHidden = true
    }
        
    @IBAction func TapOnBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func TapOnCalcultor(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "LossVC") as! LossVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
