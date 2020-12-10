//
//  QRCodeGeneratorViewController.swift
//  Practical 7 (Cocoapods)
//
//  Created by Derek Qua on 10/12/20.
//

import Foundation
import UIKit
import SimpleQRCode

class QRCodeGeneratorViewController: UIViewController{
    @IBOutlet weak var QRImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let qrCodeC = QRCode(url: URL(string: "https://derekqua.home.blog")!)
        let myImage: UIImage? = try? qrCodeC?.image()
        QRImage.image = myImage
    }
    
}
