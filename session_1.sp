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
VINac	Vin+	K		ac=1
VINdc1	K	ss		dc=0.3
VINdc2	Vin-	ss		dc=0.3
.ac		dec		500		10		50g
.option  acout=0
.probe   vdb(Vout, ss)
.probe   vp(Vout, ss)	
.measure   ac  gain           find  vdb(Vout, ss) at=15
.measure   ac  unity_gain     when  vdb(Vout, ss)=0
.measure   ac  phase_margin   find  vp(ss, Vout) when vdb(Vout, ss)=0
.op
.probe
.end
