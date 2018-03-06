//
//  HomeFeedViewController.swift
//  Instantgram
//
//  Created by somi on 3/5/18.
//  Copyright © 2018 Somi Singh. All rights reserved.
//

import UIKit
import Parse

class HomeFeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
  
  var posts: [PFObject] = []
  
  
  @IBOutlet var tableView: UITableView!
  
  @IBAction func signOut(_ sender: Any) {
    NotificationCenter.default.post(name: NSNotification.Name("didLogout"), object: nil)
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    appDelegate.logOut()
  }
  

    override func viewDidLoad() {
        super.viewDidLoad()
      tableView.delegate = self
      tableView.dataSource = self
      //tableView.rowHeight = UITableViewAutomaticDimension
      tableView.rowHeight = 400
      
      // Do any additional setup after loading the view.
    }

  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "HomeCell", for: indexPath) as! HomeCell
    cell.homeCaption.text = "Here is a witty caption for this photo!"
    cell.homeImage.image = UIImage(named: "static_img.jpg")
    //set cell selection effect
    cell.selectionStyle = .none
    
   
    return cell
  }
  
  
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
