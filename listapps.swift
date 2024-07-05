// swiftc -O listapps.swift -o listapps-swift

import Cocoa

class AppDelegate: NSObject, NSApplicationDelegate {
  var query: NSMetadataQuery!

  func applicationDidFinishLaunching(_ notification: Notification) {
    query = NSMetadataQuery()
    query.predicate = NSPredicate(
      format: "kMDItemContentType == 'com.apple.application-bundle'"
    )

    query.searchScopes = [
      NSMetadataQueryUserHomeScope,
      "/Applications",
      "/System",
      "/Library",
      "/Network",
      "/usr",
    ]

    NotificationCenter.default.addObserver(
      self,
      selector: #selector(queryDidFinishGathering(_:)),
      name: NSNotification.Name.NSMetadataQueryDidFinishGathering,
      object: query
    )

    query.start()
  }

  @objc func queryDidFinishGathering(_ notification: Notification) {
    query.stop()

    for item in query.results {
      if let result = item as? NSMetadataItem,
        let path = result.value(forAttribute: kMDItemPath as String) as? String
      {
        print("\(path)")
      }
    }

    NSApplication.shared.terminate(self)
  }
}

let delegate = AppDelegate()
let application = NSApplication.shared
application.delegate = delegate
application.run()
