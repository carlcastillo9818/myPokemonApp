//
//  TVC1TableViewController.swift
//  myPokemonApp
//
//  Created by Carlos Castillo on 1/21/21.
//

import UIKit

class TVC1TableViewController: UITableViewController {

    // declare vars here
    var PokemonTypings : [String] = [] // an array containing the pokemon types to be shown in the app
    var SectionPositionsArrayCounter : Int = 0 // counter for the array of positions
    var SectionPositionsArray : [Int] = [] // array of section positions
    var clickedPokemonSet : String = String()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.clickedPokemonSet = "bUB"
        setInitialVals()
        
        print(self.clickedPokemonSet + "...  VALUE!")
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // set values for the labels, buttons, images, arrays, etc.
    func setInitialVals()
    {
        PokemonTypings  = ["Water Types", "Fire Types"]
        var x = 0 // temp counter var
        while(x < self.PokemonTypings.count) // loop runs and each section position is added to the sectionpos array
        {
            SectionPositionsArray.append(x)
            x += 1
        }
    }
    

    
    // MARK: - Table view data source

    // this function gets the number of sections
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return PokemonTypings.count
        
    }

    // this function gets the number of rows in each section
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        var myRowCount = 1 // local var to hold row count
        return myRowCount
    }

    // this function loops through a series of rows in cells
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCustomCell", for: indexPath)
        // always make sure to click on the cell in the table view and under attributes, assign an identifier name then use that name in the cell declaration above! (mycustomCell)
        
        // Configure the cell...
        if(indexPath.section == 0) // first section
        {
            //cell.textLabel?.text = "Water Pokemon!"// change the big text
            //cell.detailTextLabel?.text = "water pokemon live in water" // change the little text
            // cell.imageView?.image = UIImage(named: "blastoise.png") // displays an image to the left inside the cell
            cell.backgroundView = UIImageView.init(image: UIImage.init(named: "waterbg.jpg")) // BACKGROUND IMAGE
        }
        else
            if(indexPath.section == 1) // second section
            {
                    //cell.textLabel?.text = "click for fire pokemon!"// change the big text
                    //cell.detailTextLabel?.text = "fire pokemon live in volcanoes" // change the little text
                    //cell.imageView?.image = UIImage(named: "charizard.png")
                    cell.backgroundView = UIImageView.init(image: UIImage.init(named: "firebg.jpg")) // BACKGROUND IMAGE
            }
        
        
        return cell
    }
    
    // this function returns the title of the current section
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return PokemonTypings[section]
    }
    
    // assign the data of the selectedrow to the clickedPokemonSet var
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        if(indexPath.section == 0)
        {
            print("INSIDE THE TABLEVIEWFUNC SECTION 0")
            print(indexPath.section)
            self.clickedPokemonSet = PokemonTypings[0]
            print(self.clickedPokemonSet)
        }
        else
            if(indexPath.section == 1)
            {
                print("INSIDE THE TABLEVIEWFUNC SECTION 1")
                print(indexPath.section)
                self.clickedPokemonSet = PokemonTypings[1]
                print(self.clickedPokemonSet)
            }
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation


    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        let myBackItem = UIBarButtonItem() // create an object for the back button on the top bar
        myBackItem.title = "Go Back" // change the text of the back button!
        navigationItem.backBarButtonItem = myBackItem // set change here


        if(self.clickedPokemonSet == "Water Types")
        {
            print("WATER!!!!")
        }
        else
            if(self.clickedPokemonSet == "Fire Types")
            {
                print("FIRE!!!")
            }
            else
            {
                print("EMPTY!!!")
                
            }
        
        let vc = segue.destination as! MVC2
        vc.currentPokemonSet = clickedPokemonSet
    }
    
    


}
