({
  baseUrl: "${project.build.directory}/${project.artifactId}-${project.version}/joo",
  optimize: "none",
  closure: {
    CompilerOptions: {
    },
    CompilationLevel: 'SIMPLE_OPTIMIZATIONS',
    loggingLevel: 'WARNING'
  },
  preserveLicenseComments: false,
  out: "${project.build.directory}/${project.artifactId}-${project.version}/joo/application.js",
  name: "classes/com/acme/extas/portal/Main",
  include: ["classes/com/acme/extas/localized/Main"],
  localeChain: ['en_GB', 'en']
})