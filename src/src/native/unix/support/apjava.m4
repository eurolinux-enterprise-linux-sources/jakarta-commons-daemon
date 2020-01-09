dnl
dnl Copyright 1999-2004 The Apache Software Foundation
dnl
dnl Licensed under the Apache License, Version 2.0 (the "License");
dnl you may not use this file except in compliance with the License.
dnl You may obtain a copy of the License at
dnl
dnl     http://www.apache.org/licenses/LICENSE-2.0
dnl
dnl Unless required by applicable law or agreed to in writing, software
dnl distributed under the License is distributed on an "AS IS" BASIS,
dnl WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
dnl See the License for the specific language governing permissions and
dnl limitations under the License.
dnl

dnl -------------------------------------------------------------------------
dnl Author  Pier Fumagalli <mailto:pier.fumagalli@eng.sun.com>
dnl Version $Id: apjava.m4 140756 2004-02-27 08:40:46Z jfclere $
dnl -------------------------------------------------------------------------

AC_DEFUN([AP_PROG_JAVAC_WORKS],[
  AC_CACHE_CHECK([wether the Java compiler ($JAVAC) works],ap_cv_prog_javac_works,[
    echo "public class Test {}" > Test.java
    $JAVAC $JAVACFLAGS Test.java > /dev/null 2>&1
    if test $? -eq 0
    then
      rm -f Test.java Test.class
      ap_cv_prog_javac_works=yes
    else
      rm -f Test.java Test.class
      AC_MSG_RESULT(no)
      AC_MSG_ERROR([installation or configuration problem: javac cannot compile])
    fi
  ])
])

dnl AC_PATH_PROG does not work (it checks first PATH then our parameter).
dnl so we do 2 checks.
AC_DEFUN([AP_PROG_JAVAC],[
  AC_PATH_PROG(JAVAC,javac,NONE,$JAVA_HOME/bin)
  if test "$JAVAC" = "NONE"
  then
    AC_PATH_PROG(JAVAC_PATH,javac,NONE,$PATH)
    JAVAC=$JAVAC_PATH
  fi
  if test "$JAVAC" = "NONE"
  then
    AC_MSG_ERROR([javac not found])
  fi
  AP_PROG_JAVAC_WORKS()
  AC_PROVIDE([$0])
  AC_SUBST(JAVAC)
  AC_SUBST(JAVACFLAGS)
])

AC_DEFUN([AP_PROG_JAR],[
  AC_PATH_PROG(JAR,jar,NONE,$JAVA_HOME/bin)
  if test "$JAR" = "NONE"
  then
    AC_PATH_PROG(JAR_PATH,jar,NONE,$PATH)
    JAR=$JAR_PATH
  fi
  if test "$JAR" = "NONE"
  then
    AC_MSG_ERROR([jar not found])
  fi
  AC_PROVIDE([$0])
  AC_SUBST(JAR)
])

AC_DEFUN([AP_JAVA],[
  AC_ARG_WITH(java,[  --with-java=DIR         Specify the location of your JDK installation],[
    AC_MSG_CHECKING([JAVA_HOME])
    if test -d "$withval"
    then
      JAVA_HOME="$withval"
      AC_MSG_RESULT([$JAVA_HOME])
    else
      AC_MSG_RESULT([failed])
      AC_MSG_ERROR([$withval is not a directory])
    fi
    AC_SUBST(JAVA_HOME)
  ])
  if test x"$JAVA_HOME" = x
  then
    AC_MSG_ERROR([Java Home not defined. Rerun with --with-java=[...] parameter])
  fi
])
