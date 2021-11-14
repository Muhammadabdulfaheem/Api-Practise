//
//  Extensions.swift
//  JsonPalceholderDemo1
//
//  Created by MAC on 01/07/2021.
//

import Foundation
import UIKit

//Osama Extension
extension UIImageView {
    func loadImage(_ url:String?) {
        if let imageURL = url,
           let urlImage = URL(string: imageURL){
            do {
                let data = try Data(contentsOf: urlImage, options: .mappedIfSafe)
                DispatchQueue.main.async {
                    self.image = UIImage(data: data)
                }
            }catch{
                print("Error: ",error.localizedDescription)
            }
        }else{
            print("Image not found!!")
        }
    }
}
