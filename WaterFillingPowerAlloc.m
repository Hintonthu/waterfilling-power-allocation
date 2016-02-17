%% Water filling analogy in power allocation for Gaussian power channel
% EE 515 Win 2016 HW 2
clear all; close all; clc;

%% Do the waterfilling
[total_power, noise_vec] = waterfilling_init();
power_alloc_vec = waterfilling(total_power, noise_vec);

%% Visualize the output
power_alloc_bar = bar([noise_vec; power_alloc_vec]', 'stacked');
set(power_alloc_bar(1), 'FaceColor', 'black'); set(power_alloc_bar(2), 'FaceColor', 'cyan');
title('Water filling analogy for Gaussian channel power allocation with joint power constraint');
channel_idx = 1:numel(noise_vec);
set(gca, 'XTick', channel_idx);
xlabel('Channel index'); ylabel('Power level'); 

for i1=channel_idx
    if(power_alloc_vec(i1)~=0)
        text(channel_idx(i1),noise_vec(i1) + .5*power_alloc_vec(i1) - 0.25,num2str(power_alloc_vec(i1),'%0.1f'),...
               'HorizontalAlignment','center',...
               'VerticalAlignment','bottom');
    end
end
