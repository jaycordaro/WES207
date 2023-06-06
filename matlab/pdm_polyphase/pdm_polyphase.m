h = [-6 -16 -31 -52 -81 -114 -148 -179 -198 -197 -166 -97 20 187 408 678 988 1325 1671 2006 2307 2555 2731 2822 2822 2731 2555 2307 2006 1671 1325 988 678 408 187 20 -97 -166 -197 -198 -179 -148 -114 -81 -52 -31 -16 -6 ];

x_polar = randsrc(1, 1000);
% x_polar = ones(1, 1000);
% x_polar = repmat([1 -1], 1, 100);

x = (x_polar+1)/2;

actual = conv(h, x_polar);

reg0 = zeros(1,12);
reg1 = zeros(1,12);
reg2 = zeros(1,12);
counter = 0;
total = 0;
y = [];
for idx = 1:length(x)
    mux3 = mux(3, counter, x(idx));
    [reg0, shift_out] = shreg(reg0, mux3);
    mux2 = mux(2, counter, x(idx));
    [reg1, shift_out] = shreg(reg1, mux2 + shift_out);
    mux1 = mux(1, counter, x(idx));
    [reg2, shift_out] = shreg(reg2, mux1 + shift_out);
    total = total + mux(0, counter, x(idx)) + shift_out;
    counter = mod(counter + 1, 12);
    if counter == 0
        y = [y total];
        total = 0;
    end
end

figure(2);
plot(1:length(actual), actual);
hold on;
plot(12:12:(length(y)*12), y);
hold off;

function [reg_after, output] = shreg(reg_before, input)
    output = reg_before(end);
    reg_after = [input reg_before(1:end-1)];
end

function out = mux(mux_index, counter, bit)
    muxes = [ 97	-97	166	-166	197	-197	198	-198	179	-179	148	-148	114	-114	81	-81	52	-52	31	-31	16	-16	6	-6;
            -2822	2822	-2731	2731	-2555	2555	-2307	2307	-2006	2006	-1671	1671	-1325	1325	-988	988	-678	678	-408	408	-187	187	-20	20;
            -20	20	-187	187	-408	408	-678	678	-988	988	-1325	1325	-1671	1671	-2006	2006	-2307	2307	-2555	2555	-2731	2731	-2822	2822;
            6	-6	16	-16	31	-31	52	-52	81	-81	114	-114	148	-148	179	-179	198	-198	197	-197	166	-166	97	-97];
    index = counter*2;
    if bit == 1
        index = index+1;
    end
    out = muxes(mux_index+1, index+1);
end
