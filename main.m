
clc; 
clear;

alpha = -26:1:26;
beta = -26:1:26;

for i = 1:length(alpha)
    [alpha_sim(i), beta_sim(i), Q1(i), Q2(i), Q3(i), Q4(i)] = fss_step_sim(alpha(i), beta(i));
end


alpha_error = alpha_sim - alpha;
beta_error  = beta_sim  - beta;

figure;
subplot(4,1,1);
plot(beta, Q1, 'r-o', 'LineWidth', 1.2);
xlabel('\alpha input (°)');
ylabel('Q ()');
title('Q1 of alpha ');
grid on;

subplot(4,1,2);
plot(alpha, Q2, 'b-o', 'LineWidth', 1.2);
xlabel('\beta input (°)');
ylabel('Q ()');
title('Q1 of alpha ');

subplot(4,1,3);
plot(alpha, Q3, 'b-o', 'LineWidth', 1.2);
xlabel('\beta input (°)');
ylabel('Q ()');
title('Q3 of alpha');

subplot(4,1,4);
plot(alpha, Q4, 'b-o', 'LineWidth', 1.2);
xlabel('\beta input (°)');
ylabel('Q ()');
title('Q4 of alpha');
grid on;