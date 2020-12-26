//
//  Constants.swift
//  twitter-clone
//
//  Created by Ted Hyeong on 26/12/2020.
//

import Firebase

let STORAGE_REF = Storage.storage().reference()
let STORAGE_PROFILE_IMAGES = STORAGE_REF.child("profile_images")

let DB_REF = Database.database().reference()
let REF_USERS = DB_REF.child("users")
