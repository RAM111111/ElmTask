//
//  ACollectionViewController.swift
//  ElmTasl
//
//  Created by R on 01/05/1443 AH.
//  Copyright © 1443 R. All rights reserved.
//

import UIKit

class ACollectionViewController: UIViewController {

   let getdata = getApi()
        
        let cv:UICollectionView = {
            let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
            layout.itemSize = CGSize(width:180, height: 300)
            layout.scrollDirection = .vertical
            let cv = UICollectionView(frame:.zero , collectionViewLayout: layout)
            cv.register(colcll.self, forCellWithReuseIdentifier: colcll.id)
            cv.backgroundColor = .white
            return cv
        }()
        
        var busnessess = [Api]()

        override func viewDidLoad() {
            super.viewDidLoad()
            getdata.ApiData{
            data in
                self.busnessess = data
                  self.cv.reloadData()
            }
            setupView()
            

                }
    
    func setupView(){
        view.backgroundColor = .white
        view.addSubview(cv)
        cv.delegate = self
        cv.dataSource = self
        cv.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.safeAreaLayoutGuide.leadingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: view.safeAreaLayoutGuide.trailingAnchor,padding: UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16))
    }
    }

    extension ACollectionViewController:UICollectionViewDelegate,UICollectionViewDataSource{
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return busnessess.count
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = cv.dequeueReusableCell(withReuseIdentifier: colcll.id, for: indexPath) as! colcll
            cell.config(api: busnessess[indexPath.row])
            return cell
        }
        
        


}
