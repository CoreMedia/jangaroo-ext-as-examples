Jangaroo 4 Ext AS Examples
==========================

These are examples of Jangaroo 4 Ext AS.
They show how to develop Ext JS 6.2 applications using ActionScript and MXML (known from Apache Flex)
and the Jangaroo compiler and Maven tooling.

As prerequisites, you need to have installed

1. Java SDK 8
2. Maven 3.3+
3. Git client

After cloning, build the project via Maven:

    mvn install -DskipJangarooApp

The flag `skipJangarooApp` speeds up the build process by skipping steps that are only needed when
you want to deploy the application to a Web server.

Then, run a local Web server and a watch task using

    mvn -f ext-as-example-webapp jangaroo:app-watch

Now, you can open the main example application in any browser under the URL

    http://localhost:1841/ext-as-example-webapp/target/app/

For the other two stand-alone examples `hello-world-1-webapp` and `hello-world-5-localized`, the last
two steps can be performed, substituting `ext-as-example-webapp` by the desired module name.
Note that you should stop the previous watch task before starting another one.

After changing code in some module, say `hello-world-3-mxml`, it suffices to recompile that module:

    mvn -f hello-world-3-mxml compile

The watch task should pick up the changes, and soon, you can reload the application in the browser.

The more elegant way is to open the project in IntelliJ IDEA after setting up the
[Jangaroo 4 IDEA Plugin](https://github.com/CoreMedia/jangaroo-idea/wiki/Developing-Jangaroo-4-Ext-AS-6-Applications-with-IntelliJ-IDEA),
which offers great IDE support and a fast development round-trip.

To run the feed-viewer example, you need to run the example app with a proxy configuration, which is achieved using the new Jangaroo Maven goal `run`:

    mvn -f ext-as-example-webapp jangaroo:run

The `run` goal uses the configuration in `ext-as-example-parent/pom.xml`
to set up a reverse proxy to a feed service hosted by Sencha.

Then, you can open the example App under the URL

    http://localhost:8080/ext-as-example-webapp/target/app/
