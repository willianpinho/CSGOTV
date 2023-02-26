//
//  MatchDetailsViewModel.swift
//  CSGOTV
//
//  Created by Willian Junior Peres de Pinho on 26/02/23.
//

import Foundation

class MatchDetailsViewModel {
    let webservice: WebService
    var match: Match?
    var dataFound: (() -> ())?

    init(webservice: WebService) {
        self.webservice = webservice
    }
}
