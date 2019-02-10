//
//  ViewController.swift
//  zapei
//
//  Created by Penélope Araújo on 09/02/19.
//  Copyright © 2019 zapei. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVCaptureMetadataOutputObjectsDelegate {
    
    @IBOutlet weak var qrcodeview: UIImageView!
    var video = AVCaptureVideoPreviewLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let session = AVCaptureSession()
        let captureDevice = AVCaptureDevice.default(for: AVMediaType.video)
        do {
            let input = try AVCaptureDeviceInput(device: captureDevice!)
            session.addInput(input)
        }
        catch {
            print("ERROR")
        }
        
        let output = AVCaptureMetadataOutput()
        session.addOutput(output)
        output.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
        output.metadataObjectTypes = [.qr]
        video = AVCaptureVideoPreviewLayer(session: session)
        
        video.frame = view.layer.bounds
        view.layer.addSublayer(video)
        //        self.view.bringSubviewToFront(qrcodeview)
        //exibe o contorno bonitinho do qr code mas começou a bugar depois de eu acrescentar novas views (????)
        
        session.startRunning()
        
    }
    
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        if metadataObjects.count > 0 {
            if let object = metadataObjects[0] as? AVMetadataMachineReadableCodeObject {
                if object.type == AVMetadataObject.ObjectType.qr {
                    
                    let alert = UIAlertController(title: "QR Code", message: object.stringValue, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Ler QR Code", style: .default, handler: nil))
                    ////                    alert.addAction(UIAlertAction(title: "Copy", style: .default, handler: { (nil) in UIPasteboard.general.string = object.stringValue}))
                    present(alert, animated: false, completion: nil)
                }
            }
        }
    }
    
}
