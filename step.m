display("test")



function new = step2d (b, n)
  D = 0.1;
  uxx = (b(1:n-2,2:n-1)-2*b(2:n-1,2:n-1)+b(3:n,2:n-1));
  uyy = (b(2:n-1,1:n-2)-2*b(2:n-1,2:n-1)+b(2:n-1,3:n));
  b(2:n-1,2:n-1) = b(2:n-1,2:n-1) + D*(uxx+uyy);
  new = b;
endfunction



function new = ss (b)
  n = length(b);
  new = b;
  new(2:n-1) = b(2:n-1) + 0.5*(b(1:n-2)-2*b(2:n-1)+b(3:n)) ;
endfunction

%a = sin(0:0.1:13)+1.0;
a = zeros(51, 51);
a(23:27,23:27) = 1;
a = sin(a);
%ylim([0 5])
%xlim([0 130])
for i = 1:1009
    a = step2d(a, 51);
    sleep(0.1)
    surf(a)
    zlim([0 1])
 %   plotmatrix(a)
endfor
