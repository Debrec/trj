!----------------------------------------------------------------------
!----------------------------------------------------------------------
! Febrero , 2015
! Modulos de integración
! Interface for odeint
! Autor : Hernán H. G. Braile
! Email : hbraile@gmail.com
!----------------------------------------------------------------------
!----------------------------------------------------------------------
!//////////////////////////////////////////////////////////////////////
!----------------------------------------------------------------------
! Interface para odeint
!     x   I
!     y   I
!     xf  O
!     yf  O
!     t1  I
!     t2  I
!     eps = tolerancia
!     h1 = primera aproximacion al paso
!     hmin = paso minimo
!----------------------------------------------------------------------
SUBROUTINE ode(x,y,xf,yf,t1,t2,derivs)
  !--------------------------------------------------------------------
  !     Argumentos
  IMPLICIT none
  REAL, INTENT(IN) :: y,x,t1,t2
  REAL, INTENT(OUT) :: yf,xf

  !--------------------------------------------------------------------
  !     Variables locales
  REAL yini(2),h1,hmin,eps
  INTEGER nok,nbad,i,nm

  !--------------------------------------------------------------------
  !     Procedimientos externos
  EXTERNAL derivs,rkqs
  !--------------------------------------------------------------------
  eps=1.0e-03
  !h1=0.1*ABS(t2-t1)
  !hmin=0.01e-03
  yini(1)=x
  yini(2)=y

	CALL adaptive(yini,2,t1,t2,eps,1000,derivs)

  xf=yini(1)
  yf=yini(2)

  RETURN
  !--------------------------------------------------------------------
END SUBROUTINE ode
!----------------------------------------------------------------------

!//////////////////////////////////////////////////////////////////////

!//////////////////////////////////////////////////////////////////////
!----------------------------------------------------------------------
! Interface para odeint
!     x   I
!     y   I
!     xf  O
!     yf  O
!     t1  I
!     t2  I
!     eps = tolerancia
!     h1 = primera aproximacion al paso
!     hmin = paso minimo
!----------------------------------------------------------------------

SUBROUTINE ode_3d(x,y,z,xf,yf,zf,t1,t2,derivs)
  !--------------------------------------------------------------------
  !     Argumentos
  IMPLICIT none
  REAL, INTENT(IN) :: y,x,z,t1,t2
  REAL, INTENT(OUT) :: yf,xf,zf

  !--------------------------------------------------------------------
  !     Variables locales
  REAL yini(3),h1,hmin,eps
  INTEGER nok,nbad,i

  !--------------------------------------------------------------------
  !     Procedimientos externos
  EXTERNAL derivs,rkqs
  !--------------------------------------------------------------------
  eps=1.0e-03 !07
  !h1=0.1*ABS(t2-t1)
  !hmin=0.01e-03 !3
  yini(1)=x
  yini(2)=y
  yini(3)=z

	CALL adaptive(yini,3,t1,t2,eps,500,derivs)

  xf=yini(1)
  yf=yini(2)
  zf=yini(3)

  RETURN
  !--------------------------------------------------------------------
END SUBROUTINE ode_3d
!----------------------------------------------------------------------
