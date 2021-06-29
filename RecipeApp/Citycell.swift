//
//  Citycell.swift
//  RecipeApp
//
//  Created by DCS on 22/06/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class Citycell: UITableViewCell {

    private let myimageview:UIImageView = {
        let imgv = UIImageView()
        imgv.layer.cornerRadius = 10
        imgv.alpha = 0
        imgv.clipsToBounds = true
        return imgv
    }()
    
    private let mylabel:UILabel = {
        let lab = UILabel()
        lab.font = UIFont.boldSystemFont(ofSize: 22)
        return lab
    }()
    
    public let mybutton:UIButton = {
        let btn = UIButton()
        //btn.setImage(UIImage(named: ""), for: .normal)
        btn.setTitle("Click here", for: .normal)
        btn.tintColor = UIColor.black
        btn.alpha = 0
        btn.tintColor = UIColor.black
        btn.layer.cornerRadius = 5
        return btn
    }()
    
    func setupcell(title name:String, index:Int,and state:Bool)
    {
        myimageview.image = UIImage(named: name)
        mylabel.text = name
        mybutton.tag = index
        
        setupUI(at: index, with: state)
    }
    
    private func setupUI(at index:Int, with state:Bool){
        contentView.addSubview(myimageview)
        contentView.addSubview(mylabel)
        //contentView.addSubview(mybutton)
        
        myimageview.frame = CGRect(x: 20, y: 10, width: 80, height: 80)
        
        mylabel.frame = CGRect(x: myimageview.right + 20, y: 10, width: 140, height: 80)
        myimageview.alpha = 1
        mybutton.alpha = 1
        
        /*if state{
            mylabel.frame = CGRect(x: myimageview.right + 20, y: 10, width: 140, height: 80)
            myimageview.alpha = 1
            mybutton.alpha = 1
        }else{
            mylabel.frame = CGRect(x: 20, y: 10, width: 140, height: 80)
            myimageview.alpha = 0
            mybutton.alpha = 0
        }*/
        
        mybutton.frame = CGRect(x: contentView.width - 80, y: 10, width: 40, height: 80)
    }
    
    func animatecall(at index:Int){
  
        
        /*UIView.animate(withDuration: 0.3, delay: 0.0, options: .curveLinear,animations: nil,completion: nil){
            self.myimageview.transform = self.myimageview.transform.rotated(by: .pi)
            self.myimageview.alpha = 0.5
            self.mybutton.alpha = 0.5
            self.mylabel.frame.origin.x = self.myimageview.right + 20
        } completion:{ _ in
            UIView.animate(withDuration: 0.3, delay: 0.0, options: .curveLinear){
                self.myimageview.transform = self.myimageview.transform.rotated(by: .pi)
                self.myimageview.alpha = 1
                self.mybutton.alpha = 1
            }
        }*/
    }
}
