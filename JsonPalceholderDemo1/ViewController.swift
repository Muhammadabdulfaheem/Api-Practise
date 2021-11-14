//
//  ViewController.swift
//  JsonPalceholderDemo1
//
//  Created by MAC on 24/06/2021.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var movies: [Movie] = []{
        didSet{
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    let movieManager = MovieManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(UINib(nibName: String(describing: MovieCell.self), bundle: .main), forCellReuseIdentifier: String(describing: MovieCell.self))
        //self.addRefreshControl()

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
//        movieManager.loadData {[weak self] (movies) in
//            self?.movies = movies
//        }
//        self.addRefreshControl()
      
    }
    
    
    func addRefreshControl() {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
        self.tableView.refreshControl = refreshControl
    }
    @objc func refresh(_ sender: UIRefreshControl){
        self.movieManager.loadData { (movies) in
            self.movies = movies
        }
        sender.endRefreshing()//it helps to end the loading
    }
   
    
    func addRefreshControl2(){
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(self.refresh1(_:)), for:.valueChanged)
        self.tableView.refreshControl = refreshControl
    }
 
    @objc func refresh1(_ sender : UIRefreshControl){
        self.movieManager.loadData { (movie) in
            self.movies = movie
        }
        sender.endRefreshing()
    }

}

extension ViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        self.movieCell(tableView, cellForRowAt: indexPath)
    }
    
    func movieCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let movieCell = tableView.dequeueReusableCell(withIdentifier: String(describing: MovieCell.self)) as? MovieCell else {return UITableViewCell()}
        movieCell.movie = self.movies[indexPath.row]
        movieCell.delete.tag = indexPath.row
        movieCell.delete.addTarget(self, action: #selector(btnCellTapped(sender:)), for: .touchUpInside)
        return movieCell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    @objc
    func btnCellTapped(sender: UIButton){
     //for button click it called this function
        
        //delete row when click on delete button
        print("faheem \(sender.tag)")
        if self.movies.count > 0{
            self.movies.remove(at: sender.tag)
        }
        

    }
}
