import ProjectDescription

let project = Project(
  name: "Moju",
  targets: [
    .target(
      name: "Moju",
      destinations: .iOS,
      product: .app,
      bundleId: "dev.tuist.Moju",
      infoPlist: .extendingDefault(
        with: [
          "CFBundleDisplayName": "Moju",
          "UILaunchScreen": [
            "UIColorName": "LaunchBackground",
            "UIImageName": "LaunchLogo"
          ]
        ]
      ),
      sources: ["Sources/**"],
      resources: ["Resources/**"],
      dependencies: [
        .project(target: "News", path: "../Features/News")
      ],
      settings: .settings(
        base: [
          "ASSETCATALOG_COMPILER_APPICON_NAME": "AppIcon"
        ]
      )
    ),
    .target(
      name: "MojuTests",
      destinations: .iOS,
      product: .unitTests,
      bundleId: "dev.tuist.MojuTests",
      infoPlist: .default,
      sources: ["Tests/**"],
      dependencies: [.target(name: "Moju")]
    ),
  ]
)
