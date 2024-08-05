@echo off
:: ----------------------------------------------------------------------------
:: Licensed to the Apache Software Foundation (ASF) under one or more
:: contributor license agreements. See the NOTICE file distributed with
:: this work for additional information regarding copyright ownership.
:: The ASF licenses this file to You under the Apache License, Version 2.0
:: (the "License"); you may not use this file except in compliance with
:: the License. You may obtain a copy of the License at
::
::     http://www.apache.org/licenses/LICENSE-2.0
::
:: Unless required by applicable law or agreed to in writing, software
:: distributed under the License is distributed on an "AS IS" BASIS,
:: WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
:: See the License for the specific language governing permissions and
:: limitations under the License.
:: ----------------------------------------------------------------------------

@REM ----------------------------------------------------------------------------
@REM Maven2 Start Up Batch script
@REM
@REM Required ENV vars:
@REM JAVA_HOME - location of a JDK home dir
@REM
@REM Optional ENV vars
@REM M2_HOME - location of maven2's installed home dir
@REM MAVEN_BATCH_ECHO - set to 'on' to enable the echoing of the batch commands
@REM MAVEN_BATCH_PAUSE - set to 'on' to wait for a key stroke before ending
@REM MAVEN_OPTS - parameters passed to the Java VM when running Maven
@REM     e.g. to debug Maven itself, use
@REM set MAVEN_OPTS=-Xdebug -Xrunjdwp:transport=dt_socket,server=y,suspend=y,address=8000
@REM MAVEN_SKIP_RC - flag to disable loading of mavenrc files
@REM ----------------------------------------------------------------------------

@REM Begin all echo output with @ to prevent displaying batch commands
@echo off

@REM enable echoing commands if MAVEN_BATCH_ECHO is set to 'on'
@if "%MAVEN_BATCH_ECHO%"=="on" echo on

@REM To isolate internal variables from possible external ones, use SETLOCAL
@setlocal

@REM ==== START VALIDATION ====
if "%JAVA_HOME%"=="" goto errorJava
if not exist "%JAVA_HOME%\bin\java.exe" goto errorJava

set "MAVEN_PROJECTBASEDIR=%~dp0"
if not defined MAVEN_PROJECTBASEDIR set MAVEN_PROJECTBASEDIR=%CD%

if not defined M2_HOME goto findM2Home
goto init

:findM2Home
if exist "%MAVEN_PROJECTBASEDIR%\mvn" set "M2_HOME=%MAVEN_PROJECTBASEDIR%"
if defined M2_HOME goto init
if not exist "%MAVEN_PROJECTBASEDIR%\..\mvn" goto errorMaven
set "M2_HOME=%MAVEN_PROJECTBASEDIR%\.."
goto init

:errorJava
echo Error: JAVA_HOME is not defined correctly.
echo   We cannot execute "%JAVA_HOME%\bin\java.exe"
goto end

:errorMaven
echo Error: MAVEN_HOME or M2_HOME is not defined correctly.
echo   We cannot execute "%MAVEN_PROJECTBASEDIR%\mvn"
goto end

:init
@REM ==== END VALIDATION ====

@REM Find the custom mavenrc files
if not "%MAVEN_SKIP_RC%"=="on" (
  if exist "%USERPROFILE%\.mavenrc" call "%USERPROFILE%\.mavenrc"
  if exist "%M2_HOME%\bin\mavenrc_pre.bat" call "%M2_HOME%\bin\mavenrc_pre.bat"
  if exist "%M2_HOME%\bin\mavenrc_post.bat" call "%M2_HOME%\bin\mavenrc_post.bat"
)

set "CLASSWORLDS_LAUNCHER=%M2_HOME%\boot\plexus-classworlds-2.6.0.jar"

@REM ==== START MAVEN EXECUTION ====
"%JAVA_HOME%\bin\java.exe" ^
  %MAVEN_OPTS% ^
  -classpath "%CLASSWORLDS_LAUNCHER%" ^
  "-Dclassworlds.conf=%M2_HOME%\bin\m2.conf" ^
  "-Dmaven.home=%M2_HOME%" ^
  "-Dmaven.multiModuleProjectDirectory=%MAVEN_PROJECTBASEDIR%" ^
  org.codehaus.plexus.classworlds.launcher.Launcher %*
@REM ==== END MAVEN EXECUTION ====

@end
