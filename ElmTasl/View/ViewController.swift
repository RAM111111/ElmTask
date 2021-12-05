//
//  ViewController.swift
//  ElmTasl
//
//  Created by R on 28/04/1443 AH.
//  Copyright © 1443 R. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let vi:UIView = {
        let vi = UIView()
        return vi
    }()
    

    
    let btn1:UIButton = {
        let btn = UIButton.PrimaryButton(title: "A")
        btn.addTarget(self, action:#selector(buttonA), for: .touchUpInside)
        return btn
    }()
    
    
    let btn2:UIButton = {
        let btn = UIButton.PrimaryButton(title: "B")
        btn.addTarget(self, action:#selector(buttonB), for: .touchUpInside)
        return btn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Elm Task"
        setUpView()
        
    }
    
    func setUpView(){
        view.backgroundColor = .white
        view.addSubview(vi)
        vi.addSubview(btn1)
        vi.addSubview(btn2)

        vi.anchor(top: nil, leading: nil, bottom: nil, trailing:nil, size:CGSize(width: 200, height: 200), centerY: view.centerYAnchor, centerX: view.centerXAnchor)
        
        btn1.anchor(top: vi.topAnchor, leading: nil, bottom: nil, trailing:nil, size:CGSize(width: 150, height: 80), centerY: nil, centerX: vi.centerXAnchor)
        
        btn2.anchor(top: nil, leading: nil, bottom: vi.bottomAnchor, trailing:nil, size:CGSize(width: 150, height: 80), centerY: nil, centerX: vi.centerXAnchor)
        
    }
    @objc func buttonA(){
        //for collection view
        navigationController?.pushViewController(ACollectionViewController(), animated: true)
        //for table view
//        navigationController?.pushViewController(AViewController(), animated: true)

    }
    @objc func buttonB(){
        navigationController?.pushViewController(BViewController(), animated: true)

    }


}

