//
//  MatchesViewModel.swift
//  CSGOTV
//
//  Created by Willian Junior Peres de Pinho on 25/02/23.
//

import Foundation

class MatchesViewModel {
    let webservice: WebService
    var matches: [Match] = []
    let matchesItemSelected = DelegateView<Match>()
    var dataFound: (() -> ())?

    init(webservice: WebService) {
        self.webservice = webservice
    }
    
    func fetchMatches() {
        webservice.getMatches { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let matches):
                    self?.matches = matches
                    self?.dataFound?()
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }

}
