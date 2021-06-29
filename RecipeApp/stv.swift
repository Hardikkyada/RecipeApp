//
//  ViewController.swift
//  RecipeApp
//
//  Created by DCS on 22/06/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class stv: UIViewController {
    
    private let mytableview = UITableView()
    private var tabledata = ["a","b","c","d","e","f","a","b","c","d","e","f","a","b","c","d","e","f","a","b","c","d","e","f"]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(refreshdata))
        view.addSubview(mytableview)
        mytableviewsetup()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        mytableview.frame = CGRect(x: 0, y: view.safeAreaInsets.top, width: view.width, height: view.height-view.safeAreaInsets.top - view.safeAreaInsets.bottom)
    }
}


extension stv: UITableViewDataSource,UITableViewDelegate{
    
    private func mytableviewsetup(){
        mytableview.dataSource = self
        mytableview.delegate = self
        mytableview.register(UITableViewCell.self, forCellReuseIdentifier: "tabledata")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tabledata.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "tabledata",for: indexPath)
        cell.textLabel?.text = tabledata[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(tabledata[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            mytableview.beginUpdates()
            tabledata.remove(at: indexPath.row)
            mytableview.deleteRows(at: [indexPath], with: .fade)
            mytableview.endUpdates()
        }
    }
    
    @objc func refreshdata()
    {
        tabledata.shuffle()
        mytableview.reloadData()
    }
    
}



