//
//  ViewController.swift
//  Practical 7 (Cocoapods)
//
//  Created by Derek Qua on 10/12/20.
//

import UIKit
import QRCodeReader
import AVFoundation

class ViewController: UIViewController, QRCodeReaderViewControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    // Good practice: create the reader lazily to avoid cpu overload during the
    // initialization and each time we need to scan a QRCode
    lazy var readerVC: QRCodeReaderViewController = {
        let builder = QRCodeReaderViewControllerBuilder {
            $0.reader = QRCodeReader(metadataObjectTypes: [.qr], captureDevicePosition: .back)
            
            // Configure the view controller (optional)
            $0.showTorchButton        = false
            $0.showSwitchCameraButton = true
            $0.showCancelButton       = true
            $0.showOverlayView        = true
            $0.rectOfInterest         = CGRect(x: 0.2, y: 0.2, width: 0.6, height: 0.6)
        }
        
        return QRCodeReaderViewController(builder: builder)
    }()

    @IBAction func scanAction(_ sender: AnyObject) {
      // Retrieve the QRCode content
      // By using the delegate pattern
      readerVC.delegate = self

      // Or by using the closure pattern
      readerVC.completionBlock = { (result: QRCodeReaderResult?) in
        print(result)
      }

      // Presents the readerVC as modal form sheet
      readerVC.modalPresentationStyle = .formSheet
     
      present(readerVC, animated: true, completion: nil)
    }

    // MARK: - QRCodeReaderViewController Delegate Methods

    func reader(_ reader: QRCodeReaderViewController, didScanResult result: QRCodeReaderResult) {
      reader.stopScanning()

      dismiss(animated: true, completion: nil)
    }

    //This is an optional delegate method, that allows you to be notified when the user switches the cameraName
    //By pressing on the switch camera button
    func reader(_ reader: QRCodeReaderViewController, didSwitchCamera newCaptureDevice: AVCaptureDeviceInput) {
         let cameraName = newCaptureDevice.device.localizedName
          print("Switching capture to: \(cameraName)")
        
    }

    func readerDidCancel(_ reader: QRCodeReaderViewController) {
      reader.stopScanning()

      dismiss(animated: true, completion: nil)
    }


}



