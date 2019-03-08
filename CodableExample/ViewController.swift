//
//  ViewController.swift
//  CodableExample
//
//  Created by Tendaishe Gwini on 08/03/2019.
//  Copyright © 2019 Tendaishe Gwini. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        setupView()
        fetchData()
    }

    
    
    //MARK: Properties
    
    
    private let countryManager = CountryManager()
    
    private var countries: [CountryModel] = []
    
    private lazy var countryTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.rowHeight = 50
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellID")
        return tableView
    }()

    
    
    //MARK: Methods
    
    
    func setupView() {
        
        view.addSubview(countryTableView)
        countryTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        countryTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        countryTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        countryTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        
    }
    
    
    func fetchData() {
        
        countryManager.fetchCountries { (data, error) in
            
            if error != nil {
                print(error?.localizedDescription)
                return
            }
            self.countries = data
            DispatchQueue.main.async {
                self.countryTableView.reloadData()
            }
            
        }
        
        
        
        
        
        
    }
    
    //MARK: TableView DataSource Methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath) as UITableViewCell
        cell.textLabel?.text = countries[indexPath.row].name
        return cell
    }
    
    
    
    
    
    
}

