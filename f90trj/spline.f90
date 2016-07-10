!----------------------------------------------------------------------
!----------------------------------------------------------------------
! Febrero , 2015
! Se utiliza librerias netlib para interpolación con splines
! Autor : Hernán H. G. Braile
! Email : hbraile@gmail.com
!----------------------------------------------------------------------
!----------------------------------------------------------------------
      SUBROUTINE spline2d(X,Y,Z,NXD,NYD,xdata,ydata,VAL,NOUT)
      IMPLICIT none
      INTEGER NXD, NYD, NOUT
      REAL X(NXD), Y(NYD), Z(NXD,NYD),xdata(NOUT), &
          ydata(NOUT), VAL(NOUT)

      REAL tempy(NXD,NOUT),temp(NOUT), tempt(NXD),zt(NYD)
      INTEGER ix, iy, iout

      DO ix=1,NXD
         DO iy=1,NYD
            zt(iy)=Z(ix,iy)
         END DO

         CALL spline(Y,zt,NYD,ydata, &
             temp,NOUT) 
         DO iout=1,NOUT
            tempy(ix,iout)=temp(iout)
         END DO
      END DO
      
      DO iout=1,NOUT
         DO ix=1,NXD
            tempt(ix)=tempy(ix,iout)
         END DO
         CALL spline(X,tempt,NXD,xdata(iout), &
             VAL(iout),1)
      END DO
      
      END SUBROUTINE spline2d
    
! Interface unidimensional splines
!---------------------------------------------------------------------
      SUBROUTINE spline(X,Y,NDATA,xdata,VAL,NOUT)
      IMPLICIT none
      INTEGER NDATA, NOUT
      REAL X(NDATA), Y(NDATA),xdata(NOUT),VAL(NOUT)   
!---------------------------------------------------------------------      
      DOUBLEPRECISION W(5*(NDATA+2)),W12(12), TVAL(NOUT)
      DOUBLEPRECISION T(NDATA+6), BCOEF(NDATA+2)
      INTEGER N, K, INBV,I
      DOUBLEPRECISION DBVALU
      DOUBLEPRECISION FBCL, FBCR
      INTEGER ix
      INBV=1
      FBCL=0.
      FBCR=0.
      CALL DBINT4(DBLE(X),DBLE(Y),NDATA,2,2,FBCL,FBCR,2,T,BCOEF,N,K,W)
      DO I=1,NOUT
         VAL(I)=REAL(DBVALU(T,BCOEF,N,K,0,DBLE(xdata(I)),INBV,W12))
      END DO

!---------------------------------------------------------------------      
      END SUBROUTINE spline
!---------------------------------------------------------------------
!

! Interface unidimensional splines first derivative
!---------------------------------------------------------------------
      SUBROUTINE spline1(X,Y,NDATA,xdata,VAL,NOUT)
      IMPLICIT none
      INTEGER NDATA, NOUT
      REAL X(NDATA), Y(NDATA),xdata(NOUT),VAL(NOUT)   
!---------------------------------------------------------------------      
      DOUBLEPRECISION W(5*(NDATA+2)),W12(12), TVAL(NOUT)
      DOUBLEPRECISION T(NDATA+6), BCOEF(NDATA+2)
      INTEGER N, K, INBV,I
      DOUBLEPRECISION DBVALU
      DOUBLEPRECISION FBCL, FBCR
      INTEGER ix
      INBV=1
      FBCL=0.
      FBCR=0.
      CALL DBINT4(DBLE(X),DBLE(Y),NDATA,2,2,FBCL,FBCR,2,T,BCOEF,N,K,W)
      DO I=1,NOUT
         VAL(I)=REAL(DBVALU(T,BCOEF,N,K,1,DBLE(xdata(I)),INBV,W12))
      END DO

!---------------------------------------------------------------------      
      END SUBROUTINE spline1
!---------------------------------------------------------------------
!
