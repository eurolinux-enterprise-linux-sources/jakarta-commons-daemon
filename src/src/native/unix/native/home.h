/*
   Copyright 2001-2004 The Apache Software Foundation.
 
   Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at
 
       http://www.apache.org/licenses/LICENSE-2.0
 
   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.
*/
/* @version $Id: home.h 155409 2005-02-26 12:57:06Z dirkv $ */
#ifndef __JSVC_HOME_H__
#define __JSVC_HOME_H__

typedef struct home_jvm home_jvm;
typedef struct home_data home_data;

struct home_jvm {
    char *name;
    char *libr;
};

struct home_data {
    char *path;
    char *cfgf;
    home_jvm **jvms;
    int jnum;
};

/**
 * Attempt to locate a Java Home directory and build its structure.
 *
 * @param path The java home path specified on the command line.
 * @return A home_data structure containing all informations related to
 *         the Java environment, or NULL if no home was found.
 */
home_data *home(char *path);

#endif /* ifndef __JSVC_HOME_H__ */
