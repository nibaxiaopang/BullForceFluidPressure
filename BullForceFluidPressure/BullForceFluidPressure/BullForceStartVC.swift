//
//  StartVC.swift
//  Bull Force FluidPressure
//
//  Created by Mac on 24/10/24.
//

import UIKit
import StoreKit

class BullForceStartVC: UIViewController {
    
    @IBOutlet weak var atView: UIActivityIndicatorView!
    
    @IBOutlet weak var privacyBtn: UIButton!
    @IBOutlet weak var contentStackView: UIStackView!
    @IBOutlet weak var startBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isHidden = true
        self.atView.hidesWhenStopped = true
        self.atView.stopAnimating()
        self.bullADVLoadADsData()
    }
    
    @IBAction func TapOnStart(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "HomeVC") as! HomeVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func TapOnShareApp(_ sender: Any) {
        let objectsToShare = ["Bull Force FluidPressure"]
        let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
        activityVC.popoverPresentationController?.sourceView = self.view
        activityVC.popoverPresentationController?.sourceRect = CGRect(x: 100, y: 200, width: 300, height: 300)
        self.present(activityVC, animated: true, completion: nil)
    }
    
    @IBAction func TapOnRateApp(_ sender: Any) {
        SKStoreReviewController.requestReview()
    }
    
    private func bullADVLoadADsData() {
        guard self.bullNeedShowAds() else {
            return
        }
        
        self.privacyBtn.isHidden = true
        self.contentStackView.isHidden = true
        self.startBtn.isHidden = true
        self.atView.startAnimating()
        if BullForceNetReachManager.shared().isReachable {
            bullADVReqAdsLocalData()
        } else {
            BullForceNetReachManager.shared().setReachabilityStatusChange { status in
                if BullForceNetReachManager.shared().isReachable {
                    self.bullADVReqAdsLocalData()
                    BullForceNetReachManager.shared().stopMonitoring()
                }
            }
            BullForceNetReachManager.shared().startMonitoring()
        }
    }
    
    private func bullADVReqAdsLocalData() {
        bullADVLocalAdsData { dataDic in
            if let dataDic = dataDic {
                self.bullADVConfigAdsData(pulseDataDic: dataDic)
            } else {
                self.atView.stopAnimating()
                self.privacyBtn.isHidden = false
                self.contentStackView.isHidden = false
                self.startBtn.isHidden = false
            }
        }
    }
    
    private func bullADVConfigAdsData(pulseDataDic: [String: Any]?) {
        if let aDic = pulseDataDic {
            let adsData: [String: Any]? = aDic["jsonObject"] as? Dictionary
            if let adsData = adsData {
                if let adsUr = adsData["data"] as? String, !adsUr.isEmpty {
                    UserDefaults.standard.set(adsData, forKey: "BullForceADV")
                    bullShowAdViewC(adsUr)
                    return
                }
            }
        }
        self.privacyBtn.isHidden = false
        self.contentStackView.isHidden = false
        self.startBtn.isHidden = false
        self.atView.stopAnimating()
    }
    
    private func bullADVLocalAdsData(completion: @escaping ([String: Any]?) -> Void) {
        guard let bundleId = Bundle.main.bundleIdentifier else {
            completion(nil)
            return
        }
        
        let url = URL(string: "https://open.wildf\(self.bullMainHostUrl())/open/bullADVLocalAdsData")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let parameters: [String: Any] = [
            "appLocalizedModel": UIDevice.current.localizedModel,
            "appModelName": UIDevice.current.model,
            "appKey": "b9c3fb5cfd144826805d09c9930ee0e3",
            "appPackageId": bundleId,
            "appVersion": Bundle.main.infoDictionary?["CFBundleShortVersionString"] ?? ""
        ]

        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
        } catch {
            print("Failed to serialize JSON:", error)
            completion(nil)
            return
        }

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
                guard let data = data, error == nil else {
                    print("Request error:", error ?? "Unknown error")
                    completion(nil)
                    return
                }
                
                do {
                    let jsonResponse = try JSONSerialization.jsonObject(with: data, options: [])
                    if let resDic = jsonResponse as? [String: Any] {
                        let dictionary: [String: Any]? = resDic["data"] as? Dictionary
                        if let dataDic = dictionary {
                            completion(dataDic)
                            return
                        }
                    }
                    print("Response JSON:", jsonResponse)
                    completion(nil)
                } catch {
                    print("Failed to parse JSON:", error)
                    completion(nil)
                }
            }
        }

        task.resume()
    }
    
}
