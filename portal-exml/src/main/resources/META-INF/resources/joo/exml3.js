// ---- handle ExtConfig annotation ----
joo.getOrCreatePackage("joo.meta").ExtCfg = (function(){

  var REGISTRATION_BY_TYPE = {
    xtype: ext.ComponentMgr.registerType,
    ptype: ext.ComponentMgr.registerPlugin,
    type:  function(layoutName, targetClass) {
      ext.Container.LAYOUTS[layoutName.toLowerCase()] = targetClass;
    },
    gctype: function(gridColumnName, targetClass) {
      ext.grid.Column.types[gridColumnName] = targetClass;
    }
  };

  function findTypeAttribute(parameters) {
    for (var m in parameters) {
      if (m in REGISTRATION_BY_TYPE) {
        return m;
      }
    }
    return null;
  }

  return function joo_meta_ExtConfig(classDeclaration/*:joo.JooClassDeclaration*/,
                                     memberDeclaration/*:joo.MemberDeclaration*/,
                                     parameters/*:Object*/) {
    var targetClassName = parameters['target'];
    if (targetClassName) { // if target class is not empty...
      classDeclaration.getDependencies().push(targetClassName); // ...add target class dependency
      classDeclaration.getDependencies().push("net.jangaroo.ext.Exml");
    }
    var typeAttribute = findTypeAttribute(parameters);
    if (typeAttribute) { // if any type attribute is set...
      classDeclaration.addStateListener(joo.JooClassDeclaration.STATE_EVENT_AFTER_INIT_MEMBERS, function() {
        // config class is now initialized:
        var typeName = parameters[typeAttribute] || classDeclaration.fullClassName;
        var extTypeAttribute = typeAttribute == 'gctype' ? 'xtype' : typeAttribute; // exceptional case: gridcolumns (gctype) also use 'xtype' as their type key!
        // add [x|p|]type attribute to prototype and as a static field of the config class:
        classDeclaration.constructor_.prototype[extTypeAttribute] =
                classDeclaration.constructor_[typeAttribute] = typeName;

        var superConfigClass = classDeclaration;
        while (!targetClassName) {
          superConfigClass = superConfigClass.superClassDeclaration;
          if (!superConfigClass) {
            throw new Error("No [ExtConfig(target=...)] found in " + classDeclaration.fullClassName + " or any of its super classes.");
          }
          if (superConfigClass.metadata.ExtConfig) {
            targetClassName = superConfigClass.metadata.ExtConfig.target;
          }
        }
        var targetClass = joo.classLoader.getRequiredClassDeclaration(targetClassName);
        // does the config class use the standard naming pattern?
        // Components using custom types (like Ext JS standard components) have to take care of registering themselves!
        if (!parameters[typeAttribute]) {
          joo.classLoader.init("net.jangaroo.ext.Exml");
          var adhocSubclass = function(config) {
            if (config['constructor'] === Object) {
              var defaultConfig = new (classDeclaration.publicConstructor)();
              config = net.jangaroo.ext.Exml.apply(defaultConfig, config);
            }
            if (targetClass.state < joo.NativeClassDeclaration.STATE_INITIALIZED) {
              return targetClass.publicConstructor.call(this, config);
            }
            targetClass.constructor_.call(this, config);
          };
          adhocSubclass.prototype = targetClass.publicConstructor.prototype;
          REGISTRATION_BY_TYPE[typeAttribute](typeName, adhocSubclass);
        }
      });
    }
  };
})();

