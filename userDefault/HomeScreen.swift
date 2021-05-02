//
//  HomeScreen.swift
//  userDefault
//
//  Created by macbook on 02/05/2021.
//

import UIKit



class HomeScreen: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func Logout(_ sender: UIButton) {
      //  userdefault.set(false, forKey: "logOne")
        UserDefaults.standard.setLoggedIn(value: false)
     //   self.navigationController?.popViewController(animated: true)
        let homeVc = self.storyboard?.instantiateViewController(withIdentifier: "login") as! ViewController
//                    self.navigationController?.pushViewController(homeVc, animated: true)
        homeVc.modalPresentationStyle = .fullScreen
        self.present(homeVc, animated: true, completion: nil)
        
    }
    

}
