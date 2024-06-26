//
//  LocationSearchResultCell.swift
//  Uber Clone
//
//  Created by Hamza Azhar on 2024-05-17.
//

import SwiftUI

struct LocationSearchResultCell: View {
    
    //MARK: - Properties
    var title: String
    var subTitle: String
    
    var body: some View {
        HStack {
            Image(systemName: "mappin.circle.fill")
                .resizable()
                .foregroundColor(.blue)
                .accentColor(.white)
                .frame(width: 40, height: 40)
            VStack(alignment: .leading, spacing: 5) {
                Text(self.title)
                    .font(.body)
                
                Text(self.subTitle)
                    .font(.system(size: 15))
                    .foregroundColor(.gray)
                
                Divider()
            }
            .padding(.leading, 8)
            .padding(.vertical, 8)
        }
        .padding(.leading)
    }
}

#Preview {
    LocationSearchResultCell(title: "Starbucks", subTitle: "Tim Hortons")
        .previewLayout(.sizeThatFits)
}
