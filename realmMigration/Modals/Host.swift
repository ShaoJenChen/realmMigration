//
//  Host.swift
//  realmMigration
//
//  Created by 陳劭任 on 2018/8/12.
//  Copyright © 2018年 陳劭任. All rights reserved.
//

import UIKit
import RealmSwift

class Host: Object {

    @objc dynamic var ip: String = ""
    
    @objc dynamic var hostName: String = ""
    
    var subCameras: List<Camera> = List<Camera>()
    
    override static func primaryKey() -> String? {
        return "ip"
    }
}
