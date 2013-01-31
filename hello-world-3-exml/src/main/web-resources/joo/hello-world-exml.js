require(["classes/com/acme/extas/mxml/helloWorld"], function(helloWorld) {
  var hello = new helloWorld._();
  hello.user = "Joe";
  Ext.create(hello);
});
