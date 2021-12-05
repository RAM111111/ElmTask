//
//  BViewController.swift
//  ElmTasl
//
//  Created by R on 29/04/1443 AH.
//  Copyright © 1443 R. All rights reserved.
//

import UIKit

class BViewController: UIViewController {
    
    let MyView:UIView = {
        let view = UIView()
        return view
    }()
    
    let UserTxt:UITextField = {
        let tf = UITextField()
        tf.placeholder = "00:00 am "
        tf.textAlignment = .center
        tf.layer.borderWidth = 1
        tf.layer.cornerRadius = 15
        tf.layer.borderColor = UIColor.lightGray.cgColor
        return tf
    }()
    
    let Label:UILabel = {
        let lbl = UILabel()
        lbl.textAlignment = .center
        return lbl
    }()
    
    let convertTimeButton:UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .link
        btn.layer.cornerRadius = 15
        btn.addTarget(self, action: #selector(converter), for: .touchUpInside)
        btn.setTitle("Convert", for: .normal)
        return btn
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "B"
        setupViews()
      
    }
    
    func setupViews(){
        view.backgroundColor = .white
        view.addSubview(MyView)
              MyView.addSubview(UserTxt)
              MyView.addSubview(convertTimeButton)
              MyView.addSubview(Label)
              
              
              MyView.anchor(top: nil, leading: nil, bottom: nil, trailing: nil, size:CGSize(width: view.bounds.width / 2, height: 250), centerY: view.centerYAnchor, centerX: view.centerXAnchor)
              
              UserTxt.anchor(top: MyView.topAnchor, leading: MyView.leadingAnchor, bottom: nil, trailing: MyView.trailingAnchor,size: CGSize(width: 0, height:60))
              
              convertTimeButton.anchor(top: nil, leading: MyView.leadingAnchor, bottom: nil, trailing: MyView.trailingAnchor,size: CGSize(width: 0, height:60), centerY: MyView.centerYAnchor, centerX: nil)
              
              Label.anchor(top: nil, leading: MyView.leadingAnchor, bottom: MyView.bottomAnchor, trailing: MyView.trailingAnchor,size: CGSize(width: 0, height: 60))
    }
    

    
    @objc func converter(){
        let time = UserTxt.text
        if  time != "" {
            var timeToArray = Array<Character>(time!)
            print(timeToArray)
            let last = timeToArray[time!.count - 1]
            let blast = timeToArray[time!.count - 2]
            let rr = "\(blast)\(last)"
            timeToArray.removeLast()
            timeToArray.removeLast()
            if timeToArray.last == " "{
                timeToArray.removeLast()
            }
            print(rr)
            print(String(timeToArray))
            Label.text = formated(string: "\(String(timeToArray)) \(blast)\(last)" )
        }else{
           Label.text = "type correct time formats"
        }
    }
    
    func formated(string:String)->String{
        let dateAsString = string
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "h:mm:ss a"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        let date = dateFormatter.date(from: dateAsString)

        dateFormatter.dateFormat = "HH:mm:ss"
        let date24 = dateFormatter.string(from: date!)
        return date24
        
    }


}
