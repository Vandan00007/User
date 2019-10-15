//
//  selectImageViewController.swift
//  User
//
//  Created by Vandan  on 10/13/19.
//  Copyright © 2019 Vandan Inc. All rights reserved.
//

import UIKit

class selectImageViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{

    var listData = ["fc.png","raptors.jpg","jays.jpg"]
    var imageData = [UIImage(named: "fc.png"), UIImage(named: "raptors.jpg"), UIImage(named: "jays.jpg")]
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listData.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let tableCell : SiteCell = tableView.dequeueReusableCell(withIdentifier: "cell") as? SiteCell ?? SiteCell(style: .default, reuseIdentifier: "cell")
        let rowNum = indexPath.row
        tableCell.primaryLabel.text = listData[rowNum]
        tableCell.myImageView.image = imageData[rowNum]
        tableCell.accessoryType = .disclosureIndicator
        return tableCell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let mainDelegate = UIApplication.shared.delegate as! AppDelegate
        mainDelegate.url = listData[indexPath.row]
        performSegue(withIdentifier: "image", sender: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
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
