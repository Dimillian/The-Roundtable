import Foundation
import ApolloCodegenLib
import ArgumentParser

struct SwiftScript: ParsableCommand {
  
  static let parentFolderOfScriptFile = FileFinder.findParentFolder()
  
  static let rootFolderURL = parentFolderOfScriptFile
      .apollo.parentFolderURL()
      .apollo.parentFolderURL()
      .apollo.parentFolderURL()
  
  static let outputURL = rootFolderURL
    .apollo.childFolderURL(folderName:"Models")
    .apollo.childFolderURL(folderName:"Sources")
    .apollo.childFolderURL(folderName:"ApolloModels")
  
  static let schemaURL = rootFolderURL
    .apollo.childFolderURL(folderName: "Models")
    .apollo.childFolderURL(folderName: "Schema")
  
  static let schemaPath = try! schemaURL.apollo.childFileURL(fileName: "schema.graphqls")
  
  static var configuration = CommandConfiguration(
    abstract: """
        A swift-based utility for performing Apollo-related tasks.
        
        NOTE: If running from a compiled binary, prefix subcommands with `swift-script`. Otherwise use `swift run ApolloCodegen [subcommand]`.
        """,
    subcommands: [DownloadSchema.self, GenerateCode.self, DownloadSchemaAndGenerateCode.self])
  
  /// The sub-command to download a schema from a provided endpoint.
  struct DownloadSchema: ParsableCommand {
    static var configuration = CommandConfiguration(
      commandName: "downloadSchema",
      abstract: "Downloads the schema with the settings you've set up in the `DownloadSchema` command in `main.swift`.")
    
    func run() throws {
      let endpoint = URL(string: "https://eldenring.fanapis.com/api/graphql")!
            
      let schemaDownloadOptions = ApolloSchemaDownloadConfiguration(using: .introspection(endpointURL: endpoint),
                                                                    outputFolderURL: schemaURL)
      
      try ApolloSchemaDownloader.fetch(with: schemaDownloadOptions)
    }
  }
  
  /// The sub-command to actually generate code.
  struct GenerateCode: ParsableCommand {
    static var configuration = CommandConfiguration(
      commandName: "generate",
      abstract: "Generates swift code from your schema + your operations based on information set up in the `GenerateCode` command.")
    
    func run() throws {
      let cliFolderURL = rootFolderURL
        .apollo.childFolderURL(folderName: "Models")
      
      let codegenOptions = ApolloCodegenOptions(mergeInFieldsFromFragmentSpreads: false,
                                                namespace: "GQL",
                                                outputFormat: .multipleFiles(inFolderAtURL: outputURL),
                                                customScalarFormat: .passthrough,
                                                urlToSchemaFile: schemaPath)
      try ApolloCodegen.run(from: rootFolderURL,
                            with: cliFolderURL,
                            options: codegenOptions)
    }
  }
  
  /// A sub-command which lets you download the schema then generate swift code.
  ///
  /// NOTE: This will both take significantly longer than code generation alone and fail when you're offline, so this is not recommended for use in a Run Phase Build script that runs with every build of your project.
  struct DownloadSchemaAndGenerateCode: ParsableCommand {
    static var configuration = CommandConfiguration(
      commandName: "all",
      abstract: "Downloads the schema and generates swift code. NOTE: Not recommended for use as part of a Run Phase Build Script.")
    
    func run() throws {
      try DownloadSchema().run()
      try GenerateCode().run()
    }
  }
}

// This will set up the command and parse the arguments when this executable is run.
SwiftScript.main()
