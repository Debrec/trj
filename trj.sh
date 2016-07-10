#!/bin/sh

PROGRAM=trj

COPILER=$1

SRCPATH=f90trj

rm $SRCPATH/*.o
rm $SRCPATH/*.mod

if [ "$COPILER" = "pgf" ]  ; then
    cat $SRCPATH/Makefile.template $SRCPATH/Makefile.pgf >$SRCPATH/Makefile
elif [ "$COPILER" = "pgfdb" ]  ; then
    cat $SRCPATH/Makefile.template $SRCPATH/Makefile.pgf_db >$SRCPATH/Makefile
elif [ "$COPILER" = "ifort" ]  ; then
    cat $SRCPATH/Makefile.template $SRCPATH/Makefile.ifort >$SRCPATH/Makefile
elif [ "$COPILER" = "ifortdb" ]  ; then
    cat $SRCPATH/Makefile.template $SRCPATH/Makefile.ifort_db >$SRCPATH/Makefile
elif [ "$COPILER" = "ifc" ]  ; then
    cat $SRCPATH/Makefile.template $SRCPATH/Makefile.ifc >$SRCPATH/Makefile
elif [ "$COPILER" = "ifc" ]  ; then
    cat $SRCPATH/Makefile.template $SRCPATH/Makefile.ifc_db >$SRCPATH/Makefile
elif [ "$COPILER" = "gfortran" ] ; then
    cat $SRCPATH/Makefile.template $SRCPATH/Makefile.gfortran >$SRCPATH/Makefile
else
    echo 'Usando copilador por defecto: gfortran'
    cat $SRCPATH/Makefile.template $SRCPATH/Makefile.gfortran >$SRCPATH/Makefile
fi

make -C f90trj

mv $SRCPATH/$PROGRAM .
