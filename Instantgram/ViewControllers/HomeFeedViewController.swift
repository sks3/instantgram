//
//  HomeFeedViewController.swift
//  Instantgram
//
//  Created by somi on 3/5/18.
//  Copyright © 2018 Somi Singh. All rights reserved.
//

import UIKit
import Parse
import ParseUI

class HomeFeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
  
  var posts: [PFObject] = []
  var post: PFObject?
    var refreshControl: UIRefreshControl!
  
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
      
      
      
      // detect tap on image
      let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGesture:)))
      tableView.isUserInteractionEnabled = true
      tableView.addGestureRecognizer(tapGesture)
      
      
      // setup pullToRefresh control
      refreshControl = UIRefreshControl()
      refreshControl.addTarget(self, action: #selector
        (HomeFeedViewController.didPullToRefresh(_:)), for: .valueChanged)
      tableView.insertSubview(refreshControl, at: 0)
      
      
      loadMessages()
      // Do any additional setup after loading the view.
    }

  // reload movies if pulled to refresh
  @objc func didPullToRefresh(_ refreshControl: UIRefreshControl) {
    loadMessages()
  }
  
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return posts.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "HomeCell", for: indexPath) as! HomeCell
    //cell.selectionStyle = .none
    post = posts[indexPath.row]
    cell.homeCaption.text = post!["caption"] as! String?
    cell.homeImage.file = post!["media"] as? PFFile
    //cell.homeCaption.text = posts[indexPath.row]["caption"] as! String?
    //cell.homeImage.file = posts[indexPath.row]["media"] as? PFFile
    cell.homeImage.loadInBackground()

    //set cell selection effect
    //cell.selectionStyle = .none
    
   
    return cell
  }
  
  func loadMessages() {
    let query = PFQuery(className: "Post")
    query.addDescendingOrder("createdAt")
    
    query.findObjectsInBackground { (posts: [PFObject]?, error: Error?) in
      if let posts = posts {
        self.posts = posts
        self.refreshControl.endRefreshing()
        self.tableView.reloadData()
      }
      else {
        print(error?.localizedDescription)
      }
    }
  }
  
  @IBAction func showDetailView(_ sender: Any) {
    performSegue(withIdentifier: "detailSegue", sender: nil)
    
  }
  @objc func imageTapped(tapGesture: UITapGestureRecognizer) {
    performSegue(withIdentifier: "detailSegue", sender: nil)
  }
  
  // send post to detail view controller
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    //let cell = sender as! UITableViewCell
    //if let indexPath = tableView.indexPath(for: cell) {
      //let post = posts[indexPath.row]
      let detailViewController = segue.destination as! DetailViewController
      detailViewController.post = post
    //}
  }
  
  override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
