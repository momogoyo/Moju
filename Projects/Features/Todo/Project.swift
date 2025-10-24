import ProjectDescription

let project = Project(
  name: "Todo",
  targets: [
    .target(
      name: "Todo",
      destinations: .iOS,
      product: .framework,
      bundleId: "dev.tuist.Todo",
      infoPlist: .default,
      sources: ["Sources/**"],
      dependencies: [
        .project(target: "Utils", path: "../../Shared/Utils")
      ]
    ),
    .target(
      name: "TodoTests",
      destinations: .iOS,
      product: .unitTests,
      bundleId: "dev.tuist.TodoTests",
      infoPlist: .default,
      sources: ["Tests/**"],
      dependencies: [.target(name: "Todo")]
    )
  ]
)
