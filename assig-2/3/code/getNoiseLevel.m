function sigma = getNoiseLevel(imageNoisy)
ep_1 = imageNoisy(1:128, 1:40);
ep_2 = imageNoisy(169:255, 1:28);
ep_3 = imageNoisy(186:239, 214:255);
ep_4 = imageNoisy(1:30, 226:255);

v_1 = reshape(ep_1, 1, []);
v_2 = reshape(ep_2, 1, []);
v_3 = reshape(ep_3, 1, []);
v_4 = reshape(ep_4, 1, []);

v = [v_1 v_2 v_3 v_4];
sigma = std(v);
end