//
//  DetailViewController.swift
//  Instantgram
//
//  Created by somi on 3/6/18.
//  Copyright © 2018 Somi Singh. All rights reserved.
//

import UIKit
import ParseUI
import Parse


class DetailViewController: UIViewController {
  
  @IBOutlet var captionLabel: UILabel!
  @IBOutlet var detailImage: PFImageView!
  @IBOutlet var dateLabel: UILabel!
  
  var post: PFObject?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    if let post = post {
      captionLabel.text = post["caption"] as! String?
      dateLabel.text = post["_created_at"] as! String?
      detailImage.file = post["media"] as? PFFile
      detailImage.loadInBackground()
    }
    
    // Do any additional setup after loading the view.
  }
  
  @IBAction func doneButton(_ sender: Any) {
    dismiss(animated: true, completion: nil)
    
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
}
