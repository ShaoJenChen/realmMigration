//
//  Camera.swift
//  realmMigration
//
//  Created by 陳劭任 on 2018/8/12.
//  Copyright © 2018年 陳劭任. All rights reserved.
//

import UIKit
import RealmSwift

@objc enum CameraType: Int {
    
    case GV = 0
    case ADV
    
}

class Camera: Object {

    @objc dynamic var id: String = UUID().uuidString
    
    @objc dynamic var ip: String = ""
    
    @objc dynamic var name: String = ""
    
    @objc dynamic var webPort: Int = 80
    
    @objc dynamic var port: Int = 56000
    
    @objc dynamic var account: String = ""
    
    @objc dynamic var password: String = ""
    
    @objc dynamic var cameraType: Int = 0
    
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    
}
