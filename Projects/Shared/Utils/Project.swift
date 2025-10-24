import ProjectDescription

let project = Project(
  name: "Utils",
  targets: [
    .target(
      name: "Utils",
      destinations: .iOS,
      product: .framework,
      bundleId: "dev.tuist.Utils",
      infoPlist: .default,
      sources: ["Sources/**"]
    )
  ]
)
