//
//  MyPokemonClass.swift
//  myPokemonApp
//
//  Created by Carlos Castillo on 1/19/21.
//

import Foundation
import UIKit

class Pokemon // pokemon class to be used in the main project
{
    var name : String
    var type : String
    var ID : String
    var image : UIImage
    var gif : String
    var description : String
    
    init() { // initializer with default vals
        self.name = ""
        self.type = ""
        self.ID = ""
        self.gif = ""
        self.image = UIImage()
        self.description = ""
    }
    
    
    init(n : String, ty : String, id : String, img : UIImage, gif : String, desc: String = "") {
        self.name = n
        self.type = ty
        self.ID = id
        self.image = img
        self.gif = gif
        self.description = desc
    } // initializer with required args for the params
}
