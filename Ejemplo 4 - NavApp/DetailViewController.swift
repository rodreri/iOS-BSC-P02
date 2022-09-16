//
//  DetailViewController.swift
//  Ejemplo 4 - NavApp
//
//  Created by Erick Rodrigo Minero Pineda on 03/09/22.
//

import UIKit

class DetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var tableView: UITableView!
    private let movieManager = MovieDataManager()
    
    var recivedGenre : Genre!
    
    var movies = [Movie]()

    override func viewDidLoad() {
        super.viewDidLoad()
        movieManager.fetch(genre: recivedGenre.genre)
//        movieManager.fetch(genre: "Romance")
        movies = movieManager.giveMeMovies()
        
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.textLabel?.text = movies[indexPath.row].title
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "viewMoreSegue", sender: self )
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? MoreViewController?{
            destination?.movie = movies[tableView.indexPathForSelectedRow!.row]
        }
    }
    

    @IBAction func viewMoreButton(_ sender: Any) {
        self.performSegue(withIdentifier: "viewMoreSegue",
                          sender: Self.self)
    }
}
