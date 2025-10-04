import ProjectDescription

let project = Project(
  name: "News",
  targets: [
    .target(
      name: "News",
      destinations: .iOS,
      product: .framework,
      bundleId: "dev.tuist.News",
      infoPlist: .default,
      sources: ["Sources/**"],
      resources: ["Resources/**"],
      dependencies: []
    ),
    .target(
      name: "NewsTests",
      destinations: .iOS,
      product: .unitTests,
      bundleId: "dev.tuist.NewsTests",
      infoPlist: .default,
      sources: ["Tests/**"],
      dependencies: [.target(name: "News")]
    ),
  ]
)
