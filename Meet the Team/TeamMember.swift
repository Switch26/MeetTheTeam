//
//  TeamMember.swift
//  Meet the Team
//
//  Created by Serguei Vinnitskii on 3/7/17.
//  Copyright © 2017 Serguei Vinnitskii. All rights reserved.
//

import Foundation

struct TeamMember {
    
    var id: String // non-optional field
    var firstName: String?
    var lastName: String?
    var title: String?
    var avatarURL: String?
    var bio: String?
    
    init(withID id: String) {
        self.id = id
    }
    
    init(teamMemberDataDictionary: [String: Any]) {
        
        let id = teamMemberDataDictionary["id"] as? String ?? "Unknown"
        self.id = id
        
        self.firstName = teamMemberDataDictionary["firstName"] as? String
        self.lastName = teamMemberDataDictionary["lastName"] as? String
        self.title = teamMemberDataDictionary["title"] as? String
        self.avatarURL = teamMemberDataDictionary["avatar"] as? String
        self.bio = teamMemberDataDictionary["bio"] as? String
        
    }
}
