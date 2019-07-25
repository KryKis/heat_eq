display("test")
function new = ss (b)
  n = length(b);
  new = b;
  new(2:n-1) = b(2:n-1) + 0.5*(b(1:n-2)-2*b(2:n-1)+b(3:n)) ;
endfunction

a = sin(0:0.1:13)+1.0;
for i = 1:1009
    a = ss(a);
    sleep(0.1)
    plot(a)
    ylim([0 5])
    xlim([0 130])
endfor
