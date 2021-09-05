//
//  UserCoreData+CoreDataProperties.swift
//  UsersApp-SwiftUI
//
//  Created by Jorge Luis Rivera Ladino on 4/09/21.
//
//

import Foundation
import CoreData


extension UserCoreData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserCoreData> {
        return NSFetchRequest<UserCoreData>(entityName: "UserCoreData")
    }

    @NSManaged public var id: Int16
    @NSManaged public var name: String?
    @NSManaged public var phone: String?
    @NSManaged public var email: String?
    
    func toDomain() -> UserList.User.Domain {
        .init(id: Int(id),
              name: name ?? "",
              phone: phone ?? "",
              email: email ?? ""
        )
    }

}

extension UserCoreData : Identifiable {

}
