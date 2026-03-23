//
//  Contact.swift
//  Agenda
//
//  Created by Jose Ramos on 23/3/26.
//

import Foundation

struct Contact: Identifiable {
    let id = UUID()
    var name: String
    var phone: String
    var address: String
}
