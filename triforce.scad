use <bevel_extrude.scad>

base2height = sqrt(3)/2;

module equilateral_triangle(base)
{
	h = base * base2height;

	polygon(points=[[-base/2,-h/3], [0,2*h/3], [base/2,-h/3]], paths=[[0,1,2]]);
}

module triforce_triangle(length)
{
	height = length * base2height;
	height_flat = 18 * (length/100);
	height_bevel = 5.5 * (length/100);

	bevel_extrude(height=height_flat+height_bevel,bevel_depth=height_bevel)
		equilateral_triangle(length);
}

module triforce(len, innerlen)
{
	difference()
	{
		triforce_triangle(len);
		triforce_triangle(innerlen);
	}
}


len = 50;
innerlen = 30;
h = len * base2height;


triforce(len, innerlen);


/*
translate([-len/2,-h/3,0])
	triforce(len, innerlen);

translate([len/2,-h/3,0])
	triforce(len, innerlen);

translate([0,2*h/3,0])
	triforce(len, innerlen);

*/