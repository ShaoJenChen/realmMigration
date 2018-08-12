//
//  ViewController.swift
//  realmMigration
//
//  Created by 陳劭任 on 2018/8/12.
//  Copyright © 2018年 陳劭任. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {

    let realm = RealmManager.shared.getRealm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func addOneRecord(_ sender: UIButton) {
        
        let camera = Camera()
        
        camera.name = "sw4-Camera"
        camera.ip = "192.168.0.10"
        camera.account = "admin"
        camera.password = "admin"
        
        try! realm.write {
            
            realm.add(camera)
            
        }
    }
    
    @IBAction func deleteOneRecord(_ sender: UIButton) {
        
        try! realm.write {
            
            let result = realm.objects(Camera.self).filter(NSPredicate(format: "ip = '192.168.0.10'", argumentArray: nil))
            
            realm.delete(result.first!)
            
        }
        
    }
    
    
    @IBAction func queryAllRecord(_ sender: UIButton) {
        try! realm.write {
            
//            let camera = realm.object(ofType: Camera.self, forPrimaryKey: "8FA44357-F1FB-414E-92D6-36847BD9264C")
            let cameras = realm.objects(Camera.self).filter("ip = '192.168.0.10'")
            print(cameras)
        }
        
    }
    
    @IBAction func modifyRecord(_ sender: UIButton) {
        try! realm.write {
            let cameras = realm.objects(Camera.self).filter("ip = '192.168.0.10'")
            
            for camera in cameras {
                camera.name = "sw3-Camera"
            }
            
        }
    }
    
}

