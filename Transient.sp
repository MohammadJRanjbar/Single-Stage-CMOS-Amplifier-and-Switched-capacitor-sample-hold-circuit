*****  Session_1 *****

.lib './TSMC_90nm.l' TT

*************************



*name drain     gate        source  bulk        model      w           L         M



M1	    1	      Vin-	       3	  dd	      pch		w=1.02u	    l=100n		m=29		
M2	    4	      Vin+	       3	  dd	      pch		w=1.02u	    l=100n		m=29	

M3	    Vout	   Vin-	       3	   dd	      pch		w=1.02u	    l=100n      m=29		
M4	    2	       Vin+	       3	   dd	      pch		w=1.02u	    l=100n      m=29	

M5      1          1           ss       ss        nch       w=1.05u     l=100n      m=4     *m=5    *for gain
M6      4          4           ss       ss        nch       w=1.05u     l=100n      m=4     *m=5

M7      1          4           ss       ss        nch       w=1.481u    l=100n      m=3    *m=10
M8      4          1           ss       ss        nch       w=1.481u    l=100n      m=3    *m=10

M9      2          1           ss       ss        nch       w=1.02u	    l=100n		m=120      *m=29  *for phase margin
M10     Vout       4           ss       ss        nch       w=1.02u	    l=100n		m=120      *m=29  *for phase margin

M11     2          2           dd     dd          pch       w=0.888u    l=100n      m=40
M12     Vout       2           dd     dd          pch       w=0.888u    l=100n      m=40

M13     3          Vb          dd     dd          pch       w=0.52u     l=100n      m=100      *m=100
M14     Vb         Vb          dd     dd          pch       w=1.18u     l=100n      m=10

Ib      Vb         dd           dc=200u

VDD     dd          0           dc=1
VSS		ss		    0	        dc=0
***************************************************************************
*	transient simulation


CH		im0		Vin-	1p

* Ideal switches in Hspice
g1		input	  im0     vcr  pwl(1)  ph1   0    0.0v,10meg  1,10
g2		im0	      vout    vcr  pwl(1)  ph2   0    0.0v,10meg  1,10
g3		Vin-	  vout    vcr  pwl(1)  ph1   0    0.0v,10meg  1,10

* Clock phases
vph1      ph1      0     pulse(0     1    0     0.2n  0.2n   4.1n    10n)
vph2      ph2      0     pulse(0     1    5n    0.2n  0.2n   4.1n    10n)

vpulse1     input      0      pulse(0.3   1    0   0.2n  0.2n   5n    10n)
*vpulse2    input      0      pulse(0.3    0.2   0   0.1n  0.2n   5n    10n)
vindc       Vin+       0      dc=0.3

.option accurate=1
.tran 0.002n 50n    
.probe
.end