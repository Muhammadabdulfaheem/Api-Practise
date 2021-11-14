//
//  MovieController.swift
//  JsonPalceholderDemo1
//
//  Created by MAC on 30/06/2021.
//

import UIKit

class MovieController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var netflixMovies : [Netflix] = []{
        didSet{
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    let netflixManager = NetflixManager()
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(UINib(nibName: String(describing: NetflixCell.self), bundle: .main), forCellReuseIdentifier: String(describing: NetflixCell.self))
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        netflixManager.loadData{[weak self] (movies) in
            self?.netflixMovies = movies
        }
        addRefreshController()
    }
    
    func addRefreshController(){
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
        self.tableView.refreshControl = refreshControl
        
    }
    @objc func refresh(_ sender:UIRefreshControl){
        self.netflixManager.loadData{(movies) in
            self.netflixMovies = movies
            
        }
        sender.endRefreshing()
    }
    

}

extension MovieController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return netflixMovies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        self.configureMovieCell(tableView, cellForRowAt: indexPath)
    }
    
    func configureMovieCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        guard let movieCell = tableView.dequeueReusableCell(withIdentifier: String(describing: NetflixCell.self))
                as? NetflixCell else { return UITableViewCell()}
        movieCell.netflix = self.netflixMovies[indexPath.row]
        movieCell.shareBtn.tag = indexPath.row
        movieCell.shareBtn.addTarget(self, action: #selector(ShareData(sender:)), for:.touchUpInside)
        return movieCell
        
    }
    
    /*
    func savedImage(resoursceData: Any){
        guard let imageData = lblImage.image?.jpegData(compressionQuality: 0.8) else {print("no data present");return}
        let activiityController = UIActivityViewController(activityItems: [imageData], applicationActivities: [])
        activiityController.popoverPresentationController?.sourceView = resoursceData as? UIView
        present(activiityController, animated: true, completion: nil)
        //how i can show the uialert when user savign image using completion handler

    }
 */
   @objc func ShareData(sender: UIButton){
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
}
