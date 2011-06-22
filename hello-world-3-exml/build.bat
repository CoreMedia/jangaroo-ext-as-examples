@echo off
mkdir webapp
cd webapp
"%JAVA_HOME%\bin\jar" -xf %JOO_HOME%\libs\jangaroo-runtime.jar
"%JAVA_HOME%\bin\jar" -xf %JOO_HOME%\libs\jangaroo-browser.jar
"%JAVA_HOME%\bin\jar" -xf %JOO_HOME%\libs\ext-js.jar
"%JAVA_HOME%\bin\jar" -xf %JOO_HOME%\libs\ext-as.jar
cd ..
type %JOO_HOME%\meta\joo\jangaroo-runtime.module.js %JOO_HOME%\meta\joo\jangaroo-browser.module.js %JOO_HOME%\meta\joo\ext-js.module.js %JOO_HOME%\meta\joo\ext-as.module.js > webapp\joo\jangaroo-application.js
xcopy /s /y src\main\resources webapp\
call %JOO_HOME%\bin\exmlc acme-exml acme tmp\xsd\acme-exml.xsd src\main\joo tmp\joo %JOO_HOME%\meta\ext3.xsd
mkdir webapp\joo\classes
call %JOO_HOME%\bin\jooc -v -g source -classpath %JOO_HOME%\libs\jangaroo-runtime.jar;%JOO_HOME%\libs\jangaroo-browser.jar;%JOO_HOME%\libs\ext-as.jar -d webapp\joo\classes -sourcepath tmp\joo tmp\joo\com\acme\extas\exml\HelloWorld.as
