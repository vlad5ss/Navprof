//
//  Support.swift
//  Navprof
//
//  Created by mac on 1/17/18.
//  Copyright © 2018 mac. All rights reserved.
//


import UIKit
import MessageUI


class Support: BaseViewController, MFMailComposeViewControllerDelegate  {
    
    
    @IBOutlet weak var MessageText: UITextView!
    
    @IBOutlet weak var issuesTypew: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSlideMenuButton()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        //deklarasi nav sebagai navigation bar
        let nav = self.navigationController?.navigationBar
        
        //tambahkan style bar
        nav?.barStyle = UIBarStyle.black
        nav?.tintColor = UIColor.white
        
    }
    
    
    @IBAction func letsProblem(_ sender: Any) {
        
        
        let alert = UIAlertController(title: "",
                                      message: """
        """,
                                      preferredStyle: .alert)
        func handler(_ act:UIAlertAction!) {
            print("User tapped \(act.title as Any)")
            issuesTypew.setTitle("\(act.title as Any)",for: .normal)
        }
        alert.addAction(UIAlertAction(title: "Issue type 1",
                                      style: .cancel, handler: handler))
        alert.addAction(UIAlertAction(title: "Issue type 4",
                                      style: .destructive, handler: handler))
        alert.addAction(UIAlertAction(title: "Issue type 3",
                                      style: .destructive, handler: handler))
        alert.addAction(UIAlertAction(title: "Issue type 2",
                                      style: .default, handler: handler))
        self.present(alert, animated: true)
        
    }
    
    @IBAction func showEmail(_ sender: Any) {
        
        let mailComposeVC = MFMailComposeViewController()
        
        if MFMailComposeViewController.canSendMail() {
            
            mailComposeVC.mailComposeDelegate = self
            
            // Configure the fields of the interface.
            mailComposeVC.setSubject("Support problem")
            mailComposeVC.setMessageBody(MessageText.text, isHTML: false)
            mailComposeVC.setToRecipients(["joxnal@gmail.com"])
            
            // Present the view controller modally
            self.present(mailComposeVC, animated: true, completion: nil)
            
        } else {
            
            print("Mail services are not available")
            return
        }
        
        
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        
        // Check the result or perfom other tasks
        switch result {
        case .cancelled :
            print("Mail cancelled by user")
        case .saved :
            print("Mail saved by user")
        case .sent :
            print("Mail sent by user")
        case .failed :
            print("Mail failed with %@",error?.localizedDescription ?? "Failed")
        default:
            print("Mail not sent")
        }
    }
    
}


