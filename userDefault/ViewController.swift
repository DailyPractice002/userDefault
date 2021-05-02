//
//  ViewController.swift
//  userDefault
//
//  Created by macbook on 02/05/2021.
//

import UIKit


struct jsonstruct: Codable {
    let name:String
    let password:String
}

enum UserDefaultsKeys : String {
    case isLoggedIn
    case userID
}
class ViewController: UIViewController {
   

    
    var arrdata = [jsonstruct]()

    @IBOutlet weak var txtUserName: UITextField!
    @IBOutlet weak var txtPwd: UITextField!
    
    let url1 = URL(string: "https://run.mocky.io/v3/56f6e931-7989-48a7-bacd-b793a7311023")
    override func viewDidLoad() {
        super.viewDidLoad()
       
        UrlData(url: url1!)
        // Do any additional setup after loading the view.
        
    }
  
    
    
    func UrlData(url:URL){
         let sessino =   URLSession.shared.dataTask(with: url) { (data, response, error) in
            do{
                
               if data != nil {
                    let data = try JSONDecoder().decode([jsonstruct].self, from: data!)
                self.arrdata.append(contentsOf: data)
                
                }
            }catch{
               
                print("Error in get json data")
            }
            
        }
        sessino.resume()
    }
    @IBAction func LoginBtn(_ sender: UIButton) {
        let username = txtUserName.text
        let password = txtPwd.text
         for userdata in arrdata{
            if userdata.name.contains(username!) == true && userdata.password.contains(password!) == true {
                let homeVc = self.storyboard?.instantiateViewController(withIdentifier: "hm") as! HomeScreen
//                    self.navigationController?.pushViewController(homeVc, animated: true)
                homeVc.modalPresentationStyle = .fullScreen
                self.present(homeVc, animated: true, completion: nil)
                 
                    //UserDefaults.standard.set(true, forKey: "logOne")
                UserDefaults.standard.setLoggedIn(value: true)          // String
                 //   UserDefaults.standard.synchronize()
                
            }else  if userdata.name.contains(username!) != true  && userdata.password.contains(password!) != true{
                showMeAlert()
            }
           
        }
       
    }
    
    
      func showMeAlert(){
          let alertController = UIAlertController(title: "Error", message: "The user Name or password you enter is incurrect, Please try again", preferredStyle: .alert)
          let OKAction = UIAlertAction(title: "OK", style: .default) {
              (action: UIAlertAction!) in
              // Code in this block will trigger when OK button tapped.
              print("Ok button tapped");
          }
          alertController.addAction(OKAction)
           present(alertController, animated: true, completion: nil)
      }
}

extension UserDefaults{

    //MARK: Check Login
    func setLoggedIn(value: Bool) {
        set(value, forKey: UserDefaultsKeys.isLoggedIn.rawValue)
        //synchronize()
    }

    func isLoggedIn()-> Bool {
        return bool(forKey: UserDefaultsKeys.isLoggedIn.rawValue)
    }

    
}
