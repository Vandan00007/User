//
//  RegisterViewController.swift
//  User
//
//  Created by Vandan  on 9/20/19.
//  Copyright © 2019 Vandan Inc. All rights reserved.
//

import UIKit


class RegisterViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet var tfName : UITextField!
    @IBOutlet var tfAddress : UITextField!
    @IBOutlet var tfPhone : UITextField!
    @IBOutlet var tfEmail : UITextField!
    
    @IBOutlet var d : UILabel!
    @IBOutlet var sgGender : UISegmentedControl!
    
     
    
    @IBOutlet var dpDate : UIDatePicker!
    
    @IBOutlet var slAge : UISlider!
    @IBOutlet var lbAge : UILabel!
    
    @IBOutlet var lbTable : UILabel!
    
    @IBOutlet var selectedImage : UIImageView!
    
    
    func image() -> Int{
        var img :Int = 1
        if selectedImage.image == UIImage(named: "fc.png"){
            img = 2
        }else if selectedImage.image == UIImage(named: "raptors.png")
        {
            img = 4
        }else if selectedImage.image == UIImage(named: "jays.jpg")
        {
            img = 6
        }
        return img
    }
    
    
    @IBAction func unwindToRegisterVC(sender: UIStoryboardSegue)
    {
        
    }
    
    
    
    
    
    @IBAction func segmentDidChanged(sender: UISegmentedControl)
    {
        sgGender.titleForSegment(at: sgGender.selectedSegmentIndex)
    }
    
    func updateLabel(){
        let age = slAge.value
        let strAge = String(format: "%.f", age)
        lbAge.text = strAge
        
    }
    
    @IBAction func sliderValueChanged(sender : UISlider)
    {
        updateLabel()
    }
    
    @IBAction func registerForm(sender: UIButton){
        print("Button clicked")
        let mainDelegate = UIApplication.shared.delegate as! AppDelegate
        let person : Data = .init()
        person.initWithData(theRow: 0, theName: tfName.text!, theEmail: tfEmail.text!, theAddress: tfAddress.text!, theNumber: tfPhone.text!, theAge: lbAge.text!, theDate: d.text!, theAvatar: mainDelegate.url, theGender: sgGender.titleForSegment(at: sgGender.selectedSegmentIndex)!)
        
        
        let returnCode : Bool = mainDelegate.insertIntoDatabase(person: person)
        
        var returnMSG : String = "Person Added"
        
        if returnCode == false
        {
            returnMSG = "Person Add Failed"
        }
        
        let alertController = UIAlertController(title: "SQlite Add", message: returnMSG, preferredStyle: .actionSheet)
        
        let cancelAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        
        alertController.addAction(cancelAction)
        present(alertController,animated: true)
        
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return textField.resignFirstResponder()
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let touch : UITouch = touches.first!
        let touchPoint : CGPoint = touch.location(in: self.view)
        
        let tableFrame : CGRect = lbTable.frame
        
        if tableFrame.contains(touchPoint)
        {
            performSegue(withIdentifier: "RegisterToTableSegue", sender: self)
        }
        
    }
    
    @IBAction func selectedDate(sender : Any)
    {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        d.text = formatter.string(from: dpDate.date)
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sgGender.titleForSegment(at: sgGender.selectedSegmentIndex)
        let mainDelegate = UIApplication.shared.delegate as! AppDelegate
        selectedImage.image = UIImage(named: mainDelegate.url)
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        d.text = formatter.string(from: dpDate.date)
        
        updateLabel()
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
    

   
