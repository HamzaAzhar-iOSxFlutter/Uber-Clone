//
//  MapViewActionButton.swift
//  Uber Clone
//
//  Created by Hamza Azhar on 2024-05-17.
//

import SwiftUI

struct MapViewActionButton: View {
    
    @Binding var showLocationSearchView: Bool
    @Binding var currentViewDisplayed: CurrentViewDisplayed
    
    var body: some View {
        Button {
            switch self.currentViewDisplayed {
            case .mapScreen:
                withAnimation(.spring) {
                    self.showLocationSearchView = true
                }
            case .searchScreen:
                withAnimation(.spring) {
                    self.showLocationSearchView = false
                }
            }
            
        } label: {
            Image(systemName: self.showLocationSearchView ? "arrow.backward" : "line.3.horizontal")
                .font(.title2)
                .foregroundColor(.black)
                .padding()
                .background(.white)
                .clipShape(Circle())
                .shadow(color: .black, radius: 6)
            
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .onAppear {
            self.currentViewDisplayed = .searchScreen
        }
    }
}

#Preview {
    MapViewActionButton(showLocationSearchView: .constant(false), currentViewDisplayed: .constant(.searchScreen))
        .previewLayout(.sizeThatFits)
}
