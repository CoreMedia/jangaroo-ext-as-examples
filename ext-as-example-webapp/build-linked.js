({
  baseUrl: "${project.build.directory}/${project.artifactId}-${project.version}/amd",
  optimize: "none",
  closure: {
    CompilerOptions: {
    },
    CompilationLevel: 'SIMPLE_OPTIMIZATIONS',
    loggingLevel: 'WARNING'
  },
  preserveLicenseComments: false,
  out: "${project.build.directory}/${project.artifactId}-${project.version}/amd/application.js",
  name: "as3/com/acme/extas/portal/Main",
  include: ["as3/com/acme/extas/localized/Main"],
  localeChain: ['en_GB', 'en']
})