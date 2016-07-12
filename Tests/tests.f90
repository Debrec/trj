MODULE tests
CONTAINS
	LOGICAL FUNCTION assertArraySimilar(var1,var2,mensaje)
		REAL, INTENT(IN) :: var1(:),var2(:)
		CHARACTER(*), INTENT(IN) , OPTIONAL :: mensaje

		INTEGER :: I

		IF ( size(var1).EQ.size(var2)) THEN
			DO I = 1,size(var1)
				IF (ABS(var1(I)-var2(I)).LT.(0.5)) THEN
					assertArraySimilar=.TRUE.
				ELSE
					WRITE(*,*) mensaje
					assertArraySimilar=.FALSE.
					EXIT
				END IF
			END DO
		ELSE
			WRITE(*,*) mensaje
			assertArraySimilar=.FALSE.
		ENDIF
	END FUNCTION

	LOGICAL FUNCTION assertSimilar(var1,var2,mensaje)
		REAL, INTENT(IN) :: var1,var2
		CHARACTER(*), INTENT(IN), OPTIONAL :: mensaje

		IF (ABS(var1-var2).LT.(0.5)) THEN
			assertSimilar=.TRUE.
		ELSE
			WRITE(*,*) mensaje
			assertSimilar=.FALSE.
		END IF
	END FUNCTION

	SUBROUTINE checkTests(var)
		LOGICAL, INTENT(IN) :: var
		IF (var) THEN
			WRITE(*,*) 'ok'
		ELSE
			WRITE(*,*) 'Error'
		END IF
	END SUBROUTINE checkTests

	SUBROUTINE mrun(test)
		CHARACTER(*), INTENT(IN) :: test
		WRITE(*,*) 'Corriendo test : ', test
	END SUBROUTINE mrun

END MODULE tests
