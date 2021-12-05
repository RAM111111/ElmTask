//
//  ViewModel.swift
//  ElmTasl
//
//  Created by R on 29/04/1443 AH.
//  Copyright © 1443 R. All rights reserved.
//

import Foundation
struct getApi{
    func ApiData(comp: @escaping([Api])->()) {
        let api = URL(string:"https://pastebin.com/raw/wgkJgazE")

        URLSession.shared.dataTask(with: api!) { (data, res, err) in
            if  err != nil{
                print(err!.localizedDescription)
            }
            if let data = data{
                do{
                    let result = try JSONDecoder().decode([Api].self, from: data)
                    DispatchQueue.main.async {
                       comp(result)
                    }
                }catch{
                    print("no data")
                }
            }
        }.resume()
    }
}

