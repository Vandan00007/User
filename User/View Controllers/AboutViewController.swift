//
//  AboutViewController.swift
//  User
//
//  Created by Vandan  on 9/20/19.
//  Copyright © 2019 Vandan Inc. All rights reserved.
//

import UIKit


class AboutViewController: UIViewController {
    
    @IBOutlet var sgPage : UISegmentedControl!
    
    
    
    @IBOutlet var lbDesc : UILabel!
    
    
    
    func updateDescription(){
        let desc = sgPage.selectedSegmentIndex
        if desc == 0
        {
            lbDesc.text = "Home page basically navigates to 3 sub pages "
        }
        else if desc == 1
        {
            lbDesc.text = "Register page prompts user to fill user details"
        }
        else
        {
            lbDesc.text = "Search page redirects to Google Search Engine"
        }
    }
    
    @IBAction func segmentDidChange(sender : UISegmentedControl)
    {
        updateDescription()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateDescription()
        

        // Do any additional setup after loading the view.
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
