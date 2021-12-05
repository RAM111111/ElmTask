//
//  coolectionViewcell.swift
//  ElmTasl
//
//  Created by R on 01/05/1443 AH.
//  Copyright © 1443 R. All rights reserved.
//
import Foundation
import UIKit



class colcll:UICollectionViewCell{
    
    static let id = "a"
    
    var Views:UIView = {
    let sv = UIView()
        sv.backgroundColor = .white
        sv.layer.cornerRadius = 20
    return sv
    }()
    
    
    let cellimg :UIImageView = {
        let iv = UIImageView()
        iv.layer.masksToBounds = true
        iv.layer.cornerRadius = 25

        return iv
    }()
    
    let profileImg :UIImageView = {
        let iv = UIImageView()
        iv.layer.masksToBounds = true
        iv.layer.borderColor = UIColor.white.cgColor
        iv.layer.borderWidth = 1
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 25
        return iv
    }()
    
    let profileName :UILabel = {
        let iv = UILabel()
        iv.baselineAdjustment = .alignCenters
        iv.numberOfLines = 0
        iv.textColor = .white
        iv.font = UIFont.boldSystemFont(ofSize: 14)
        return iv
    }()
    
    var view1:UIView = {
    let sv = UIView()
    return sv
    }()
    
    var view2:UIView = {
    let sv = UIView()
    return sv
    }()
    
    let imgType :UILabel = {
        let iv = UILabel()
        iv.textColor = .white
        iv.font = UIFont.systemFont(ofSize: 12)
        return iv
    }()
    
    var viewcolor:UIView = {
    let sv = UIView()
        sv.layer.cornerRadius = 15
    return sv
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
          setupview()
    }
    
    //MARK:-setupviewfunc
    func setupview(){
          addSubview(Views)
          Views.addSubview(cellimg)
          Views.addSubview(view1)
          Views.addSubview(view2)
          view2.addSubview(profileImg)
          view2.addSubview(profileName)
          view1.addSubview(imgType)
          view1.addSubview(viewcolor)
          
          Views.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor)
          
          view1.anchor(top: nil, leading: Views.leadingAnchor, bottom: view2.topAnchor, trailing: Views.trailingAnchor, padding:UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16) , size: CGSize(width: Views.bounds.width, height: 10))
         
          view2.anchor(top:nil, leading: Views.leadingAnchor, bottom: Views.bottomAnchor, trailing: Views.trailingAnchor, padding:UIEdgeInsets(top: 0, left: 16, bottom: 16, right: 16), size: CGSize(width: Views.bounds.width, height: 40))
          
          cellimg.anchor(top: Views.topAnchor, leading: Views.leadingAnchor, bottom: nil, trailing: Views.trailingAnchor, padding:.zero, size: CGSize(width: 0, height: 300))
        
          profileImg.anchor(top: nil, leading:nil , bottom:view2.bottomAnchor, trailing: view2.trailingAnchor, padding: .zero, size: CGSize(width: 50, height: 50))
          
          profileName.anchor(top: nil, leading:view2.leadingAnchor , bottom: view2.bottomAnchor, trailing:profileImg.leadingAnchor, padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 8), size: CGSize(width: 0, height: 50))
          
          viewcolor.anchor(top: nil, leading:nil , bottom:view1.bottomAnchor, trailing: view1.trailingAnchor, padding: .zero, size: CGSize(width: 30, height: 30))
          
          imgType.anchor(top: nil, leading:view1.leadingAnchor , bottom: view1.bottomAnchor, trailing:profileImg.trailingAnchor, padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 8), size: CGSize(width: 0, height: 30))
          
          
    }
    //MARK:-configfunc

    func config(api:Api){
        let url = URL(string: api.urls.regular)!
        let data = try? Data(contentsOf: url)
        if let data = data{
            cellimg.image = UIImage(data: data)
            print(data)
        }
        
                let url1 = URL(string: api.user.profile_image.medium)!
                let data1 = try? Data(contentsOf: url1)
                if let data1 = data1{
                profileImg.image = UIImage(data: data1)
                print(data1)
                }
                
                imgType.text =  api.categories[0].title
                print(api.categories[0].title)
                
                profileName.text =  api.user.name
                print(api.user.name)
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

