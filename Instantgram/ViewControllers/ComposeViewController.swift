//
//  ComposeViewController.swift
//  Instantgram
//
//  Created by somi on 3/5/18.
//  Copyright © 2018 Somi Singh. All rights reserved.
//

import UIKit

class ComposeViewController: UIViewController {
  
  
  override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
