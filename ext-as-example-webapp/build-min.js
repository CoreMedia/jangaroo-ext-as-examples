({
  baseUrl: "${project.build.directory}/${project.artifactId}-${project.version}/amd",
  optimize: "closure",
  mainConfigFile: "${project.build.directory}/${project.artifactId}-${project.version}/amd/ext-as.module.js",
  closure: {
    CompilerOptions: {
    },
    CompilationLevel: 'SIMPLE_OPTIMIZATIONS',
    loggingLevel: 'WARNING'
  },
  linkNative: false,
  preserveLicenseComments: false,
  out: "${project.build.directory}/${project.artifactId}-${project.version}/amd/application-min.js",
  name: "as3/com/acme/extas/portal/Main",
  include: ["as3/com/acme/extas/localized/Main"],
  localeChain: ['en_GB', 'en']
})