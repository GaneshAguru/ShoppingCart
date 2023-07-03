//
//  MoreDetailsVC.swift
//  Shopping Cart
//
//  Created by Aguru, Ganesh (Contractor) on 23/06/23.
//

import UIKit
import SwiftUI

class MoreDetailsVC: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate{
    
    var profileUrl :URL?
    
    @IBOutlet weak var profileIV: UIImageView!
    @IBOutlet weak var profileButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        profileIV.layer.cornerRadius = profileIV.frame.size.width / 2
        
        let pickOption = UIAction(title:"Pick from Gallery"){_ in
            self.selectFromGallery()
        }
        
        let newOption = UIAction(title: "New Picture"){_ in
            self.takePicture()
        }
        profileButton.menu = UIMenu(title:"Select Option",children: [pickOption,newOption])
        profileButton.showsMenuAsPrimaryAction = true
        

        // Do any additional setup after loading the view.
    }
    
    func selectFromGallery(){
        let pickerVC = UIImagePickerController()
        pickerVC.sourceType = .photoLibrary
        pickerVC.delegate = self
       present(pickerVC, animated: true)
    }
    
    func takePicture(){
        
        let pickerVC = UIImagePickerController()
        
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            pickerVC.sourceType = .camera
            pickerVC.delegate = self
            pickerVC.cameraDevice = .rear
            present(pickerVC, animated: true)
        }else{
            print("No Camera")
        }
    }

    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true)
        
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        profileUrl = info[.imageURL] as? URL
        dismiss(animated: true)
        let img = UIImage(data: try! Data(contentsOf: profileUrl!))
        profileIV.image = img
    }
    
    
    
    
    @IBAction func feedbackButton(_ sender: UIButton) {
        
        let vc = UIHostingController(rootView: FeedbackScreen(rating: 3, feedback: ""))
        show(vc, sender: self)
        
    }
    
}







