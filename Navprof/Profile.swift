//
//  Profile.swift
//  Navprof
//
//  Created by mac on 1/17/18.
//  Copyright © 2018 mac. All rights reserved.
//

import UIKit

class Profile: BaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSlideMenuButton()
        //create a new button
        let button = UIButton.init(type: .custom)
        //set image for button
        button.setImage(UIImage(named: "vert_white.png"), for: UIControlState.normal)
        //add function for button
        button.addTarget(self, action: #selector(Profile.vert_whitePressed), for: UIControlEvents.touchUpInside)
        //set frame
        button.frame = CGRect(x: 0, y: 0, width: 53, height: 51)
        
        let barButton = UIBarButtonItem(customView: button)
        //assign button to navigationbar
        self.navigationItem.rightBarButtonItem = barButton
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @objc func vert_whitePressed() {
        
        print("joxnablckPressed")
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        
        //deklarasi nav sebagai navigation bar
        let nav = self.navigationController?.navigationBar
        
        //tambahkan style bar
        nav?.barStyle = UIBarStyle.blackOpaque
        nav?.tintColor = UIColor.white
        
    }
}

