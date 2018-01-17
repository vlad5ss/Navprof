//
//  Payment.swift
//  Navprof
//
//  Created by mac on 1/17/18.
//  Copyright © 2018 mac. All rights reserved.
//

import UIKit

class Payment: BaseViewController {
    
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
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}


