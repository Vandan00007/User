//
//  userTableViewController.swift
//  User
//
//  Created by Vandan  on 10/12/19.
//  Copyright © 2019 Vandan Inc. All rights reserved.
//

import UIKit

class userTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let mainDelegate = UIApplication.shared.delegate as! AppDelegate
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mainDelegate.people.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableCell : SiteCell = tableView.dequeueReusableCell(withIdentifier: "cell") as? SiteCell ?? SiteCell(style: .default, reuseIdentifier: "cell")
        
        
        let rowNum = indexPath.row
        tableCell.primaryLabel.text = mainDelegate.people[rowNum].name
        tableCell.secondaryLabel.text = mainDelegate.people[rowNum].email
        let image = (mainDelegate.people[rowNum].avatar)
        tableCell.myImageView.image = UIImage(named: image!)
        //tableCell.myImageView.image = UIImage(named: mainDelegate.url)
        
        return tableCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let rowNum = indexPath.row
        
        let alertController = UIAlertController(title: mainDelegate.people[rowNum].name! + " your details", message: "Date: " + mainDelegate.people[rowNum].date! + "\nAge: :" + mainDelegate.people[rowNum].age! + "\nAddress: " + mainDelegate.people[rowNum].address! + "\n Mobile: " + mainDelegate.people[rowNum].number! + "\nGender: " + mainDelegate.people[rowNum].gender!, preferredStyle: .actionSheet)
        
        let cancelAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        
        alertController.addAction(cancelAction)
        present(alertController,animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        mainDelegate.readDataFromDatabase()
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
