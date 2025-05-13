

function area = fss_overlap_func(ax1, ax2, ay1, ay2, bx1, bx2, by1, by2)

    spot = [ax1, ay1, ax2 - ax1, ay2 - ay1];
    q1   = [bx1, by1, bx2- bx1, by2 - by1];

    area = rectint(spot, q1);

end