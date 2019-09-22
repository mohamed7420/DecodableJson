//
//  ViewController.swift
//  DecodableJson
//
//  Created by Mohamed on 9/23/19.
//  Copyright © 2019 Mohamed74. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let url = URL(string: "https://jsonplaceholder.typicode.com/posts")
    
    struct Posts:Decodable{
        
        var userId:Int
        var title:String
        var body:String
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            
            do{
                
            if let data = data {
                
                let decode = try JSONDecoder().decode([Posts].self, from: data)
                
                for i in decode{
                    
                    print(i.title)
                }
                
            }
                
            }catch{
                
                print(error.localizedDescription)
            }
            
        }.resume()
        
        
        
    }


}

