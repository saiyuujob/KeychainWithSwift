//
//  KeychainWithSwift.swift
//  KeychainWithSwift
//
//  Created by iosdev on 2017/07/18.
//  Copyright © 2017年 iosdev. All rights reserved.
//

import Foundation
import Security

public class KeychainWithSwift {
    public static func setValueWithKeychain(key: String, data: Data) -> Bool {
        let query: [String: Any] = [kSecClass as String: kSecClassGenericPassword as String,
                                    kSecAttrAccount as String : key,
                                    kSecValueData as String: data ]
        SecItemDelete(query as CFDictionary)
        let status: OSStatus = SecItemAdd(query as CFDictionary, nil)
        return status == noErr
    }
    
    public static  func getValueWithKeychain(key: String) -> Data? {
        let query: [String: Any] = [kSecClass as String: kSecClassGenericPassword,
                                    kSecAttrAccount as String: key,
                                    kSecReturnData as String: kCFBooleanTrue,
                                    kSecMatchLimit as String: kSecMatchLimitOne ]
        var dataTypeRef: AnyObject?
        let status: OSStatus = SecItemCopyMatching(query as CFDictionary, &dataTypeRef)
        
        if status == noErr {
            return (dataTypeRef as! Data)
        } else {
            return nil
        }
    }
    
    public static func deleteKeychain(key: String) -> Bool {
        let query: [String: Any] = [kSecClass as String: kSecClassGenericPassword,
                                    kSecAttrAccount as String: key]
        let status: OSStatus = SecItemDelete(query as CFDictionary)
        return status == noErr
    }
    
    public static func clearKeychain() -> Bool {
        let query: [String: Any] = [kSecClass as String: kSecClassGenericPassword ]
        let status: OSStatus = SecItemDelete(query as CFDictionary)
        return status == noErr
    }
    
    public static  func getAllKeychain() -> Array<Any>? {
        let query: [String: Any] = [kSecClass as String: kSecClassGenericPassword,
                                    kSecReturnAttributes as String: kCFBooleanTrue,
                                    kSecMatchLimit as String: kSecMatchLimitAll ]
        var dataTypeRef: AnyObject?
        let status: OSStatus = SecItemCopyMatching(query as CFDictionary, &dataTypeRef)
        
        if status == noErr {
            return dataTypeRef as? Array
        } else {
            return nil
        }
    }
}

