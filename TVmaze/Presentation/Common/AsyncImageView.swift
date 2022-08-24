//
//  AsyncImageView.swift
//  TVmaze
//
//  Created by José Briones Romero on 23/8/22.
//

import SwiftUI

struct AsyncImageView: View {
    
    let stringImage: String
    
    var body: some View {
        AsyncImage(url: URL(string: stringImage)) { image in
            image.resizable()
                .scaledToFit()
        } placeholder: {
            Image("\(Constants.placeholderImage)").resizable()
                .scaledToFit()
                .frame(width:100)
        }
    }
}

struct AsyncImageView_Previews: PreviewProvider {
    static var previews: some View {
        AsyncImageView(stringImage: "")
    }
}
