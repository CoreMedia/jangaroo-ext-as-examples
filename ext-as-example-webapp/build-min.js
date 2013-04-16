({
  baseUrl: "${project.build.directory}/${project.artifactId}-${project.version}/amd",
  optimize: "closure",
  mainConfigFile: "${project.build.directory}/${project.artifactId}-${project.version}/amd/ext-js-4.module.js",
  closure: {
    CompilerOptions: {
    },
    CompilationLevel: 'SIMPLE_OPTIMIZATIONS',
    loggingLevel: 'WARNING'
  },
  linkNative: false,
  preserveLicenseComments: false,
  out: "${project.build.directory}/${project.artifactId}-${project.version}/amd/application-min.js",
  //name: "as3/com/acme/extas/portal/config/main"
  include: ["as3/com/acme/extas/portal/PortalExample.js"]
  //localeChain: ['en_GB', 'en']
})