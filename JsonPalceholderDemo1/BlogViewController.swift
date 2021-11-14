//
//  BlogViewController.swift
//  JsonPalceholderDemo1
//
//  Created by MAC on 10/07/2021.
//

import UIKit

class BlogViewController: UIViewController {
    @IBOutlet weak var tableView : UITableView!

    var comments : [Comments] = [] {
        didSet{
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    let moviesManager = MovieManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(UINib(nibName: String(describing: CommentsViewCell.self), bundle: .main), forCellReuseIdentifier: String(describing: CommentsViewCell.self))
        
    }
    override func viewDidAppear(_ animated: Bool) {
        moviesManager.loadData2 { [weak self] (comment) in
            self?.comments = comment
        }
        self.addRefreshControl()
    }
    
    //refresh controller working fine
    func addRefreshControl() {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
        self.tableView.refreshControl = refreshControl
    }
    
    @objc func refresh(_ sender: UIRefreshControl){
        self.moviesManager.loadData2 { (comment) in
            self.comments = comment
        }
        /*
        self.movieManager.loadData { (movies) in
            self.movies = movies
        }*/
        sender.endRefreshing()//it helps to end the loading
    }
}

extension BlogViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        configureCommetsCell(tableView, cellForRowAt: indexPath)
    }
    
    

    func configureCommetsCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: CommentsViewCell.self)) as? CommentsViewCell else {return UITableViewCell()}
        cell.commmentsData = self.comments[indexPath.row]
        cell.deletBtn.tag = indexPath.row
        cell.deletBtn.addTarget(self, action: #selector(btnCellTapped(sender:)), for: .touchUpInside)
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    @objc
    func btnCellTapped(sender: UIButton){
     //for button click it called this function
        
        //delete row when click on delete button
        print("faheem \(sender.tag)")
        if self.comments.count > 0{
            self.comments.remove(at: sender.tag)
        }
        

    }
}
