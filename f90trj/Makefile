
PROGRAM=trj

SOURCE=interpol.f90 trj_mod.f90 ptotheta.f90 trj_netcdf.f90 date_conv.f90 trj_winds.f90 derivs.f90 derivstr.f90 ode.f90 odeint.f90 stereograph.f90 trj_main_mod.f90
F95=gfortran

FFLAGS=-fdefault-real-8 -fbounds-check
LIBS=-L/lib -L/usr/lib -L../Lib -lnetcdff
INCLUDES = -I/usr/include

all : $(SOURCE)
	$(F95) $(FFLAGS) $(INCLUDES) $(SOURCE) -o $(PROGRAM) $(LIBS)
