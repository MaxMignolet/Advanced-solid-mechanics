function ret = equivalent_stress(xx, yy, zz, xy, xz, yz)

ret = sqrt(3/2 * (xx.^2 + yy.^2 + zz.^2 + xy.^2 + xz.^2 + yz.^2));

end

