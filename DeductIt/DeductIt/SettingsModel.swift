//
//  SettingsModel.swift
//  DeductIt
//
//  Created by Josh Isaacson - Work on 10/12/17.
//  Copyright © 2017 Josh Isaacson. All rights reserved.
//

import Foundation

class Settings: NSObject, NSCoding {
    //Settings
    /*
     setCurrency
     getCurrency
     setName
     getName
     setAddress
     getAddress
     */
    
    var currency : String
    //var name : String
    //var address : String
    
    //SETTINGS PERSISTENCE
    
    struct SettingsKey {
        static let currency = "currency"
        //static let name = "name"
        //static let address = "address"
    }
    
    init(currency:String) {//, name:String, address:String) {
        self.currency = currency
        //self.name = name
        //self.address = address
        //super.init()
    }
    
    
    //encode saved values for app settings
    func encode(with aCoder: NSCoder) {
        aCoder.encode(currency, forKey: SettingsKey.currency)
        //aCoder.encode(name, forKey: SettingsKey.name)
        //aCoder.encode(address, forKey: SettingsKey.address)
    }
    
    //initialize NSCoder, decode saved values
    required convenience init?(coder aDecoder: NSCoder) {
        
        let currency = aDecoder.decodeObject(forKey: SettingsKey.currency) as! String
        //let name = aDecoder.decodeObject(forKey: SettingsKey.name) as! String
        //let address = aDecoder.decodeObject(forKey: SettingsKey.address) as! String
        
        // initialize
        self.init(currency:currency) //, name:name, address:address)
    }
    /*
     let settings = UserDefaults.standard
     
     func encode() {
     settings.set(currency, forKey: "Currency")
     settings.set(name, forKey: "Name")
     settings.set(address, forKey: "address")
     }
     
     func decode() {
     if let currencyPersisted = settings.object(forKey: "Currency") as? String {
     currency = currencyPersisted
     }
     if let namePersisted = settings.object(forKey: "Name") as? String {
     name = namePersisted
     }
     if let addressPersisted = settings.object(forKey: "Address") as? String {
     address = addressPersisted
     }
     }
     */
    
    /*
    //setCurrency sets the currency
    func setCurrency (setCurrency:String) {
        currency = setCurrency
    }
    
    //getCurrency gets the value for currency
    func getCurrency() -> String {
        return currency
    }
    
    //setName sets the users name
    func setName(userName:String) {
        name = userName
    }
    
    //getName gets the name
    func getName() -> String {
        return name
    }
    
    //setAddress sets the users address
    func setAddress(userAddress:String) {
        address = userAddress
    }
    
    //getAddress gets the address
    func getAddress() -> String {
        return address
    }
     */
}
