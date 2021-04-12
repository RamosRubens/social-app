//
//  ImagemUsuarioViewModel.swift
//  Social
//
//  Created by Rubens Ferreira Ramos on 12/04/21.
//

import Foundation
import Combine

class ImagemUsuarioViewModel: ObservableObject {
    var user: User
    
    init(user: User) {
        self.user = user
    }
    
    private let kBaseURL = "https://jsonplaceholder.typicode.com/"
    
    @Published
    private(set) var loading: Bool = false
    
    @Published
    private(set) var images = [ImagemUsuario]() {
        didSet {
            loading = false
        }
    }
    
    private var userImagesCancellationToken: AnyCancellable?
    
    func fetchUserImages() {
        userImagesCancellationToken?.cancel()
        
        guard let url = URL(string: "photos/\(kBaseURL)\(user.id)/photos") else { return }
        loading = true
        let session = URLSession.shared
        
        let request = URLRequest(url: url)
        
        userImagesCancellationToken = session.dataTaskPublisher(for: request)
            .tryMap(session.map(_:))
            .decode(type: [ImagemUsuario].self, decoder: JSONDecoder())
            .breakpointOnError()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: sinkError(_:)) {
                self.images = $0.take(50)
            }
    }
}

extension Array {
    func take(_ elementsCount: Int) -> [Element] {
        let min = Swift.min(elementsCount, count)
        return Array(self[0..<min])
    }
}
