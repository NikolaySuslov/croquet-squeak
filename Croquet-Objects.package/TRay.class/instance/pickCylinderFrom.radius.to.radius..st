picking
pickCylinderFrom: pnt1 radius: rad1 to: pnt2 radius: rad2

	| p1 p2 r1 r2 vn lv lx dx pv n nvn pd v ht cosCone cosPlane ip d1 d2 dd |

	"right cylinder"
	rad1 = rad2 ifTrue: [ ^ self pickRightCylinderFrom: pnt1 to: pnt2 radius: rad1.]
	ifFalse: [ "cone"
" Figure out where the vertex is.
	r1,r2 - top and bottom radii. r2 > r1
	p1,p2 - top and bottom center points.
	v - vertex of the cone
	ht - true height of the cone
	vn - vertex normal (up-down normal)
	n - normal plane vector
	nvn - vertex normal dot with plane normal
	ip - actual intersection point"

	rad2 < rad1 ifTrue:[
		r1 := rad2.
		r2 := rad1.
		p1 := pnt2 - self framePosition.	
		p2 := pnt1 - self framePosition.]
	ifFalse:[
		r1 := rad1.
		r2 := rad2.
		p1 := pnt1 - self framePosition.
		p2 := pnt2 - self framePosition.].

	rad1 = 0 ifTrue:[ 
		v := p1.
		ht := (p1- p2) length.
		vn := (p2 - p1) normalized.
		] 
	ifFalse:[
		vn := (p2 - p1) normalized.
		pd := (p1-p2)length.
		ht := (r2*pd)/(r2-r1).
		v := p2 - (vn * ht).
		].


" Calculate the plane that cuts the cone. This is from Graphics Gems V pg 227."
	n := self framePointer row3 cross: v.
	lv := n length.
	lv = 0 ifTrue:[^ false.] ifFalse:[ n := n/lv.].
" We hit the vertex point."
	(n dot: n)=0 ifTrue:[
		ip := v.]
	ifFalse:[
" Test the plane to see if it intersects the cone."
		cosCone := ht/(((ht*ht) + (r2*r2))sqrt).
		nvn := n dot: vn.
		cosPlane := (1- (nvn * nvn)) sqrt.
		cosCone > cosPlane ifTrue:[ ^ false. "no intersection."].

		lx := n dot: (p2-v). " distance of p2 from plane "
		dx := (lx*lx)/ht. " difference in height of closest point to p2"
		lv := (p2-v) - (n * lx). " actual location of closest point of p2 to plane "
		pv := v+ (lv * (ht/(ht-dx))). " location of this point on the plane defined by p2. "

		dx:=((r2*r2)-((pv-p2)squaredLength))sqrt. " distance from pv to r2 on circle at p2"
		pv := pv + (dx * ((n cross: vn) normalized)).

		pv:=(pv-v)normalized. "vector from v ON THE CYLINDER"

		d1 := self framePointer row3.
		d2 := pv.
		dd := d1 cross: d2.
		dx := dd dot: dd.
		dx = 0 ifTrue:[^false].
		dx := ( (v cross: d2) dot: dd )/dx.
		(self testSelectedDistance: dx abs)=0 ifFalse:[^ false].
		ip := self framePosition + (d1*dx).
		].

" Now that we (finally) have ip - the intersection of the pointer with the -infinite- cylinder, we need to test to see if it is between the top and bottom planes,"

	(((ip - self framePosition - p1) dot: vn) < 0.0 or:[((ip - self framePosition - p2) dot: vn) > 0.0]) ifTrue:[ 
		"the point is outside the bounds"
		^ false.].
	self selectedPoint: ip.
	self selectedDistance: dx abs.
	n:= (ip-self framePosition-v)normalized.
	pv := p2-v.
	self selectedNormal: (((pv dot:n)*n)-pv)normalized.
	^ true.
	].
	

	
	