trj: Interpolador de trayectorias de parcelas de aire

Para copilar el programa se necesita un compilador de fortran 95 preferiblemente gfortran de gcc.

Requisitos:

Conseguir y compilar netcdf 5.3 o 6 con gfortran

Modificar Makefile para incluir las librerías

Ejecutar trj.sh con la opción gfortran


Utilización:

El programa precisa se incorporen archivos de viento del centro europeo (ECMWF) en formato netcdf, U,V y un archivo con traazadores pasivos que incluya T,PV,O3. En la versión 3d debe incluirse también W.
El programa posee dos archivos de configuración según se este trabajando con la versión 2d isentropica o la versión 3d que se compilan de forma inde pendiente el formato de los archivos de configuración es el siguiente:

-->   trj.cfg
Ntime Nout               #Nro de intervalos temporales, Numero de salidas
Npartx Nparty            #Define una grilla rectangular con Npartx*Nparty particulas
mLon iLon mLat iLat      #mlon - Longitud inicial iLon -incremento en longitud mlat Latitud inicial ilat incremento en lat.
windfile tracfile        #Archivo de vientos U,V yde trazadores T,O3,PV respectivamente
isec day mon year        #Fecha inicial donde isec es el numero de segundos desde las 0 horas
theta                    #Temperatura potencial,define la superficie isentropica
its                      #Intervalo de integracion temporal en minutos
GF                       #Si es 0 se utiliza una grilla uniforme con los valores introducidos anteriormente  si es 1 se leen
                         #las posiciones iniciales desde un archivo de configuracion. Del archivo input/temp_trj.dat

-->  trj3d.cfg
