//
//  AppDelegate.swift
//  User
//
//  Created by Vandan  on 9/18/19.
//  Copyright © 2019 Vandan Inc. All rights reserved.
//

import UIKit
import SQLite3

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var databaseName : String = "newDB.db"
    var databasePath : String = ""
    var people : [Data] = []
    var url : String = "No Image"


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        
        let documentsDir = documentsPath[0]
        databasePath = documentsDir.appending("/" + databaseName)
        checkAndCreateDatabase()
        readDataFromDatabase()
        return true
    }
    
    func readDataFromDatabase(){
        
        people.removeAll()
        var db : OpaquePointer? = nil
        
        if sqlite3_open(self.databasePath, &db) == SQLITE_OK
        {
            var queryStatement : OpaquePointer? = nil
            let queryStatementString : String = "select * from users"
            
            if sqlite3_prepare_v2(db, queryStatementString, -1, &queryStatement, nil) == SQLITE_OK
            {
                while (sqlite3_step(queryStatement) == SQLITE_ROW)
                {
                    let id : Int = Int(sqlite3_column_int(queryStatement, 0))
                    let cname = sqlite3_column_text(queryStatement, 1)!
                    let cemail = sqlite3_column_text(queryStatement, 2)
                    let caddress = sqlite3_column_text(queryStatement, 3)
                    let cnumber = sqlite3_column_text(queryStatement, 4)
                    let cage = sqlite3_column_text(queryStatement, 5)
                    let cdate = sqlite3_column_text(queryStatement, 6)
                    let cavatar  = sqlite3_column_text(queryStatement, 7)
                    let cgender = sqlite3_column_text(queryStatement, 8)
                    
                    
                    let name = String(cString: cname)
                    let email = String(cString: cemail!)
                    let address = String(cString: caddress!)
                    let number = String(cString: cnumber!)
                    let age = String(cString: cage!)
                    let date = String(cString: cdate!)
                    let avatar = String(cString: cavatar!)
                    let gender = String(cString: cgender!)
                    
                    url = avatar
                    
                    let data : Data = .init()
                    data.initWithData(theRow: id, theName: name, theEmail: email, theAddress: address, theNumber: number, theAge: age, theDate: date, theAvatar:avatar , theGender: gender)
                    people.append(data)
                    
                    print("Query result:")
                    print("\(id) |\(name) | \(email) | \(address)|\(number) |\(age) | \(date) | \(cavatar) |\(gender)")
                }
                sqlite3_finalize(queryStatement)
            }
            else
            {
                print("select statement could not be prepared")
            }
            sqlite3_close(db)
        }
        else{
            print("Unable to open database")
        }
        
        
        
    }
    
    func insertIntoDatabase(person : Data) -> Bool
    {
        var returnCode : Bool = true
        var db : OpaquePointer? = nil
        
        if sqlite3_open(self.databasePath, &db) == SQLITE_OK
        {
            let insertStatementString = "insert into users values(NULL, ?, ?, ?, ?, ?, ?, ?, ?)"
            var insertStatement : OpaquePointer? = nil
            
            if sqlite3_prepare_v2(db, insertStatementString, -1, &insertStatement, nil) == SQLITE_OK
            {
                let nameStr = person.name! as NSString
                let emailStr = person.email! as NSString
                let addressStr = person.address! as NSString
                let numberStr = person.number! as NSString
                let ageStr = person.age! as NSString
                let dateStr = person.date! as NSString
                let avatarStr = person.avatar! as NSString
                let genderStr = person.gender! as NSString
                
                
                sqlite3_bind_text(insertStatement, 1, nameStr.utf8String, -1, nil)  // utf8String is to convert in c
                sqlite3_bind_text(insertStatement, 2, emailStr.utf8String, -1, nil)
                sqlite3_bind_text(insertStatement, 3, addressStr.utf8String, -1, nil)
                sqlite3_bind_text(insertStatement, 4, numberStr.utf8String, -1, nil)
                sqlite3_bind_text(insertStatement, 5, ageStr.utf8String, -1, nil)
                sqlite3_bind_text(insertStatement, 6, dateStr.utf8String, -1, nil)
                sqlite3_bind_text(insertStatement, 7, avatarStr.utf8String,-1,nil)
                sqlite3_bind_text(insertStatement, 8, genderStr.utf8String, -1, nil)
                
                
                
                
                if sqlite3_step(insertStatement) == SQLITE_DONE
                {
                    let rowID = sqlite3_last_insert_rowid(db)
                    print("Insert Successful, rowID is \(rowID)")
                }
                else
                {
                    print("could not insert row")
                    returnCode = false
                }
                sqlite3_finalize(insertStatement)  // cleanup
            }
            else
            {
                print("insert statement could not be prepared")
                returnCode = false
            }
            sqlite3_close(db)
        }
        else{
            print("unable to open database")
            returnCode = false
        }
        return returnCode
    }
    
    
    
    func checkAndCreateDatabase(){
        var success = false
        let fileManager = FileManager.default
        
        success = fileManager.fileExists(atPath: databasePath)
        
        if success
        {
            return
        }
        
        let databasePathFromApp = Bundle.main.resourcePath?.appending("/" + databaseName)
        
        try? fileManager.copyItem(atPath: databasePathFromApp!, toPath: databasePath)
    }
    
    
    
    
    
    
    
    
    
    
    

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

