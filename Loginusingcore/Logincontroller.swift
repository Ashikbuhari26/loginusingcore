//
//  Logincontroller.swift
//  Loginusingcore
//
//  Created by Mohamed Ashik Buhari on 19/04/22.
//

import UIKit
import CoreData

class Logincontroller: UIViewController {

    
    @IBOutlet weak var usernamefield: UITextField!
    
    @IBOutlet weak var passwordfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginbutton(_ sender: Any) {
        let app = UIApplication.shared.delegate as! AppDelegate

           let context = app.persistentContainer.viewContext
           let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
            request.predicate = NSPredicate(format: "username = %@", "" + usernamefield.text!)

        let results:NSArray = try! context.fetch(request) as NSArray



            if(results.count != 0){
                let res = results[0] as! NSManagedObject
                    if passwordfield.text == res.value(forKey: "password") as? String {
                        let vc = self.storyboard?.instantiateViewController(withIdentifier: "Logoutcontroller") as! Logoutcontroller
                        self.navigationController?.pushViewController(vc, animated: true)
                    } else {
                        let alert = UIAlertController(title:nil, message: "incorrect password", preferredStyle: UIAlertController.Style.alert)

                                // add an action (button)
                                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))

                                // show the alert
                                self.present(alert, animated: true, completion: nil)                    }


                //for res in results {
                 


            }else{
                let alert = UIAlertController(title:nil, message: "incorrect username and password", preferredStyle: UIAlertController.Style.alert)
                
                // add an action (button)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))

                // show the alert
                self.present(alert, animated: true, completion: nil)
            }


        }
}
