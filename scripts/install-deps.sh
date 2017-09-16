#!/bin/sh
#-------------------------------------------------------------------------------
# Copyright (C) 2017 Create-Net / FBK.
# All rights reserved. This program and the accompanying materials
# are made available under the terms of the Eclipse Public License v1.0
# which accompanies this distribution, and is available at
# http://www.eclipse.org/legal/epl-v10.html
#
# Contributors:
#     Create-Net / FBK - initial API and implementation
#-------------------------------------------------------------------------------

set -e

WD=`pwd`
CURRDIR=${1:-$WD}
BUILD=$CURRDIR/build

mkdir -p $BUILD

cd $BUILD

LIBNAME="dbus-java-mvn"

if [ ! -e "./$LIBNAME" ]
then
    git clone https://github.com/muka/dbus-java-mvn.git $LIBNAME
fi

cd $LIBNAME
git pull origin master

mvn clean install

# $BUILD/dbus-java-mvn/target/dbus-java-3.0.jar

cd $BUILD

if [ ! -e "./agile-api-spec" ]
then
  git clone https://github.com/Agile-IoT/agile-api-spec.git agile-api-spec
fi

cd agile-api-spec
git pull origin master

cd agile-dbus-java-interface

mvn clean install
