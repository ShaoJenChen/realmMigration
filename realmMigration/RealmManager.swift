//
//  RealmManager.swift
//  realmMigration
//
//  Created by 陳劭任 on 2018/8/12.
//  Copyright © 2018年 陳劭任. All rights reserved.
//

import UIKit
import RealmSwift

private let _manager = RealmManager()

private let _realm = try! Realm()

class RealmManager: NSObject {

    open class var shared: RealmManager {
        
        return _manager
        
    }
    
    override init() {
        
        super.init()
        
        let url = URL.inDocumentsFolder(fileName: "GV-EYE.realm")
        
        let config = Realm.Configuration(
            fileURL: url,
            schemaVersion: 7,
            migrationBlock: { (migration, oldSchemaVersion) in
                
                migration.enumerateObjects(ofType: Camera.className(), { (oldObject, newObject) in
                    //                    let name = oldObject!["name"] as! String
                    //                    if name.contains("sw3") {
                    //                        newObject!["type"] = CameraType.ADV.rawValue
                    //                    }
                    
                })
                
                
                try! self.getRealm().write {
                    
                    let cameras = self.getRealm().objects(Camera.self)
                    
                    for camera in cameras {
                        
                        let ip = camera.ip
                        
                        if let host = self.getRealm().object(ofType: Host.self, forPrimaryKey: ip) {
                            
                            host.subCameras.append(camera)
                            
                        }
                        else {
                            
                            let name = camera.name
                            
                            self.getRealm().create(Host.self, value: [ip,name,[camera]], update: true)
                            
                        }
                        
                        
                    }
                }
                    
                
        },
            objectTypes: nil)
        
        Realm.Configuration.defaultConfiguration = config

    }
 
    open func getRealm() -> Realm {
        
        return _realm
        
    }
}
