//
//  ServerManager.swift
//  CRMClient
//
//  Created by Nurzhan Ababakirov on 3/5/20.
//  Copyright © 2020 Nurzhan Ababakirov. All rights reserved.

import UIKit
import Alamofire

class ServerManager: HTTPRequestManager  {
    
    class var shared: ServerManager {
        struct Static {
            static let instance = ServerManager()
        }
        return Static.instance
    }
}

extension ServerManager {
    
    
    func getCryptList(_ completion: @escaping ([CryptListStruct]) -> Void, _ error: @escaping (String) -> Void){
    let header: [String: String] = [:]
       self.get(url: "https://rest.coinapi.io/v1/assets/?apikey=367FB27A-371B-4DBD-AB81-E98AAFE857B2", header: header, completion: {
            (data) in
            do {
                guard let data = data else {return}
                let crpytList = try JSONDecoder().decode([CryptListStruct].self, from: data)
                DispatchQueue.main.async {
                    completion(crpytList)
                }
            } catch let err {
                       error(err.localizedDescription)
                   }
               }, error: error)
    }
}
