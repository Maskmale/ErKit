//
//  ERLog.swift
//  ErKit
//
//  Created by Erbash on 11/29/2021.
//  Copyright (c) 2021 Erbash. All rights reserved.
//

import Foundation

public enum ERLogEmoji: String {
    // https://gitmoji.dev/
    // https://github.com/liuchengxu/git-commit-emoji-cn
    
    /// Improve structure / format of the code
    case art = "🎨"
    
    /// Improve performance
    case zap = "⚡️"
    
    /// Remove code or files
    case fire = "🔥"
    
    /// Fix a bug
    case bug = "🐛"
    
    /// Critical hotfix
    case ambulance = "🚑️"
    
    /// Introduce new features
    case sparkles = "✨"
    
    /// Add or update documentation
    case memo = "📝"
    
    /// Deploy stuff
    case rocket = "🚀"
    
    /// Add or update the UI and style files
    case lipstick = "💄"
    
    /// Begin a project
    case tada = "🎉"
    
    /// Add, update, or pass tests
    case whiteCheckMark = "✅"
    
    /// Fix security issues
    case lock = "🔒️"
    
    /// Release / Version tags
    case bookmark = "🔖"
    
    /// Fix compiler / linter warnings
    case rotatingLight = "🚨"
    
    /// Work in progress
    case construction = "🚧"
    
    /// Fix CI Build
    case greenHeart = "💚"
    
    /// Downgrade dependencies
    case arrowDown = "⬇️"
    
    /// Upgrade dependencies
    case arrowUp = "⬆️"
    
    /// Pin dependencies to specific versions
    case pushpin = "📌"
    
    /// Add or update CI build system
    case constructionWorker = "👷"
    
    /// Add or update analytics or track code
    case chartWithUpwardsTrend = "📈"
    
    /// Refactor code
    case recycle = "♻️"
    
    /// Add a dependency
    case heavyPlusSign = "➕"
    
    /// Remove a dependency
    case heavyMinusSign = "➖"
    
    /// Add or update configuration files
    case wrench = "🔧"
    
    /// Add or update development scripts
    case hammer = "🔨"
    
    /// Internationalization and localization
    case globeWithMeridians = "🌐"
    
    /// Fix typos
    case pencil = "✏️"
    
    /// Write bad code that needs to be improved
    case poop = "💩"
    
    /// Revert changes
    // case rewind = "⏪️"
    
    /// Merge branches
    case twistedRightwardsArrows = "🔀"
    
    /// Add or update compiled files or packages
    case package = "📦️"
    
    /// Update code due to external API changes
    case alien = "👽️"
    
    /// Move or rename resources (e.g.: files, paths, routes)
    case truck = "🚚"
    
    /// Add or update license
    case pageFacingUp = "📄"
    
    /// Introduce breaking changes
    case boom = "💥"
    
    /// Add or update assets
    case bento = "🍱"
    
    /// Improve accessibility
    case wheelchair = "♿️"
    
    /// Add or update comments in source code
    case bulb = "💡"
    
    /// Write code drunkenly
    case beers = "🍻"
    
    /// Add or update text and literals
    case speechBalloon = "💬"
    
    /// Perform database related changes
    case cardFileBox = "🗃️"
    
    /// Add or update logs
    case loudSound = "🔊"
    
    /// Remove logs
    case mute = "🔇"
    
    /// Add or update contributor(s)
    case bustsInSilhouette = "👥"
    
    /// Improve user experience / usability
    case childrenCrossing = "🚸"
    
    /// Make architectural changes
    case buildingConstruction = "🏗️"
    
    /// Work on responsive design
    case iphone = "📱"
    
    /// Mock things
    case clownFace = "🤡"
    
    /// Add or update an easter egg
    case egg = "🥚"
    
    /// Add or update a .gitignore file
    case seeNoEvil = "🙈"
    
    /// Add or update snapshots
    case cameraFlash = "📸"
    
    /// Perform experiments
    case alembic = "⚗️"
    
    /// Improve SEO
    case mag = "🔍️"
    
    /// Add or update types
    case label = "🏷️"
    
    /// Add or update seed files
    case seedling = "🌱"
    
    /// Add, update, or remove feature flags
    case triangularFlagOnPost = "🚩"
    
    /// Catch errors
    case goalNet = "🥅"
    
    /// Add or update animations and transitions
    case animation = "💫"
    
    /// Deprecate code that needs to be cleaned up
    case wastebasket = "🗑️"
    
    /// Work on code related to authorization, roles and permissions
    case passportControl = "🛂"
    
    /// Simple fix for a non-critical issue
    case adhesiveBandage = "🩹"
    
    /// Data exploration/inspection
    case monocleFace = "🧐"
    
    /// Remove dead code
    case coffin = "⚰️"
    
    /// Add a failing test
    case testTube = "🧪"
    
    /// Add or update business logic",
    case necktie = "👔"
    
    /// Add or update healthcheck
    case stethoscope = "🩺"
    
    /// Infrastructure related changes
    case bricks = "🧱"
    
    /// Improve developer experience",
    case technologist = "🧑‍💻"
}

fileprivate let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd HH:mm:ss.SSS "
    return formatter
}()

public func ERLog<T>(_ message:T, file:String = #file, funcName:String = #function, lineNum:Int = #line, logEmoji: ERLogEmoji = .buildingConstruction) {
    #if DEBUG
    let file = (file as NSString).lastPathComponent;
    print("\(logEmoji.rawValue) ERLog: \(dateFormatter.string(from: Date())) file: \(file) funcName: \(funcName) lineNum: \(lineNum) message: \(message)");
    #endif
}
