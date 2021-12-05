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
        let btn = UIButton()
        btn.layer.cornerRadius = 10
        btn.setTitle("A", for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 32)
        btn.titleLabel?.textColor = .black
        btn.backgroundColor = .link
        btn.addTarget(self, action:#selector(buttonA), for: .touchUpInside)
        return btn
    }()
    
    let btn2:UIButton = {
        let btn = UIButton()
        btn.layer.cornerRadius = 10
        btn.setTitle("B", for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 32)

        btn.titleLabel?.textColor = .black
        btn.backgroundColor = .link
        btn.addTarget(self, action:#selector(buttonB), for: .touchUpInside)
        return btn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        title = "Elm Task"
        view.addSubview(vi)
        vi.addSubview(btn1)
        vi.addSubview(btn2)

        vi.anchor(top: nil, leading: nil, bottom: nil, trailing:nil, size:CGSize(width: 200, height: 200), centerY: view.centerYAnchor, centerX: view.centerXAnchor)
        
        btn1.anchor(top: vi.topAnchor, leading: nil, bottom: nil, trailing:nil, size:CGSize(width: 150, height: 80), centerY: nil, centerX: vi.centerXAnchor)
        
        btn2.anchor(top: nil, leading: nil, bottom: vi.bottomAnchor, trailing:nil, size:CGSize(width: 150, height: 80), centerY: nil, centerX: vi.centerXAnchor)
        
        
    }
    @objc func buttonA(){
        navigationController?.pushViewController(ACollectionViewController(), animated: true)
    }
    @objc func buttonB(){
        navigationController?.pushViewController(BViewController(), animated: true)

    }


}

