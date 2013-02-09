({
  baseUrl: "${project.build.directory}/${project.artifactId}-${project.version}/joo",
  optimize: "closure",
  closure: {
    CompilerOptions: {
    },
    CompilationLevel: 'SIMPLE_OPTIMIZATIONS',
    loggingLevel: 'WARNING'
  },
  preserveLicenseComments: false,
  out: "${project.build.directory}/${project.artifactId}-${project.version}/joo/application-min.js",
  name: "classes/com/acme/extas/portal/Main"
//  ,include: ["classes/com/acme/extas/localized/Main"],
//  localeChain: ['en_GB', 'en']
})