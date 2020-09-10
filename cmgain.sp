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


*******************************************************************
**AC
VINac1	Vin+	K1		ac=1
VINac2	Vin-	K2		ac=1
VINdc1	K1	ss		dc=.3
VINdc2	K2	ss		dc=.3


.ac   dec  500  10   50g   
.option  acout=0
.probe   vdb(Vout, ss)
.probe   vp(Vout, ss)

* You can use these functions to plot the results with MATLAB
*.print  vdb(Vout, ss)
*.option ingold=2


.measure   ac  gain           find  vdb(Vout, ss) at=15
.op
.end
