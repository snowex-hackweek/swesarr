Subroutine LogNProb(Theta,iSel,Mu,Cov,P,NiSel)

Use CommonVars
Implicit None
Integer,Intent(In) :: iSel(NiSel),NiSel
Integer :: i
Real(8),Intent(In) :: Theta(Ntheta),Mu(Nlyr),Cov(Nlyr)
Real(8),Intent(Out) :: P


P=0.0d0

!Probability of log-normal distribution. 
!Here the constant multification factor 1/sqrt(2*pi) is neglected.

Do i=1,NiSel
  P=P+(dlog(Theta(iSel(i)))-Mu(i))**2.0d0/Cov(i)
End Do
P=Exp(-0.5d0*P)


Do i=1,NiSel
    P=P/Theta(iSel(i))       !/dsqrt(Cov(i))   !Revised April16, to add Theta(iSel(i)
End Do

End Subroutine LogNProb
