//
//  ViewController.swift
//  RecipeApp
//
//  Created by DCS on 22/06/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private var citystate = [Int]()
    private let mytableview = UITableView()
    
    
    
    private var tabledata = [
    "aloo-gobi",
    "apple-jam",
    "banana-cake",
    "blueberry-juice",
    "eggless-black-forest-cake",
    "eggless-chocolate",
    "garlic-mushroom",
    "ghee rice",
    "gobi-manchurian",
    "idli sambar",
    "indian-dinner",
    "kadai-paneer",
    "kashmiri-pulao",
    "kothu parotta",
    "lemon rice",
    "manchow-soup",
    "masala dosa",
    "paneer",
    "rava dosa",
    "rava kesari",
    "tomato rice",
    "veg biryani",
    "vegetable-pakora"]
    private let searchbar = UISearchBar()
    private var searchdata = [String]()
    private var searching = false
    private var arrtouse = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        view.addSubview(mytableview)
        mytablesetviewsetup()
        
        view.addSubview(searchbar)
        searchbar.delegate =  self
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        searchbar.frame = CGRect(x: 0, y: view.safeAreaInsets.top, width: view.width, height: 50)
        
        mytableview.frame = CGRect(x: 0, y: searchbar.bottom+20, width: view.width, height: view.height-view.safeAreaInsets.top - view.safeAreaInsets.bottom)
    }
}

extension ViewController:UISearchBarDelegate{
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if(searchText.count == 0){
            searching = false
        }else{
            searching = true
            searchdata = tabledata.filter({ $0.lowercased().hasPrefix(searchText.lowercased()) })
        }
        
        mytableview.reloadData()
    }
}



extension ViewController: UITableViewDataSource,UITableViewDelegate{
    
    private func mytablesetviewsetup(){
        mytableview.dataSource = self
        mytableview.delegate = self
        mytableview.register(Citycell.self, forCellReuseIdentifier: "Citycell")
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return tabledata.count
        
        return searching ? searchdata.count : tabledata.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        if searching{
            arrtouse = searchdata
        }else{
            arrtouse = tabledata
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Citycell",for: indexPath) as! Citycell
        
        cell.setupcell(title: arrtouse[indexPath.row], index: indexPath.row, and: (citystate.contains(indexPath.row) ? true : false))
        //cell.mybutton.addTarget(self, action: #selector(getdata), for: .touchUpInside)
        cell.backgroundColor = UIColor.init(white: -550, alpha: 0.5)
        //cell.textLabel?.text = arrtouse[indexPath.row]
        return cell
        
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! Citycell
        
        if !citystate.contains(indexPath.row){
            citystate.append(indexPath.row)
            cell.animatecall(at: indexPath.row)
        }
        //print(tabledata[indexPath.row])
        getdata(indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            mytableview.beginUpdates()
            tabledata.remove(at: indexPath.row)
            mytableview.deleteRows(at: [indexPath], with: .fade)
            mytableview.endUpdates()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    @objc private func getdata(_ sender:Int)
    {
        navigationController?.pushViewController(webview(search: tabledata[sender]), animated: true)
    }
    
}


