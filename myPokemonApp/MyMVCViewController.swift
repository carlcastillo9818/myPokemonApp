//
//  MyMVCViewController.swift
//  myPokemonApp
//
//  Created by Carlos Castillo on 1/19/21.
//

import UIKit

class MyMVCViewController: UIViewController {

    // declare members here
    @IBOutlet weak var myTopLabel: UILabel!
    @IBOutlet weak var PokemonBox1: UIImageView!
    @IBOutlet weak var myWaterTypeLabel: UILabel!
    
    var PokemonTypings = [String]() // an array containing the pokemon types to be shown in the app
    

    // make methods below
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setInitialVals()
        // Do any additional setup after loading the view.
    }
    
    // set values for the labels, buttons, images, etc.
    func setInitialVals()
    {
        self.myTopLabel.text = "My Favorite Pokemons by Type"
        self.PokemonBox1.image = UIImage(named: "watertypepoke.png")
        self.PokemonBox1.contentMode = .scaleToFill
        loadTypeArray()
    }
    
    // load the array that contains pokemon typings (fire,water ,grass) and the labels that go with the types
    func loadTypeArray()
    {
        var x : Int = 0
        
        self.PokemonTypings = ["Water Types"]
        while(x < self.PokemonTypings.count)
        {
            self.myWaterTypeLabel.text = self.PokemonTypings[x]
            x += 1
        }
        
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
