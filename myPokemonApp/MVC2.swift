//
//  MVC2.swift
//  myPokemonApp
//
//  Created by Carlos Castillo on 1/20/21.
//

import UIKit


class MVC2: UIViewController {

    var currentPokemonSet: String = String() // array holding the pokemon received from the first view controller
    var myClickedPokemon : Pokemon = Pokemon() // like a baseball mitt, it captures data from the previous view controller and passes it along to the outlet vars in this view controller
    
    /* tap gesture vars that are connected to each pokemon image
     they allow for the user to click on the pokemon image
     and they are taken to the third view controller highlighting
     that pokemons information in depth */
    @IBOutlet var TAPPOKE1: UITapGestureRecognizer!
    @IBOutlet var TAPPOKE2: UITapGestureRecognizer!
    @IBOutlet var TAPPOKE3: UITapGestureRecognizer!
    @IBOutlet weak var pokemon1: UILabel! // pokemon vars hold pokemon names
    @IBOutlet weak var pokemon2: UILabel!
    @IBOutlet weak var pokemon3: UILabel!
    @IBOutlet weak var img1: UIImageView! // img vars hold pokemon images
    @IBOutlet weak var img2: UIImageView!
    @IBOutlet weak var img3: UIImageView!
    @IBOutlet weak var backgroundPokeTypeIMG: UIImageView! // holds different image depending on which type was picked!
    
    var waterPokemon : [Pokemon] = [] // array that holds Pokemon objects
    var firePokemon : [Pokemon] = []

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setCurrentPokemons()
        // Do any additional setup after loading the view.
    }
    
    // this method creates pokemon water types and pass them into water array
    func loadWaterPokemon()
    {
        let blastoise = Pokemon(n : "Blastoise", ty : "Water", id : "009", img : UIImage(named: "blastoise.png")!, gif: "blastoisemoving", desc: "It has spouts extending from its shell at the top. They spray water like cannons, hard enough to pierce concrete walls.")
        let lapras = Pokemon(n : "Lapras", ty : "Water", id : "131", img : UIImage(named: "lapras.jpg")!, gif : "laprasmoving", desc: "Its high intelligence enables it to understand human speech. It likes to ferry people on its back.")
        let totodile = Pokemon(n : "Totodile", ty : "Water", id : "158", img : UIImage(named: "totodile.png")!, gif : "totodilemoving", desc : "Its well-developed jaws are powerful and capable of crushing anything. Even its trainer must be careful.")
        
        self.waterPokemon = [blastoise, lapras, totodile]
        
    }

    // this method creates pokemon fire types and pass them into fire array
    func loadFirePokemon()
    {
        let charizard = Pokemon(n : "Charizard", ty : "Fire", id : "006", img : UIImage(named: "charizard.png")!, gif : "charizardmoving", desc: "Its wings can carry this Pokémon close to an altitude of 4,600 feet. It blows out fire at very high temperatures.")
        let blaziken = Pokemon(n : "Blaziken", ty : "Fire", id : "257", img : UIImage(named: "blaziken.jpg")!, gif : "blazikenmoving", desc: "Blaziken has incredibly strong legs - it can easily clear a 30-story building in one leap. This Pokémon's blazing punches leave its foes scorched and blackened.")
        let entei = Pokemon(n : "Entei", ty : "Fire", id : "244", img : UIImage(named: "entei.png")!, gif : "enteimoving", desc: "A Pokémon that races across the land. It is said that one is born every time a new volcano appears.")

        self.firePokemon = [charizard, blaziken, entei]
    }
    
    /* this method loads the pokemon in this view controller with the correct pokemon data from the first controller*/
    func setCurrentPokemons()
    {
        loadWaterPokemon()
        loadFirePokemon()
        
        if(currentPokemonSet == "Water Types") // user picked water types
        {
            // set background to a water element image
            self.backgroundPokeTypeIMG.image = UIImage(named : "waterbg2.jpg")
            // set info of all pokemon present on this view
            self.pokemon1.text = self.waterPokemon[0].name
            self.img1.image = self.waterPokemon[0].image
            self.img1.contentMode = .scaleAspectFit // adjust image aspect 
            self.pokemon2.text = self.waterPokemon[1].name
            self.img2.image = self.waterPokemon[1].image
            self.img2.contentMode = .scaleAspectFit
            self.pokemon3.text = self.waterPokemon[2].name
            self.img3.image = self.waterPokemon[2].image
            self.img3.contentMode = .scaleAspectFit

        }
        else
            if(currentPokemonSet == "Fire Types") // user picked fire types
            {
                // set background to a fire element image
                self.backgroundPokeTypeIMG.image = UIImage(named : "firebg2.jpg")
                // set info of all pokemon present on this view
                self.pokemon1.text = self.firePokemon[0].name
                self.img1.image = self.firePokemon[0].image
                self.pokemon2.text = self.firePokemon[1].name
                self.img2.image = self.firePokemon[1].image
                self.pokemon3.text = self.firePokemon[2].name
                self.img3.image = self.firePokemon[2].image
            }
    }


    // this method checks to see which tap gesture inside the image was tapped and assigns the clicked pokemons data to match it
    func assignSinglePokemonData()
    {
        if(TAPPOKE1.state == .ended) // user finished tapping the first image
        {
            self.myClickedPokemon.name = self.pokemon1.text!//unwrap the optional var with exclamation point

            if(currentPokemonSet == "Water Types") // the current set is Water Type so assign all water pokemon data to the clickedpokemon var
            {
                self.myClickedPokemon.ID = self.waterPokemon[0].ID
                self.myClickedPokemon.gif = self.waterPokemon[0].gif
                self.myClickedPokemon.description = self.waterPokemon[0].description
            }
            else// pokemon set is a different typing (not water) so set data from the next array (fire, grass, etc)
            {
                self.myClickedPokemon.ID = self.firePokemon[0].ID
                self.myClickedPokemon.gif = self.firePokemon[0].gif
                self.myClickedPokemon.description = self.firePokemon[0].description

            }
                
        }
        else if(TAPPOKE2.state == .ended) // user finished tapping the second image
            {
                self.myClickedPokemon.name = self.pokemon2.text!
                
                if(currentPokemonSet == "Water Types") // the current set is Water Type so assign all water pokemon data to the clickedpokemon var
                {
                    self.myClickedPokemon.ID = self.waterPokemon[1].ID
                    self.myClickedPokemon.gif = self.waterPokemon[1].gif
                    self.myClickedPokemon.description = self.waterPokemon[1].description

                }
                else // pokemon set is a different typing (not water) so set data from the next array (fire, grass, etc)
                {
                    self.myClickedPokemon.ID = self.firePokemon[1].ID
                    self.myClickedPokemon.gif = self.firePokemon[1].gif
                    self.myClickedPokemon.description = self.firePokemon[1].description

                }
            }
            else if(TAPPOKE3.state == .ended) // user finished tapping the third image
                {
                    self.myClickedPokemon.name = self.pokemon3.text!
                    
                    if(currentPokemonSet == "Water Types") // the current set is Water Type so assign all water pokemon data to the clickedpokemon var
                    {
                        self.myClickedPokemon.ID = self.waterPokemon[2].ID
                        self.myClickedPokemon.gif = self.waterPokemon[2].gif
                        self.myClickedPokemon.description = self.waterPokemon[2].description

                    }
                    else // pokemon set is a different typing (not water) so set data from the next array (fire, grass, etc)
                    {
                        
                        self.myClickedPokemon.ID = self.firePokemon[2].ID
                        self.myClickedPokemon.gif = self.firePokemon[2].gif
                        self.myClickedPokemon.description = self.firePokemon[2].description

                    }
                }
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        let myBackItem = UIBarButtonItem() // create an object for the back button on the top bar
        myBackItem.title = "Go Back" // change the text of the back button!
        navigationItem.backBarButtonItem = myBackItem // set change here

        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.\
        
        assignSinglePokemonData()// call this function to determine which single Pokemons data to pass on to the myChosenPokemon var

        let vc = segue.destination as! MVC3// this variable will help pass along data from this view controller to the next view controller
        vc.myChosenPokemon = self.myClickedPokemon // assign all data from myClickedPokemon to myChosenPokemon
        
    }



}
