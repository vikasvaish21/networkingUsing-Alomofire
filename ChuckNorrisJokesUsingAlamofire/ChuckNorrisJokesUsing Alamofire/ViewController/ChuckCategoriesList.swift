//
//  ChuckCategoriesList.swift
//  ChuckNorrisJokesUsing Alamofire
//
//  Created by vikas on 31/10/19.
//  Copyright © 2019 project1. All rights reserved.
//

import UIKit
protocol ChuckCategoriesListDelegate:class {
    func userSelectedItem(withCategories category: String)
}

class ChuckCategoriesList: UIView{
    static let heightForRow = CGFloat(80)
    static let cellIdentifier = "cell"
    
    weak var delegate : ChuckCategoriesListDelegate?
    var categories: [String] = []
    
    init(delegate: ChuckCategoriesListDelegate){
        self.delegate = delegate
        super.init(frame: .zero)
        setup()
        setupTableView()
        fetchCategories()
}
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder: ) has not been implemented")
    }

    func fetchCategories(){
        ChuckApi.requestCategories{ categories in
            self.categories = categories
            
            DispatchQueue.main.async {
                self.chuckCategoriesTableview.reloadData()
                }
            }
        }
    
    private lazy var chuckCategoriesTableview: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorColor = .clear
        tableView.removeSpacing()
        return tableView
    }()
        
}
    
    
    extension ChuckCategoriesList: ViewCode{
        func setup(){
            setupComponents()
            setupConstraints()
        }
        
        func setupComponents(){
            addSubview(chuckCategoriesTableview)
        }
        
        func setupConstraints(){
            NSLayoutConstraint.activate([
                chuckCategoriesTableview.topAnchor.constraint(equalTo: topAnchor),
                chuckCategoriesTableview.trailingAnchor.constraint(equalTo: trailingAnchor),
                chuckCategoriesTableview.leadingAnchor.constraint(equalTo: leadingAnchor),
                chuckCategoriesTableview.bottomAnchor.constraint(equalTo: bottomAnchor)
            ])
            
        }
    }

extension ChuckCategoriesList:UITableViewDelegate,UITableViewDataSource{
   
    
    func setupTableView(){
        chuckCategoriesTableview.delegate = self
        chuckCategoriesTableview.dataSource = self
        chuckCategoriesTableview.register(UITableViewCell.self, forCellReuseIdentifier: ChuckCategoriesList.cellIdentifier)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  categories.count
       }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return ChuckCategoriesList.heightForRow
    }
       
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ChuckCategoriesList.cellIdentifier, for: indexPath)
        let cellData = categories[indexPath.row]
        cell.setupLayout(borderWidth: 0.5, borderColor:UIColor(white: 0.1, alpha: 0.1).cgColor,usingIndicator: .disclosureIndicator)
        cell.textLabel?.text = cellData.capitalized
        return cell
       }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.userSelectedItem(withCategories: categories[indexPath.row])
    }
    
}
