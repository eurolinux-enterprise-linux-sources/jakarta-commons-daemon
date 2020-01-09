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
/* @version $Id: jsvc.h 155409 2005-02-26 12:57:06Z dirkv $ */
#ifndef __JSVC_H__
#define __JSVC_H__

#include <stdio.h>
#include <stdlib.h>
#include <stdarg.h>
#include <string.h>
#include <sys/types.h>
#include <sys/stat.h>

/* Definitions for booleans */
typedef enum {
    false,
    true
} bool;

#include "debug.h"
#include "arguments.h"
#include "home.h"
#include "location.h"
#include "replace.h"
#include "dso.h"
#include "java.h"
#include "help.h"

int main(int argc, char *argv[]);
void main_reload(void);
void main_shutdown(void);

#endif /* ifndef __JSVC_H__ */
