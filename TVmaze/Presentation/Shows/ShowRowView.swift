//
//  ShowRowView.swift
//  TVmaze
//
//  Created by José Briones Romero on 23/8/22.
//

import SwiftUI

struct ShowRowView: View {
    
    var show = Show()
    
    var body: some View {
        HStack(alignment: .center, spacing: 16) {
            if let image = show.image, let mediumImage = image.medium {
                AsyncImageView(stringImage: mediumImage)
                    .frame(width: 100)
            }
            VStack(alignment: .center, spacing: 8) {
                Text(show.name)
                    .font(.body)
                if show.isFavorite ?? false {
                    Image(systemName: Constants.starFillImage)
                        .foregroundColor(.yellow)
                }
            }
        }.frame(height: 150)
    }
}

struct ShowRowView_Previews: PreviewProvider {
    static var previews: some View {
        ShowRowView(show: Show())
    }
}
