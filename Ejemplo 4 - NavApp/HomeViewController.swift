//
//  HomeViewController.swift
//  Ejemplo 4 - NavApp
//
//  Created by Erick Rodrigo Minero Pineda on 03/09/22.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    private let manager = GenreDataManager()
    let genres : [Genre] = [
        Genre(genre: "Adventure"),
        Genre(genre: "Comedy"),
        Genre(genre: "Fantasy"),
        Genre(genre: "Crime"),
        Genre(genre: "Drama"),
        Genre(genre: "Romance"),
        Genre(genre: "Sci-Fi"),
        Genre(genre: "Thriller"),
        Genre(genre: "Horror"),
        Genre(genre: "Western"),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        manager.fetch()
//        genres = manager.giveMeGenres()
        
        print(genres)
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return genres.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.textLabel?.text = genres[indexPath.row].genre
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "detailSegue", sender: self )
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DetailViewController?{
            destination?.recivedGenre = genres[tableView.indexPathForSelectedRow!.row]
        }
    }
    
    @IBAction func viewDetail(_ sender: UIButton) {
        self.performSegue(withIdentifier: "detailSegue",
                          sender: Self.self)
    }
    
}

//El alumno una aplicación que permita la navegación a través de distintas pantallas
//
//En nuestro Home Controller agregar un elemento de tipo “Collection view” en la parte inferior del card view agregando la información de los géneros cinematográficos
//Al dar click en el genero ejecutar el seguie que muestre las películas correspondientes al genero seleccionado  en un elemento de tipo “Table view”.
//Al seccionar una película se deben de mostrar la información completa de la película correspondiente.
//Tomar en cuente que la presentación de la información debe ser acorde a la layout de nuestra aplicación
//Mejorar el layout de la sección de “Favoritos” posters
//Verificar como luce la aplicación en modo oscuro y hacer los ajuste que consideres necesarios
