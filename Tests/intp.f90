!LON debe ir de 0. a 360.
SUBROUTINE interp2D(LON,LAT,OVAR,LONDAT,LATDAT,VAR,NLON,NLAT)
	IMPLICIT none
	INTEGER, INTENT(IN) :: NLON,NLAT
	REAL, INTENT(IN) :: LON, LAT
	REAL, INTENT(IN) :: LONDAT(NLON), LATDAT(NLAT), VAR(NLON,NLAT)
	REAL, INTENT(OUT) :: OVAR
	INTEGER :: JLON,JLAT
	REAL xl1,xl2,yl1,yl2

	!WRITE(*,*) LON
	CALL locateindex(LON,LONDAT,NLON,JLON)
	!WRITE(*,*) LAT
	CALL locateindex(LAT,LATDAT,NLAT,JLAT)
	!WRITE(*,*) 'Salio'
	xl1 = (LON-LONDAT(JLON)) / (LONDAT(JLON+1)-LONDAT(JLON))
	xl2 = (LON-LONDAT(JLON+1)) / (LONDAT(JLON)-LONDAT(JLON+1))
	yl1 = (LAT-LATDAT(JLAT)) / (LATDAT(JLAT+1)-LATDAT(JLAT))
	yl2 = (LAT-LATDAT(JLAT+1)) / (LATDAT(JLAT)-LATDAT(JLAT+1))

	OVAR = VAR(JLON,JLAT) * xl1 * yl1 + VAR(JLON+1,JLAT) * xl2 * yl1 + &
		VAR(JLON,JLAT+1) * xl1 * yl2 + VAR(JLON+1,JLAT+1) * xl2 * yl2
END SUBROUTINE interp2D

SUBROUTINE locateindex(X,XDAT,NDAT,INDEX)
	INTEGER, INTENT(IN) :: NDAT
	REAL, INTENT(IN) :: X,XDAT(NDAT)
	INTEGER, INTENT(OUT) :: INDEX
	DO I=1,NDAT-1
		IF(XDAT(I).GT.XDAT(I+1)) THEN
			WRITE(*,*) 'ERROR : PERFIL INCORRECTO EN locateindex'
		END IF
		!WRITE(*,*) XDAT(I), X, XDAT(I+1)
		IF((X.GE.XDAT(I)).AND.(X.LT.XDAT(I+1))) THEN
			INDEX = I
			RETURN
		END IF
	END DO
	WRITE(*,*) 'ERROR : NO SE ENCONTRO VALOR EN locateindex'
END SUBROUTINE locateindex