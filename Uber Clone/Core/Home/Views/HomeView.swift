//
//  HomeView.swift
//  Uber Clone
//
//  Created by Hamza Azhar on 2024-05-17.
//

import SwiftUI

enum CurrentViewDisplayed {
    case mapScreen
    case searchScreen
}

struct HomeView: View {
    
    @State private var showLocationSearchView: Bool = false
    @State private var currentViewDisplayed: CurrentViewDisplayed = .mapScreen
    
    var body: some View {
        ZStack(alignment: .top) {
            UberMapViewRepresentable()
                .ignoresSafeArea()
            
            if showLocationSearchView {
                LocationSearchView()
            } else {
                LocationSearchActivationView()
                    .padding(.top, 70)
                    .onTapGesture {
                        withAnimation(.spring) {
                            self.showLocationSearchView.toggle()
                        }
                    }
            }
            
            MapViewActionButton(showLocationSearchView: $showLocationSearchView, currentViewDisplayed: $currentViewDisplayed)
                .padding(.leading)
                .padding(.top, 4)
        }
        .onAppear {
            self.currentViewDisplayed = .mapScreen
        }
    }
}

#Preview {
    HomeView()
}
