//
//  AcousticVC.swift
//  Bull Force FluidPressure
//
//  Created by Mac on 24/10/24.
//

import UIKit

class AcousticVC: UIViewController {
    
    @IBOutlet weak var txtAcousticPathLengthBetweenTransducerFaces: UITextField!
    @IBOutlet weak var txtAngleBetweenAcousticPathAndThePipeLongitudinalAxis: UITextField!
    @IBOutlet weak var txtAcousticSignalDownstreamTravelTime: UITextField!
    @IBOutlet weak var txtAcousticSignalUpstreamTravelTime: UITextField!
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
        guard let pathLengthText = txtAcousticPathLengthBetweenTransducerFaces.text,
              let angleText = txtAngleBetweenAcousticPathAndThePipeLongitudinalAxis.text,
              let downstreamTimeText = txtAcousticSignalDownstreamTravelTime.text,
              let upstreamTimeText = txtAcousticSignalUpstreamTravelTime.text,
              
              let L = Double(pathLengthText),
              let theta = Double(angleText),
              let t1 = Double(downstreamTimeText),
              let t2 = Double(upstreamTimeText) else {
            lblResult.text = "Please enter valid numbers"
            viewResult.isHidden = false
            return
        }
        
        let thetaRadians = theta * Double.pi / 180
        
        guard t1 > 0, t2 > 0, L > 0 else {
            lblResult.text = "Invalid travel times or path length"
            viewResult.isHidden = false
            return
        }
        
        let velocity = (L / (2 * cos(thetaRadians))) * ((t2 - t1) / (t1 * t2))
        
        lblResult.text = String(format: "Flow Velocity: %.4f m/s", velocity)
        viewResult.isHidden = false
    }
    
    @IBAction func TapOnClear(_ sender: Any) {
        txtAcousticPathLengthBetweenTransducerFaces.text = ""
        txtAngleBetweenAcousticPathAndThePipeLongitudinalAxis.text = ""
        txtAcousticSignalDownstreamTravelTime.text = ""
        txtAcousticSignalUpstreamTravelTime.text = ""
        lblResult.text = ""
        viewResult.isHidden = true
    }
}
