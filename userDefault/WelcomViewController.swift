//
//  WelcomViewController.swift
//  userDefault
//
//  Created by Sikandar Ali on 02/05/2021.
//

import UIKit

class WelcomViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let val =   UserDefaults.standard.isLoggedIn()
            if val == true  {
                  let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
                   let viewController = storyboard.instantiateViewController(withIdentifier: "HomeScreen") as! HomeScreen
                present(viewController, animated: true, completion: nil)
           }else if val == false {
               let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
               let viewController = storyboard.instantiateViewController(withIdentifier: "login") as! ViewController
               present(viewController, animated: true, completion: nil)
           }

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
