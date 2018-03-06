//
//  ComposeViewController.swift
//  Instantgram
//
//  Created by somi on 3/5/18.
//  Copyright © 2018 Somi Singh. All rights reserved.
//

import UIKit
import Parse
import ParseUI

class ComposeViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
  
      let vc = UIImagePickerController()
  
  var originalImage: UIImage? = nil
  var editedImage: UIImage? = nil

  

  @IBOutlet var composeImage: UIImageView!
  @IBOutlet var composeCaption: UITextField!
  
  override func viewDidLoad() {
        super.viewDidLoad()

    
    
    let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGesture:)))
    composeImage.isUserInteractionEnabled = true
    composeImage.addGestureRecognizer(tapGesture)
    composeImage.image = UIImage(named: "image_placeholder.png")
    vc.delegate = self
    vc.allowsEditing = true
    if UIImagePickerController.isSourceTypeAvailable(.camera) {
      print("Camera is available 📸")
      vc.sourceType = .camera
    } else {
      print("Camera 🚫 available so we will use photo library instead")
      vc.sourceType = .photoLibrary
    }
    


        // Do any additional setup after loading the view.
    }
  
  
  @objc func imageTapped(tapGesture: UITapGestureRecognizer) {
    print("camera activated")
    self.present(vc, animated: true, completion: nil)
  }
  
  func imagePickerController(_ picker: UIImagePickerController,
                             didFinishPickingMediaWithInfo info: [String : Any]) {
    // Get the image captured by the UIImagePickerController
    originalImage = info[UIImagePickerControllerOriginalImage] as! UIImage
    editedImage = info[UIImagePickerControllerEditedImage] as! UIImage
    
    // Do something with the images (based on your use case)
    composeImage.image = editedImage
    // Dismiss UIImagePickerController to go back to your original view controller
    dismiss(animated: true, completion: nil)
  }
  
  
  
  @IBAction func cancelButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)  }
  
  @IBAction func shareButton(_ sender: Any) {
    
    let caption = composeCaption.text as! String
    Post.postUserImage(image: editedImage, withCaption: caption, withCompletion: nil)
        dismiss(animated: true, completion: nil)
    
  }
  
  
  
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
