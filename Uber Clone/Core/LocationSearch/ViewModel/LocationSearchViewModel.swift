//
//  LocationSearchViewModel.swift
//  Uber Clone
//
//  Created by Hamza Azhar on 2024-05-18.
//

import Foundation
import MapKit

//MARK: - Code Explanation
/*
 This Swift code defines a LocationSearchViewModel class that manages location search functionality using MKLocalSearchCompleter from the MapKit framework. The class inherits from NSObject and conforms to the ObservableObject protocol, allowing it to publish changes to its properties. The @Published property results is an array of MKLocalSearchCompletion objects, which stores search results. The searchCompleter property is an instance of MKLocalSearchCompleter, responsible for completing location searches based on user input. The queryFragment property holds the user's search query and triggers a print statement whenever it changes. In the initializer, the class sets itself as the delegate for searchCompleter and assigns the queryFragment. The extension implements the MKLocalSearchCompleterDelegate protocol, updating the results array whenever the search completer updates its results. This setup enables dynamic and responsive location search functionality within the app.
 */

class LocationSearchViewModel: NSObject, ObservableObject {
    
    //MARK: - Properties
    @Published var results = [MKLocalSearchCompletion]() //This is the array which will get initialised with all the location matches, once the user stops searching.
    @Published var selectedLocationCoordinate: CLLocationCoordinate2D?
    private let searchCompleter = MKLocalSearchCompleter() //This is the object which will actually complete the search.
    var queryFragment: String = "" { //This is the user input for the location search.
        didSet {
            self.searchCompleter.queryFragment = self.queryFragment
        }
    }
    
    override init() {
        super.init()
        self.searchCompleter.delegate = self
        self.searchCompleter.queryFragment = self.queryFragment
    }
    
    //MARK: - Helper methods
    /*
     This is a setter function to set the location once user selects a location from the view.
     */
    public func selectLocation(_ localSearch: MKLocalSearchCompletion) {
        self.locationSearch(forLocalSearchCompletion: localSearch) { response, error in
            if let error = error {
                print("DEBUG: Location search failed with \(error)")
                return
            }
            
            guard let item = response?.mapItems.first else { return }
            let coordinate = item.placemark.coordinate
            self.selectedLocationCoordinate = coordinate
        }
    }
    
    public func locationSearch(forLocalSearchCompletion localSearch: MKLocalSearchCompletion, completion: @escaping MKLocalSearch.CompletionHandler) {
        let searchRequest = MKLocalSearch.Request()
        searchRequest.naturalLanguageQuery = localSearch.title.appending(localSearch.subtitle)
        let executeSearchRequest = MKLocalSearch(request: searchRequest)
        executeSearchRequest.start(completionHandler: completion)
    }
}

//MARK: - MKLocalSearchCompleterDelegate

extension LocationSearchViewModel: MKLocalSearchCompleterDelegate {
    func completerDidUpdateResults(_ completer: MKLocalSearchCompleter) {
        self.results = completer.results
    }
}
