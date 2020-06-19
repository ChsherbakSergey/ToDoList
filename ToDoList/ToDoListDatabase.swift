//
//  ToDoListDatabase.swift
//  ToDoList
//
//  Created by Sergey on 6/16/20.
//  Copyright © 2020 Chsherbak Sergey. All rights reserved.
//

import Foundation
import RealmSwift

class ToDoListDatabase: Object {
    @objc dynamic var title = ""
    @objc dynamic var done = false
}
