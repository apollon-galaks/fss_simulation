
%creating a model

% Sensor and pinhole params
sensorSize = 10;      % mm
apertureSize = 5;     % mm
d = 5;                % height og pinhole, mm

% Quadrant area

S_quadrant = 25;

%quadrant borders

% Q1 (right-up)
ax1Q1 = 0;
ax2Q1 = 5;
ay1Q1 = 0;
ay2Q1 = 5;

% Q2 (right-down)
ax1Q2 = 0;
ax2Q2 = 5;
ay1Q2 = -5;
ay2Q2 = 0;

% Q3 (left-down)
ax1Q3 = -5;
ax2Q3 = 0;
ay1Q3 = -5;
ay2Q3 = 0;

% Q4 (left-up)
ax1Q4 = -5;
ax2Q4 = 0;
ay1Q4 = 0;
ay2Q4 = 5;

alpha_max = 26.5;
beta_max = 26.5;

% random svec 
alpha = (rand()*2*alpha_max - alpha_max);   % [-30, +30]
beta  = (rand()*2*beta_max - beta_max);

% for fixed angles
% alpha = -26.5;
% beta = -26.5;

% deg2rad
alpha_rad = deg2rad(alpha);
beta_rad = deg2rad(beta);

% pinhole spotlight drift
dx = d * tan(beta_rad);
dy = d * tan(alpha_rad);

% sensor centre
cx = 0;
cy = 0;

% spotlight centre
spot_x = cx + dx;
spot_y = cy + dy;

% borders of spotlight
x1 = spot_x - apertureSize/2;
x2 = spot_x + apertureSize/2;
y1 = spot_y - apertureSize/2;
y2 = spot_y + apertureSize/2;


figure; hold on;
axis equal;
xlim([-sensorSize sensorSize]);
ylim([-sensorSize sensorSize]);
title(sprintf('Sun Vector \\alpha=%.4f°, \\beta=%.4f°', alpha, beta));

% Q1
rectangle('Position', [ax1Q1, ay1Q1, ax2Q1 - ax1Q1, ay2Q1 - ay1Q1], 'EdgeColor', 'k');
text((ax1Q1 + ax2Q1)/2, (ay1Q1 + ay2Q1)/2, 'Q1');

% Q2
rectangle('Position', [ax1Q2, ay1Q2, ax2Q2 - ax1Q2, ay2Q2 - ay1Q2], 'EdgeColor', 'k');
text((ax1Q2 + ax2Q2)/2, (ay1Q2 + ay2Q2)/2, 'Q2');

% Q3
rectangle('Position', [ax1Q3, ay1Q3, ax2Q3 - ax1Q3, ay2Q3 - ay1Q3], 'EdgeColor', 'k');
text((ax1Q3 + ax2Q3)/2, (ay1Q3 + ay2Q3)/2, 'Q3');

% Q4
rectangle('Position', [ax1Q4, ay1Q4, ax2Q4 - ax1Q4, ay2Q4 - ay1Q4], 'EdgeColor', 'k');
text((ax1Q4 + ax2Q4)/2, (ay1Q4 + ay2Q4)/2, 'Q4');

% pinhole
rectangle('Position', [x1, y1, apertureSize, apertureSize], ...
          'EdgeColor', 'r', 'FaceColor', [1 0 0 0.3], FaceAlpha=0.1);

grid on;
