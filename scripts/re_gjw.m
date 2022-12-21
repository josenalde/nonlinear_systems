function re = re_gjw(k1, k2, k3, w)
  %re = (-1 - k1*k3) / ((k2^2+w^2)*(k3^2+w^2));
  re = -(k1*k2 + k1*k3) / ((k2^2+w^2)*(k3^2+w^2));
endfunction
