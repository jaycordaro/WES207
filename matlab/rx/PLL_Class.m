classdef PLL_Class
    properties (Access = private)
        error_int_prev;
        error_prev;
        oscilator_phase_prev;
        freq_prev;
        isCostas;
        fn;
        zeta;
        Kt;
        Ts;
    end
    
    properties (Access = public)
        frequency_output;
        iq_output;
        curr_frequency;
        curr_phase;
    end
    
    methods (Access = private)

        function e = phase_comparator(obj, s)
            if obj.isCostas
                e = real(s)*imag(s);
            else
                e = imag(s);
            end
        end

        function [freq, obj] = loop_filter(obj, error)
            Ka = pi * obj.fn / obj.zeta;

            error_int = obj.error_int_prev + Ka*(obj.Ts/2)*(error + obj.error_prev);
            obj.error_int_prev = error_int;
            obj.error_prev = error;

            freq = error + error_int;
        end

        function [oscilator_phase, obj] = nco(obj, freq)
            oscilator_phase = obj.oscilator_phase_prev + obj.Ts*(freq);

            obj.oscilator_phase_prev = oscilator_phase;
            obj.freq_prev = freq;
        end
    end
    
    methods (Access = public)
        function obj = PLL_Class(isCostas, fn, zeta, Kt, Ts)
            obj.isCostas = isCostas;
            obj.fn = fn;
            obj.zeta = zeta;
            obj.Kt = Kt;
            obj.Ts = Ts;
            obj = resetPLL(obj);
        end
        
        function obj = resetPLL(obj)
            obj.error_int_prev = 0;
            obj.error_prev = 0;
            obj.oscilator_phase_prev = 0;
            obj.freq_prev = 0;
            
            obj.frequency_output = [];
            obj.iq_output = [];
            obj.curr_frequency = 0;
            obj.curr_phase = 0;
        end
        
        function obj = setPhase(obj, phase)
            obj.curr_phase = phase;
        end

        function obj = runPLL(obj, input)
            theta = 0;
            obj.oscilator_phase_prev = 0;
            for idx = 1:length(input)
                x = input(idx);
                s = x*exp(i*theta);
                obj.iq_output = [obj.iq_output s];
                error = phase_comparator(obj, s);
                scaled_error = error*obj.Kt;
                [freq, obj] = loop_filter(obj, scaled_error);
                obj.frequency_output = [obj.frequency_output freq/(2*pi)];
                [oscilator_phase, obj] = nco(obj, (freq - obj.curr_frequency));
                theta = -oscilator_phase;
            end
            
            [oscilator_phase, obj] = nco(obj, obj.curr_frequency*length(input));
            theta = -oscilator_phase;
            obj.curr_phase = theta + obj.curr_phase;
            obj.curr_frequency = freq;
        end
    end
end