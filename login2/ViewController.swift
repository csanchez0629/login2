//
//  ViewController.swift
//  login2
//
//  Created by CARLOS Sanchez on 11/20/19.
//  Copyright © 2019 CARLOS Sanchez. All rights reserved.
//


import UIKit
//import "login2-Swift.h"
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
    
class StaffList: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
        
        @IBOutlet weak var SList: UILabel!;
        @IBOutlet weak var SLIST_TABLE: UITableView!
        let staffList = [staff_data]()
        let WcfSeviceURL = URL(string: "http://192.168.1.102/JsonWcfService/GetEmployees.svc/json/employees");
        
        
        
//        func parseJSONArray(inputData: NSData) {
//
//            var error: NSError? = nil
////            var jsonDictionary: Array<NSDictionary> = JSONSerialization.JSONObjectWithData(inputData, options: JSONSerialization.ReadingOptions.mutableContainers , error: &error) as Array<NSDictionary>
////
//
//
////            var result: NSDictionary = jsonDictionary[0] as NSDictionary
////
////            var value = result["key"] as? String
//
//        }
    
    

        override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view, typically from a nib.
            
            let url = URL(string: "http://192.168.1.102/JsonWcfService/GetEmployees.svc/json/employees");
            
            guard let jsonData = url
                else{
                    print("data not found")
                    return
            }
            
            guard let data = try? Data(contentsOf: jsonData) else { return }
        
            guard let json = try? JSONSerialization.jsonObject(with: data, options: []) else{return}
            
            if let dictionary = json as? [String: Any] {
                
                if let FIRST = dictionary["STAFF_FNAME"] as? String {
                     if let LAST = dictionary["STAFF_LNAME"] as? String {
                 SList.text = FIRST + " " + LAST
                }
                }
                
//                if let LAST = dictionary["STAFF_LNAME"] as? String {
//                    print("Year is \(year)")
//                }
//                if let more_info = dictionary["more_info"] as? Double {
//                    //This doesn't get printed.
//                    print("More_info is \(more_info)")
//                }
//
//                for (key, value) in dictionary {
//                    print("Key is: \(key) and value is \(value)" )
//                }
                
            }
            
            //Now lets populate our TableView
            let newUrl = URL(string: "http://192.168.1.102/JsonWcfService/GetEmployees.svc/json/employees");
            
            
            guard let j = newUrl
                else{
                    print("data not found")
                    return
            }
            
            guard let d = try? Data(contentsOf: j)
                else { print("failed")
                    return
                    
            }
            
            guard let rootJSON = try? JSONSerialization.jsonObject(with: d, options: [])
                else{ print("failedh")
                    return
                    
            }
            
            if let JSON = rootJSON as? [String: Any] {
                SList.text = JSON["STAFF_FNAME STAFF_LNAME"] as? String
                
                guard let jsonArray = JSON["Staff_List"] as? [[String: Any]] else {
                    return
                }
                
                print(jsonArray)
                let name = jsonArray[0]["name"] as? String
                print(name ?? "NA")
                print(jsonArray.last!["year"] as? Int ?? 1970)
                
                for json in jsonArray
                {
                    guard let firstName = json["STAFF_FNAME"] as? String else{ return }
                    guard let lastName = json["STAFF_LNAME"] as? String else{ return }
                    guard let staffUser = json["STAFF_USER"] as? String else{ return }
                    guard let staffPassword = json["STAFF_PASS"] as? String else{ return }

                    
                }
                
                self.SLIST_TABLE.reloadData()
                
            }
                 
        }

        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return staffList.count
        }
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            
        }

        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let currentStaff = staffList[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as UITableViewCell
            cell.textLabel?.text = currentStaff.firstName
            cell.detailTextLabel?.text = "\(currentStaff.lastName)"
            cell.detailTextLabel?.text = "\(currentStaff.staffUser)"
            cell.detailTextLabel?.text = "\(currentStaff.staffPassword)"
            
            return cell
        }

    }

    struct staff_data {
        
        let firstName: String
        let lastName: String
        let staffUser: String
        let staffPassword: String
        
        public init(firstName: String,lastName: String,staffUser: String,staffPassword: String) {
            self.firstName = firstName
            self.lastName = lastName
            self.staffUser = staffUser
            self.staffPassword = staffPassword
        }
    
        
//       override func viewDidLoad()
//        {
//            super.viewDidLoad()
//            let url = Bundle.main.url(forResource: "response", withExtension: "json")
//
//            guard let jsonData = url else{return}
//            guard let data = try? Data(contentsOf: jsonData) else { return }
//            guard let json = try? JSONSerialization.jsonObject(with: data, options: []) else{return}
//
//            if let dictionary = json as? [String: Any] {
//
//                if let title = dictionary["title"] as? String {
//                 SList.text = title
//                }
//
//                if let year = dictionary["year"] as? Double {
//                    print("Year is \(year)")
//                }
//                if let more_info = dictionary["more_info"] as? Double {
//                    //This doesn't get printed.
//                    print("More_info is \(more_info)")
//                }
//
//                for (key, value) in dictionary {
//                    print("Key is: \(key) and value is \(value)" )
//                }
//
//            }
//            self.getJson()
//            }
//
//            func getJson(){
//
//                let url = URL(string: "http://192.168.1.102/JsonWcfService/GetEmployees.svc/json/employees")
//                let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
//                    if error != nil
//                    {
//                        print ("ERROR")
//                    }
//                    else
//                    {
//                        if let content = data
//                        {
//                            do
//                            {
//                                    //Dic
//                                    guard let myJson:[String:Any] = try JSONSerialization.jsonObject(with: content, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String:Any] else {return}
//                                    //print(myJson)
//
//                                    for items in myJson {
//                                        var array: Array<NSDictionary> = JSONSerialization.JSONObjectWithData(inputData, options: NSJSONReadingOptions.MutableContainers, error: &error) as Array<NSDictionary>
//
////                                        Dictionary * empInfo =  (array, objectAtIndex:i);
//
//                                                            let first = (content, objectForKey:"firstname");
//                                                           let last = (content, objectForKey:"lastname");
//                                                          let salary  = (content, objectForKey:"salary");
//
//                                                            //Take out whitespaces from String
//                                                            let firstname = (first,
//                                                                                    stringByReplacingOccurrencesOfString:" ", withString:"");
//                                                           let lastname = (last,
//                                                                                   stringByReplacingOccurrencesOfString:(" ", withString:""));
//                                        SList.text = (content, objectForKey:"firstname");
//                                                            SList.text = (SList.text, stringWithFormat:"%@ %@ makes $%@.00 per year.\n",firstname,lastname,salary));
////                                        print(items)
//
//                                    }
//
//                                    //here is the single value part, it looks for the rates then it puts it in label.
//
//                                    if let  rates = myJson["rates"] as? NSDictionary{
//
//
//                                        if let currency = rates["AUD"]{
//
//
//                                            print(currency);
//
//                                           // self.label.text=String(describing: currency)
//
//
//                                        }
//
//
//                                    }
//
//                                }
//
//                                catch
//                                {
//
//
//                                }
//                            }
//                        }
//                    }
//                    task.resume()
//                }
            }
            
//            var error:NSError? =  nil
//            var data = NSData (data: <#T##Data#>);
//
//            if(error != nil)
//            {
//                let json = (JSONSerialization(),
//                JSONObjectWithData:data,
//                options:JSONSerialization.ReadingOptions.allowFragments,
//                                      error:error);
//
//
//                let array = (json, objectForKey:"GetAllEmployeesMethodResult");
//                let i=0
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
                
            
        
        
    

//    @IBAction func getSTRING(String: String)
//    {
//        _  = NAME.text
//    }
    
    
    
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        if NAME
//    }}


