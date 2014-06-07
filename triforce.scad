use <bevel_extrude.scad>

base2height = sqrt(3)/2;

length = 80;
height = length * base2height;
height_flat = 18 * (length/100);
height_bevel = 5.5 * (length/100);

module equilateral_triangle(base)
{
	h = base * base2height;

	polygon(points=[[0,0], [base/2,h], [base,0]], paths=[[0,1,2]]);
}

/*
linear_extrude(height=width, center=true, convexity=10, twist=0)
	equilateral_triangle(length);
*/

module triforce_triangle()
{
	bevel_extrude(height=height_flat+height_bevel,bevel_depth=height_bevel)
		equilateral_triangle(length);
}

/*
sep = 5;

translate([-length - sep,-height/2,0])
	triforce_triangle();
translate([sep,-height/2,0])
	triforce_triangle();
translate([-length/2,height/2 + sep],0)
	triforce_triangle();
*/

triforce_triangle();
