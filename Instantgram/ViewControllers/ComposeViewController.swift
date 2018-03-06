//
//  ComposeViewController.swift
//  Instantgram
//
//  Created by somi on 3/5/18.
//  Copyright © 2018 Somi Singh. All rights reserved.
//

import UIKit

class ComposeViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
  
      let vc = UIImagePickerController()
  
  @IBOutlet var composeImage: UIImageView!
  
  override func viewDidLoad() {
        super.viewDidLoad()

    let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGesture:)))
    composeImage.isUserInteractionEnabled = true
    composeImage.addGestureRecognizer(tapGesture)
    
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
    let originalImage = info[UIImagePickerControllerOriginalImage] as! UIImage
    let editedImage = info[UIImagePickerControllerEditedImage] as! UIImage
    
    // Do something with the images (based on your use case)
    
    // Dismiss UIImagePickerController to go back to your original view controller
    dismiss(animated: true, completion: nil)
  }
  
  
  
  @IBAction func cancelButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)  }
  
  @IBAction func shareButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    
  }
  
  
  
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
