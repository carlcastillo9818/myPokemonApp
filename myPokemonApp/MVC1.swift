//
//  MVC1.swift
//  myPokemonApp
//
//  Created by Carlos Castillo on 1/27/21.
//

import UIKit

class MVC1: UIViewController {
    
    // declare all fields below
    @IBOutlet weak var pokeImg1: UIImageView!
    @IBOutlet weak var typeLabel1: UILabel!
    @IBOutlet var TapImg1: UITapGestureRecognizer!
    @IBOutlet weak var typeLabel2: UILabel!
    @IBOutlet weak var pokeImg2: UIImageView!
    @IBOutlet var TapImg2: UITapGestureRecognizer!
    @IBOutlet weak var backgroundImg: UIImageView!
    var PokemonTypes : [String] = []
    var myClickedType : String = String()
    
    override func viewDidLoad() // this method loads all data
    {
        super.viewDidLoad()
        
        backgroundImg.image = UIImage(named : "mainBG.png")
        
        setPokeTypes()
        // Do any additional setup after loading the view.
    }
    
    // this method checks to see which tap gesture inside the image was tapped and assigns the clicked cats data to match it
    func assignClickedPokemonData()
    {
        if(TapImg1.state == .ended)
        {
            self.myClickedType = self.typeLabel1.text!
        }
        else
            if(TapImg2.state == .ended)
            {
                    self.myClickedType = self.typeLabel2.text!
            }
    }
    
    func setPokeTypes() // this method sets the types and images for each pokemon group
    {
        // FILL WITH MORE TYPES LATER
        PokemonTypes = ["Water Types", "Fire Types"]
        
        
        self.typeLabel1.text = PokemonTypes[0]
        self.pokeImg1.image = UIImage(named: "waterbg.png")
        self.pokeImg1.contentMode = .scaleAspectFill // use .scaleaspectfill or .scaleaspectfit to your choosing
        self.typeLabel2.text = PokemonTypes[1]
        self.pokeImg2.image = UIImage(named: "firebg.png")
        self.pokeImg2.contentMode = .scaleAspectFill
        print(typeLabel1.text!)
        
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
        
        // call this function to determine which Pokemon TYPE data to pass on to the clickedType var
        assignClickedPokemonData()
        
        let vc = segue.destination as! MVC2 // this variable will help pass along data from this view controller to the next view controller
        vc.currentPokemonSet = self.myClickedType // assign all data from myClickedType to currentPokemonSet
    }
    

}
