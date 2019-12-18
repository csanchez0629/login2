//
//  ViewController.swift
//  login2
//
//  Created by CARLOS Sanchez on 11/20/19.
//  Copyright © 2019 CARLOS Sanchez. All rights reserved.
//
import UIKit
var loadCheck = false




class ViewController: UIViewController {
    @IBOutlet weak var btnStaffList: UIButton!
    @IBOutlet weak var lblMENU: UILabel!
    var message = "Main Menu"
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.performSegue(withIdentifier: "toLogin", sender: "menu")
        // Do any additional setup after loading the view.
        
       
         }
    
    @IBAction func getStaffList(_ sender: Any) {
       
         
         self.performSegue(withIdentifier: "StaffList", sender: "Main")
          }
    
    
   
    override func viewDidAppear(_ animated: Bool){
       
        if (loadCheck == false){
        self.performSegue(withIdentifier: "toLogin", sender: "Main")
        }
        else{
            
//            print("Welcome Daddy")
            message = "Welcome Daddy"
            self.lblMENU.text = (self.message)
            
        }
        
        
        
    }
        
        
    
//
    

    
//    }


    
    
    
    
    
   
  
//    class LoggedInViewController: UIViewController {
//
//        func loadHomeScreen(){
//            let storyBoard: UIStoryboard = UIStoryboard(name: "menu", bundle: nil)
//            let menu = storyBoard.instantiateViewController(withIdentifier: "menu") as! LoggedInViewController
//            self.present(menu, animated: true, completion: nil)
//        }
//
//
//    }

}

class LOGIN: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var NAME: UITextField!
    @IBOutlet var PASSWORD: UITextField!
//
    override func viewDidLoad() {
    super.viewDidLoad()
    }
    
    @IBAction func btnLOGIN(_ sender: Any) {
        let name: String = NAME.text!
        let password: String = PASSWORD.text!
        if ( name == "carlos") && (password  == "!@mNut$!"){
        loadCheck = true
            
            print("hello ")
            self.performSegue(withIdentifier: "SUCCESS", sender: "Main")
        }
        else {
    
                print("credentials not correct")
            }
}
}
    
    class StaffList:UIViewController{
        
        @IBOutlet weak var SList: UILabel!;
        
        
        
        
       override func viewDidLoad()
        {
            super.viewDidLoad();
            
            var error:NSError? =  nil
            var data = NSData (data: <#T##Data#>);
         
            if(error != nil)
            {
                let json = (JSONSerialization(),
                JSONObjectWithData:data,
                options:JSONSerialization.ReadingOptions.allowFragments,
                                      error:error);
              
                
                let array = (json, objectForKey:"GetAllEmployeesMethodResult");
                let i=0
//                for data in json
//                {
//                    NSDictionary * empInfo =  (array, objectAtIndex:i);
//
//                    NSString * first = (empInfo, objectForKey:"firstname");
//                    NSString * last = (empInfo, objectForKey:"lastname");
//                    NSString * salary  = (empInfo, objectForKey:"salary");
//
//                    //Take out whitespaces from String
//                    NSString * firstname = (first,
//                                            stringByReplacingOccurrencesOfString:" ", withString:"");
//                    NSString * lastname = (last,
//                                           stringByReplacingOccurrencesOfString:(" ", withString:""));
//
//                    SList.text = (SList.text, stringByAppendingString:(NSString, stringWithFormat:"%@ %@ makes $%@.00 per year.\n",firstname,lastname,salary));
//                }
                
            }
        }
        
    }

//    @IBAction func getSTRING(String: String)
//    {
//        _  = NAME.text
//    }
    
    
    
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        if NAME
//    }}


