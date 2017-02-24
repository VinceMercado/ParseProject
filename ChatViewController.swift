//
//  ChatViewController.swift
//  ParseProject
//
//  Created by Vince  on 2/23/17.
//  Copyright © 2017 Vince Mercado. All rights reserved.
//

import UIKit
import Parse

class ChatViewController: UIViewController,UITableViewDelegate, UITableViewDataSource  {
    @IBOutlet weak var messageField: UITextField!

    @IBOutlet weak var tableView: UITableView!
    var queries: [PFObject]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func sendMessage(_ sender: Any) {
        let message = PFObject(className:"Message")
        message["text"] = messageField.text
        message.saveInBackground {
            (success: Bool, error: Error?) -> Void in
            if (success) {
                // The object has been saved.
                print(message["text"])
            } else {
                // There was a problem, check error.description
            }
        }
    }
    func onTimer() {
        // Add code to be run periodically
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ChatViewController.onTimer), userInfo: nil, repeats: true)

    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let queries = queries {
            return queries.count
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "messageCell", for: indexPath) as! messageCell
        let query = queries?[indexPath.row]
        cell.messageLabel.text = query?.object(forKey: "text") as! String?
        
        return cell
    }
  
    @IBAction func newMessage(_ sender: Any) {
        let message = PFObject(className:"Message")
        message["text"] = messageField.text
        message["user"] = PFUser.current()
        message.saveInBackground {
            (success: Bool, error: Error?) -> Void in
            if (success) {
                // The object has been saved.
                print(message["text"])
            } else {
                // There was a problem, check error.description
            }
        }
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
