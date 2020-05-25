//
//  ViewController.swift
//  WeatherAPI
//
//  Created by Quang Kham on 21/05/2020.
//  Copyright © 2020 Quang Kham. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // URL
        let url = URL(string: "https://google-translate1.p.rapidapi.com/language/translate/v2")
        guard url != nil else {
            return
            print("Error creating url object")
        }
        
        //URL Request
        var request =  URLRequest(url: url!, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
        
        //Speicfy the header
        let headers = [
            "x-rapidapi-host": "google-translate1.p.rapidapi.com",
            "x-rapidapi-key": "84c4f2ad93msh119e70a7633428bp171647jsn8140d60c9724",
            "accept-encoding": "application/gzip",
            "content-type": "application/x-www-form-urlencoded"
                    ]
        request.allHTTPHeaderFields = headers
        
        let postData = NSMutableData(data: "source=en".data(using: String.Encoding.utf8)!)
        postData.append("&q=Hello, world!".data(using: String.Encoding.utf8)!)
        postData.append("&target=es".data(using: String.Encoding.utf8)!)
        request.httpBody = postData as Data
        
        // Set the request type
        request.httpMethod = "POST"
        // Get the URLSession
        let session = URLSession.shared
        
        //Create the data task
        let dataTask = session.dataTask(with: request) { (data, response, error) in
            //check errors
            if  error == nil && data != nil {
                //Try to parse out the data
                do {
                    let dictionary = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? [String :Any]
                    print(dictionary) // change response data object to json object 
                }
                catch {
                    print("Error parsing response data")
                }
                
            }
        }
        // Fire off the data task
        dataTask.resume()
        
                
    }


}

