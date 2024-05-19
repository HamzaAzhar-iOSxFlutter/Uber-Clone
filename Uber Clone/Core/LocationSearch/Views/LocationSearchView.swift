//
//  LocationSearchView.swift
//  Uber Clone
//
//  Created by Hamza Azhar on 2024-05-17.
//

import SwiftUI

struct LocationSearchView: View {
    //MARK: - Properties
    @State private var startLocationText: String = ""
    @EnvironmentObject private var locationSearchViewModel: LocationSearchViewModel
    @Binding var showLocationSearchView: Bool
    
    //MARK: - Body
    var body: some View {
        VStack {
            //header view
            HStack {
                VStack {
                    Circle()
                        .fill(Color(.systemGray3))
                        .frame(width: 6, height: 6)
                    Rectangle()
                        .fill(Color(.systemGray3))
                        .frame(width: 1, height: 24)
                    
                    Rectangle()
                        .fill(.black)
                        .frame(width: 6, height: 6)
                }
                
                VStack {
                    TextField("Current Location", text: $startLocationText)
                        .frame(height: 32)
                        .background(Color(
                            .systemGroupedBackground))
                        .padding(.trailing)
                    TextField("Where to?", text: $locationSearchViewModel.queryFragment)
                        .frame(height: 32)
                        .background(Color(
                            .systemGray4))
                        .padding(.trailing)
                }
            }
            .padding(.horizontal)
            .padding(.top, 64)
            
            Divider()
                .padding(.vertical)
            
            //list view
            
            ScrollView() {
                VStack(alignment: .leading) {
                    ForEach(self.locationSearchViewModel.results, id: \.self) { result in
                        LocationSearchResultCell(title: result.title, subTitle: result.subtitle)
                            .onTapGesture {
                                self.locationSearchViewModel.selectLocation(result)
                                self.showLocationSearchView.toggle()
                            }
                    }
                }
            }
        }
        .background(.white)
    }
}


#Preview {
    LocationSearchView(showLocationSearchView: .constant(false))
}
