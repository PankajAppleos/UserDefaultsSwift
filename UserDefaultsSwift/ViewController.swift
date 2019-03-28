//
//  ViewController.swift
//  UserDefaultsSwift
//
//  Created by FM-MAC5 on 11/03/19.
//  Copyright © 2019 FM-MAC5. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

   
    
    @IBOutlet weak var btnclr: UIButton!
    @IBOutlet weak var btnSave: UIButton!
    @IBOutlet weak var txtlastname: UITextField!
    @IBOutlet weak var txtfirstname: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
      
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func btnSave(_ sender: Any) {
        let defaults = UserDefaults.standard
        
        defaults.set(txtfirstname.text, forKey: "firstName")
        defaults.set(txtlastname.text, forKey: "lastName")
        defaults.synchronize()
        
    print("fn=\(String(describing: txtfirstname.text)), ln=\(txtlastname.text ?? "nothing")")
    }
    
   
    
    @IBAction func btnClear(_ sender: Any) {
        if(txtfirstname.text == ""){
            loadDefaults()
            btnclr.setTitle("Clear", for: .normal)
        }
        else {
            txtfirstname.text = ""
            txtlastname.text = ""
            btnclr.setTitle("Load", for: .normal)
        }
    }
    func loadDefaults() {
        let defaults = UserDefaults.standard
        txtfirstname.text = defaults.object(forKey: "firstName") as? String
        txtlastname.text = defaults.object(forKey: "lastName") as? String
    }
    
}

