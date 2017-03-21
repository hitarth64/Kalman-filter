function[K] =  kalman_filter(P0,A,Qw,Qv,C)
    // P_apost = P[n|n]
    // P_priori = P[n|n-1]
    P_apost = P0;
    
    for i =1:100
        P_priori = A * P_apost * A' + Qw;
        K(:,i) = P_priori * C' * inv(C * P_priori * C' + Qv);
        P_apost = P_priori - K(:,i)*C * P_priori;
    end
    
endfunction

K = kalman_filter(eye(3),[-0.1 -0.09 0.648; 1 0 0; 0 1 0],[1 0 0; 0 0 0; 0 0 0],0.64, [1 0 0]);

scf(0)
plot(K(1,:),'r')
plot(K(2,:),'b')
plot(K(3,:),'g')
legend('$K_n(1)$','$K_n(2)$','$K_n(3)$')
xlabel('n','fontsize',3)
ylabel('$K_n$','fontsize',3)
title('Kalman filter coefficients plot','fontsize',3)

x_vec = [0; 0; 0];
for i = 1:100
    x(i) = [-0.1 -0.09 0.648] * x_vec + rand(1,'normal');
    x_vec = [x(i); x_vec(1); x_vec(2)];
end

y = x + 0.8 * rand(100,1,'normal');

x_vec_apost = [0; 0; 0];
A = [-0.1 -0.09 0.648; 1 0 0; 0 1 0];
C = [1 0 0];
for i = 1:100
    x_hat_vec =  A * x_vec_apost + K(i) * y(i) - K(:,i)*C*A*x_vec_apost;
    x_hat(i) = x_hat_vec(1);
    x_vec_apost = x_hat_vec;
end

scf(1)
plot(x,'r');
plot(y,'b');
legend('x[n]','$\hat{x}[n]$');
xlabel('n','fontsize',3)
ylabel('Signal values','fontsize',3)
title('Original and reconstructed signal','fontsize',3)
