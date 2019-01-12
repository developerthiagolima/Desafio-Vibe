//
//  UIViewController+Extension.swift
//  Eventos
//
//  Created by Thiago Lima on 06/06/2018.
//  Copyright © 2018 Vibe. All rights reserved.
//

import UIKit
import JGProgressHUD

var HUD:JGProgressHUD = JGProgressHUD(style: JGProgressHUDStyle.light)

extension UIViewController {
    
    public func showAlert(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        let alertActionCancel = UIAlertAction(title: "Ok", style: UIAlertActionStyle.cancel, handler: nil)
        alert.addAction(alertActionCancel)
        self.present(alert,animated: true)
    }
    
    public func showAlert(title: String, message: String, ok:@escaping () -> ()){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        let alertActionCancel = UIAlertAction(title: "Ok", style: UIAlertActionStyle.cancel, handler: { (action) -> Void in
            ok()
        })
        alert.addAction(alertActionCancel)
        self.present(alert,animated: true)
    }
    
    func UI(_ block: @escaping ()->Void) {
        DispatchQueue.main.async(execute: block)
    }
    
    func indicator(show: Bool){
        if show {
            DispatchQueue.main.async(execute: {
                HUD = JGProgressHUD(style: JGProgressHUDStyle.extraLight)
                HUD.hudView.layer.shadowColor = UIColor.black.cgColor
                HUD.hudView.layer.shadowOpacity = 0.4
                HUD.hudView.layer.shadowRadius = 8.0
                HUD.animation = JGProgressHUDFadeZoomAnimation()
                HUD.backgroundColor = UIColor(white: 0.0, alpha: 0.4)
                HUD.show(in: self.view)
            })
        }else{
            DispatchQueue.main.async(execute: {
                HUD.dismiss()
            })
        }
    }
    
}
