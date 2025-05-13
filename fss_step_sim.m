function [alpha_sim, beta_sim, Q1, Q2, Q3, Q4] = fss_step_sim(alpha, beta)

sensorSize = 10;      
apertureSize = 5;     
d = 5;                
S_quadrant = 25;      
alpha_max = 26.5;
beta_max = 26.5;

ax1Q1 = 0;  ax2Q1 = 5;  ay1Q1 = 0;  ay2Q1 = 5;
ax1Q2 = 0;  ax2Q2 = 5;  ay1Q2 = -5; ay2Q2 = 0;
ax1Q3 = -5; ax2Q3 = 0;  ay1Q3 = -5; ay2Q3 = 0;
ax1Q4 = -5; ax2Q4 = 0;  ay1Q4 = 0;  ay2Q4 = 5;

alpha_rad = deg2rad(alpha);
beta_rad  = deg2rad(beta);

dx = d * tan(beta_rad);   
dy = d * tan(alpha_rad);  

spot_x = dx;
spot_y = dy;

x1 = spot_x - apertureSize/2;
x2 = spot_x + apertureSize/2;
y1 = spot_y - apertureSize/2;
y2 = spot_y + apertureSize/2;

S1 = fss_overlap_func(x1, x2, y1, y2, ax1Q1, ax2Q1, ay1Q1, ay2Q1);
S2 = fss_overlap_func(x1, x2, y1, y2, ax1Q2, ax2Q2, ay1Q2, ay2Q2);
S3 = fss_overlap_func(x1, x2, y1, y2, ax1Q3, ax2Q3, ay1Q3, ay2Q3);
S4 = fss_overlap_func(x1, x2, y1, y2, ax1Q4, ax2Q4, ay1Q4, ay2Q4);

noise = 0.01;
Q1 = S1 / S_quadrant * (1 + noise * randn());
Q2 = S2 / S_quadrant * (1 + noise * randn());
Q3 = S3 / S_quadrant * (1 + noise * randn());
Q4 = S4 / S_quadrant * (1 + noise * randn());

sumQ = Q1 + Q2 + Q3 + Q4;

S_alpha = (Q1 + Q2 - Q3 - Q4) / sumQ;
S_beta  = (Q1 + Q4 - Q2 - Q3) / sumQ;

alpha_sim = rad2deg(atan(S_alpha * tan(deg2rad(alpha_max))));
beta_sim  = rad2deg(atan(S_beta  * tan(deg2rad(beta_max))));

end
