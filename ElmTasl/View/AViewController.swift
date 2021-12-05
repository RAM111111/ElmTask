//
//  AViewController.swift
//  ElmTasl
//
//  Created by R on 29/04/1443 AH.
//  Copyright © 1443 R. All rights reserved.
//

import UIKit

class AViewController: UIViewController {
     let getdata = getApi()
        let tv:UITableView = {
           let tv = UITableView()
            tv.register(UITableViewCell.self, forCellReuseIdentifier: "a")
            return tv
        }()
        
    var busnessess = [Api]()
        override func viewDidLoad() {
            super.viewDidLoad()
            getdata.ApiData{
            data in
                self.busnessess = data
                  self.tv.reloadData()
                
            }
            setupViews()

        }
    
    func setupViews(){
        view.backgroundColor = .white
        view.addSubview(tv)
        tv.delegate = self
        tv.dataSource = self
        tv.separatorStyle = .none
        tv.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor, centerY: nil, centerX:nil)
    }


    }

    extension AViewController:UITableViewDelegate,UITableViewDataSource{
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return busnessess.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tv.dequeueReusableCell(withIdentifier: "a", for: indexPath)
            cell.textLabel?.text = busnessess[indexPath.row].user.name
            let url = URL(string: busnessess[indexPath.row].user.profile_image.medium)
            let data = try? Data(contentsOf: url!)
            cell.imageView?.image = UIImage(data: data!)
            return cell
        }
        
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 100
        }
        
        
        
    }

