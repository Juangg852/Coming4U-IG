//
//  FeedViewController.swift
//  Coming4U-IG
//
//  Created by Juan Gonzalez on 10/12/21.
//

import UIKit
import Parse
import AlamofireImage

class FeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var TableView: UITableView!
    
    
    var Posts = [PFObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        TableView.delegate = self
        TableView.dataSource = self

        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let query = PFQuery(className: "Post")
        query.includeKey("owner")
        query.limit = 20
        
        query.findObjectsInBackground { (Posts, error)in
            if  Posts != nil {
                self.Posts = Posts!
                self.TableView.reloadData()
            }
        }
        
         
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Posts.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = TableView.dequeueReusableCell(withIdentifier: "PostCell") as! PostCell
        
        let post = Posts[indexPath.row]
        let user = post["owner"] as! PFUser
        print(post)
        
        cell.UsernameLable.text = user.username
        cell.CaptionLable.text =  post["caption"] as? String
        
        
        let ImageFile = post["image"] as! PFFileObject
        let urlString = ImageFile.url!
        let url = URL(string: urlString)!
        
        cell.PhotoView.af.setImage(withURL: url)
        
        
        return cell
        
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
