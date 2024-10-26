//
//  HomeVC.swift
//  Bull Force FluidPressure
//
//  Created by Mac on 24/10/24.
//

import UIKit

class HomeVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.isHidden = true
    }
    
    @IBAction func TapOnAbsolutePressure(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "AbsoluteFormulaVC") as! BullForceAbsoluteFormulaVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func TapOnAcousticFlowmeter(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "AcousticFormulaVC") as! BullForceAcousticFormulaVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func TapOnAluminum(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "AluminumFormulaVC") as! AluminumFormulaVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func TapOnBazins(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "BazinsFormulaVC") as! BullForceBazinsFormulaVC
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    @IBAction func TapONBernoulli(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "NumberFormulaVC") as! NumberFormulaVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func TapOnHeadLoss(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "LossFormulaVC") as! LossFormulaVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func TapOnBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
