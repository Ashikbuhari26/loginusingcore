//
//  signupcontroller.swift
//  Loginusingcore
//
//  Created by Mohamed Ashik Buhari on 19/04/22.
//
import UIKit
import CoreData

class signupcontroller: UIViewController {
    
    
    @IBOutlet weak var usernamefield2: UITextField!
    
    @IBOutlet weak var passwordfield2: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }
    
    @IBAction func signupbutton(_ sender: Any) {
    
        let app = UIApplication.shared.delegate as! AppDelegate

           let context = app.persistentContainer.viewContext

       let newUser = NSEntityDescription.insertNewObject(forEntityName: "Users", into: context) as NSManagedObject
            newUser.setValue(usernamefield2.text, forKey: "username")
            newUser.setValue(passwordfield2.text, forKey: "password")
            
            do {
                try context.save()
                print("data saved")
                
                
            } catch {}
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "Logoutcontroller") as? Logoutcontroller
        self.navigationController?.pushViewController(vc!, animated: true)
        
    }
    
    
    
    
}
