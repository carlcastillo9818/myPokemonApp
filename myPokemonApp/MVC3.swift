//
//  MVC3.swift
//  myPokemonApp
//
//  Created by Carlos Castillo on 2/3/21.
//

import UIKit


/*
 
 3-19-21 next time work on CONSTRAINTS FOR EACH VIEW.
 
 
 3-19-21 Work on adjusting custom background
 for MVC1 view.  Make it fit like I did with the
 background image in mvc3 view.  Then add constraints
 to each view!  Run tests every time you make
 changes!
 
 ADD CUSTOM BACKGROUNDS TO EACH VIEW CONTROLLER.
 ADJUST CONSTRAINTS AS NEEDED. TEST OUT APP
 ON YOUR IPHONE.  THIS IS THE LAST STUFF YOU NEED TO DO
 BEFORE YOU ARE FINISHED WITH THIS PROJECT.
 KEEP THIS PROJECT AS REFERENCE ON YOUR RESUME
 OR IF  YOU DECIDE TO MAKE AN EVEN BIGGER PROJECT
LATER THAT WILL UTILIZE THE POKEMON CLASS OR
 A PART OF THIS APP.
 
 REFER TO YOUR PAPER DRAWING OF WHAT THE
     CONTROLLER VIEW WOULD LOOK LIKE
 
 3/7/2021
 */
class MVC3: UIViewController {
    
    /*
     myChosenPokemon captures the data from the 2nd view controller like a baseball mitt and passes that data to the outlet vars like
     pokemon name, pokemon picture, etc.
     */
    var myChosenPokemon : Pokemon = Pokemon()
    
    @IBOutlet weak var myPokemonName: UILabel!
    @IBOutlet weak var myPokedexNumber: UILabel!
    @IBOutlet weak var myPokemonGif: UIImageView!
    @IBOutlet weak var myPokemonDescription: UILabel!
    @IBOutlet weak var backgroundIMG: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // initialize background of this view controller and adjust the fit size
        self.backgroundIMG.image = UIImage(named: "dexBG.png")
   
        setMyPokemon()

        // Do any additional setup after loading the view.
    }
    
    
    // this function sets the current pokemons information for this view controller (get it all from myChosenPokemon!)
    func setMyPokemon()
    {
      
        self.myPokemonName.text = myChosenPokemon.name
        self.myPokedexNumber.text = "Pokedex #" + myChosenPokemon.ID
        self.myPokemonGif.loadGif(name: myChosenPokemon.gif)
        self.myPokemonDescription.text = myChosenPokemon.description
        
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
