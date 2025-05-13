%main simulation
clc;
clear;

fss_model;


S1_spotted = fss_overlap_func(x1, x2, y1, y2, ax1Q1, ax2Q1, ay1Q1, ay2Q1);
S2_spotted = fss_overlap_func(x1, x2, y1, y2, ax1Q2, ax2Q2, ay1Q2, ay2Q2);
S3_spotted = fss_overlap_func(x1, x2, y1, y2, ax1Q3, ax2Q3, ay1Q3, ay2Q3);
S4_spotted = fss_overlap_func(x1, x2, y1, y2, ax1Q4, ax2Q4, ay1Q4, ay2Q4);


Q1 = S1_spotted/S_quadrant + 0.0*randn();
Q2 = S2_spotted/S_quadrant + 0.0*randn();
Q3 = S3_spotted/S_quadrant + 0.0*randn();
Q4 = S4_spotted/S_quadrant + 0.0*randn();

sumOfQ = Q1+Q2+Q3+Q4; 

S_alpha = (Q1+Q4-Q2-Q3)/(sumOfQ);

S_beta = (Q1+Q2-Q3-Q4)/(sumOfQ);

alpha_sim = atan(S_alpha * tan(deg2rad(alpha_max)));
beta_sim  = atan(S_beta  * tan(deg2rad(beta_max)));

alpha_sim = rad2deg(alpha_sim);
beta_sim = rad2deg(beta_sim);

disp("alpha: ")
disp(alpha_sim);

disp("beta: ")
disp(beta_sim);

% disp(x1);
% disp(x2);
% disp(y1);
% disp(y2);
% disp(S1_spotted);
% disp(S2_spotted);
% disp(S3_spotted);
% disp(S4_spotted);


