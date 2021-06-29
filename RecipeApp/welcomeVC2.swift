//
//  welcomeVC2.swift
//  RecipeApp
//
//  Created by DCS on 25/06/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class welcomeVC2: UIViewController {

    //button.imageEdgeInsets = UIEdgeInsetsMake(0., button.frame.size.width - (image.size.width + 15.), 0., 0.);
    //button.titleEdgeInsets = UIEdgeInsetsMake(0., 0., 0., image.size.width);
    
    public let imageview:UIImageView = {
        let imgv = UIImageView()
        imgv.image = UIImage(named: "safe2")
        imgv.layer.cornerRadius = 40
        imgv.clipsToBounds = true
        return imgv
    }()
    
    private let mylabel:UILabel = {
        let lab = UILabel()
        lab.text = "Are You Vegetarian?"
        lab.textAlignment = .center
        lab.font = UIFont.boldSystemFont(ofSize: 20)
        //lab.backgroundColor = UIColor.white
        return lab
    }()
    
    //let icon = UIImage(named: "bmiCalculator")!
    //button.setImage(icon, for: .normal)
    //button.imageView?.contentMode = .scaleAspectFit
    //button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -20, bottom: 0, right: 0)
    
    
    //CGSize imageSize = button.imageView.image.size;
    //button.titleEdgeInsets = UIEdgeInsetsMake(0.0, - imageSize.width, 0.0, 0.0);
    
    private let veg:UIButton = {
        let btn = UIButton()
        let imag = UIImage(named: "veg")
        
        btn.setImage(imag, for: .normal)
        btn.imageView?.contentMode = .scaleAspectFit
        btn.imageEdgeInsets = UIEdgeInsets(top: 0,left: 10,bottom: 0,right: 80)
        
        btn.setTitle("Yes", for: .normal)
        btn.titleEdgeInsets = UIEdgeInsets(top: 0, left: -120, bottom: 0, right: 0)
        btn.addTarget(self, action: #selector(vegaction), for: .touchUpInside)
        btn.setTitleColor(UIColor.black, for: .normal)
        btn.backgroundColor = UIColor.white
        btn.layer.cornerRadius = 25
        return btn
    }()
    
    private let nonveg:UIButton = {
        let btn = UIButton()
        
        let imag = UIImage(named: "nonveg")
        
        btn.setImage(imag, for: .normal)
        btn.imageView?.contentMode = .scaleAspectFit
        btn.imageEdgeInsets = UIEdgeInsets(top: 10,left: 10,bottom: 10,right: 80)
        
        btn.setTitle("No", for: .normal)
         btn.titleEdgeInsets = UIEdgeInsets(top: 0, left: -200, bottom: 0, right: 0)
        btn.addTarget(self, action: #selector(nonvegaction), for: .touchUpInside)
        btn.setTitleColor(UIColor.black, for: .normal)
        btn.backgroundColor = UIColor.white
        btn.layer.cornerRadius = 25
        return btn
    }()
    
    
    private let both:UIButton = {
        let btn = UIButton()
        let imag = UIImage(named: "both3")
        
        btn.setImage(imag, for: .normal)
        btn.imageView?.contentMode = .scaleAspectFit
        btn.imageEdgeInsets = UIEdgeInsets(top: 10,left: 0,bottom: 10,right: 80)
        
        btn.setTitle("Both", for: .normal)
        btn.titleEdgeInsets = UIEdgeInsets(top: 0, left: -180, bottom: 0, right: 0)
        btn.addTarget(self, action: #selector(bothaction), for: .touchUpInside)
        btn.setTitleColor(UIColor.black, for: .normal)
        btn.backgroundColor = UIColor.white
        //btn.setBackgroundImage(image, for: UIControl.State.selected)
        btn.layer.cornerRadius = 25
        return btn
    }()
    
    @objc func vegaction(){
        let vc = ViewController()
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func nonvegaction(){
        let vc = ViewController()
        
        navigationController?.pushViewController(vc, animated: true)
    }
    @objc func bothaction(){
        let vc = ViewController()
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.init(red: 0, green: 255, blue: 0, alpha: 0.6)
        //btn.backgroundColor = UIColor.init(red: 0, green: 255, blue: 0, alpha: 0.6)
        // Do any additional setup after loading the view.
        
        view.addSubview(mylabel)
        view.addSubview(veg)
        view.addSubview(nonveg)
        view.addSubview(both)
        view.addSubview(imageview)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        mylabel.frame = CGRect(x: 40, y: 120, width: view.width - 80, height: 80)
        veg.frame = CGRect(x: 40, y: mylabel.bottom + 20, width: view.width - 80, height: 60)
        nonveg.frame = CGRect(x: 40, y: veg.bottom + 20, width: view.width - 80, height: 60)
        both.frame = CGRect(x: 40, y: nonveg.bottom + 20, width: view.width - 80, height: 60)
        imageview.frame = CGRect(x: 180, y: both.bottom + 30, width: 150, height: 180)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}



