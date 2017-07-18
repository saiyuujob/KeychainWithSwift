//
//  ViewController.swift
//  Demo
//
//  Created by iosdev on 2017/07/18.
//  Copyright © 2017年 iosdev. All rights reserved.
//

import UIKit
import KeychainWithSwift

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let password = "123eE-Z"
        let kPassword = "password"
        
        let mailAddress = "test@test.com"
        let kMailAddress = "mail"
        
        // save
        if let passwordData = password.data(using: .utf8) {
            let saveBool = KeychainWithSwift.setValueWithKeychain(key: kPassword, data: passwordData)
            if saveBool == true {
                print("password save success.")
            } else {
                print("password save failure.")
            }
        }
        
        if let mailData = mailAddress.data(using: .utf8) {
            let saveBool = KeychainWithSwift.setValueWithKeychain(key: kMailAddress, data: mailData)
            if saveBool == true {
                print("mail save success.")
            } else {
                print("mail save failure.")
            }
        }
        
        // read
        if let readData = KeychainWithSwift.getValueWithKeychain(key: kPassword) {
            let data = String(data: readData, encoding: .utf8)! as String
            print("password readData: \(data) .")
        } else {
            print("password readData nil .")
        }
        
        // get allKeychain
        if let allKeychain = KeychainWithSwift.getAllKeychain() {
            print("allKeychain: \(allKeychain) .")
        } else {
            print("allKeychain nil .")
        }
        
        // delete
        let deleteBool = KeychainWithSwift.deleteKeychain(key: kPassword)
        if deleteBool == true {
            print("password delete success .")
        } else {
            print("password delete failure .")
        }
        
        // clear keychain
//        let clearBool = KeychainWithSwift.clearKeychain()
//        if clearBool == true {
//            print("clear success .")
//        } else {
//            print("clear failure .")
//        }
        
        // get allKeychain
        if let allKeychain = KeychainWithSwift.getAllKeychain() {
            print("allKeychain: \(allKeychain) .")
        } else {
            print("allKeychain nil .")
        }
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

