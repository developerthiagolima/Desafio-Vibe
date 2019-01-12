//
//  String+Extension.swift
//  Eventos
//
//  Created by Thiago Lima on 06/06/2018.
//  Copyright © 2018 Vibe. All rights reserved.
//

import UIKit

extension String {
    
    func tagBase64ToImage() -> UIImage? {
        if let url = URL(string: self),let data = try? Data(contentsOf: url),let image = UIImage(data: data) {
            return image
        }
        return nil
    }
    
    func base64ToImage() -> UIImage? {
        if let imageData = Data(base64Encoded: self){
            return UIImage(data: imageData)
        }
        return nil
    }
    
}
