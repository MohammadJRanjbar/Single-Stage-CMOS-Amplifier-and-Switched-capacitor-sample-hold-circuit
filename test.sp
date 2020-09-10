*****  Session_1 *****

.lib './TSMC_90nm.l' TT

*************************



*name drain     gate        source  bulk        model      w           L         M



M1	    1	      Vin-	       3	  dd	      pch		w=29.629u	    l=0.2u		m=2		
M2	    4	      Vin+	       3	  dd	      pch		w=29.629u	    l=0.2u		m=2		

M3	    Vout	   Vin-	       3	   dd	      pch		w=29.629u	    l=0.2u		m=2			
M4	    2	       Vin+	       3	   dd	      pch		w=29.629u	    l=0.2u		m=2		

M5      1          1           ss       ss        nch       w=1.32375u     l=0.2u      m=8     *m=5    *for gain
M6      4          4           ss       ss        nch       w=1.32375u     l=0.2u      m=8     *m=5

M7      1          4           ss       ss        nch       w=1.481u       l=0.2u      m=6    *m=10
M8      4          1           ss       ss        nch       w=1.481u       l=0.2u      m=6    *m=10

M9      2          1           ss       ss        nch       w=5.926u	   l=0.2u		m=30      *m=29  *for phase margin
M10     Vout       4           ss       ss        nch       w=5.926u	   l=0.2u		m=30      *m=29  *for phase margin

M11     2          2           dd     dd          pch       w=17.77u       l=1.2u      m=60
M12     Vout       2           dd     dd          pch       w=17.77u       l=1.2u      m=60

M13     3          Vb          dd     dd          pch       w=11.851u     l=0.1u      m=10      *m=100
M14     Vb         Vb          dd     dd          pch       w=5.2959u     l=0.1u      m=1

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


