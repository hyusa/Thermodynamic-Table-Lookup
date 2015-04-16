%% Thermodynamic Table Lookup
clc; clear all
%% Initial Selection
substance = menu('Please select a substance', 'water', 'refrigerant 22', 'refrigerant 134a', 'ammonia', 'propane');
switch substance
    case 1
    water_state = menu('Select State', 'Saturated Water', 'Superheated Water Vapor', 'Compressed Liquid Water', 'State Not Known');
    switch water_state
    % Saturated
        case 1
        sat_state = menu('Select saturation state', 'liquid-vapor', 'solid-vapor');
        switch sat_state
            % Liquid-Vapor
            case 1
                load('sat_water_liqvap.txt')
                table = sat_water_liqvap;
                % Known 1
        known_prop1 = menu('First known property', 'specific volume', 'internal energy', 'enthalpy', 'entropy', 'temperature', 'pressure');
        switch known_prop1
            case 1
                disp('Input of specific volume of saturated liquid (Vf) should be multiplied by 10^3')
                specV = input('Please input specific volume in m^3/kg: ');
                case 2
                    int_eng = input('Please input internal energy in kJ/kg: ');
                case 3
                    enth = input('Please input enthalpy in kJ/kg: ');
                case 4
                    entropy = input('Please input entropy in kJ/kg*K: ');
                case 5
                    temp = input('please input the temperature in degrees celcius ');
                case 6
                    pres = input('please input pressure in bar ');
        end
            if known_prop1 == 1
                int_eng = 0; enth = 0; entropy = 0; temp = 0; pres = 0;
            elseif known_prop1 == 2
                specV = 0; enth = 0; entropy = 0; temp = 0; pres = 0;
            elseif known_prop1 == 3
                specV = 0; int_eng = 0; entropy = 0; temp = 0; pres = 0;
            elseif known_prop1 == 4
                specV = 0; int_eng = 0; enth = 0; temp = 0; pres = 0;
            elseif known_prop1 == 5
                specV = 0; int_eng = 0; enth = 0; entropy = 0; pres = 0;
            else specV = 0; int_eng = 0; enth = 0; entropy = 0; temp = 0;
            end
            % Known 2
            known_prop2 = menu('Second known property', 'specific volume', 'internal energy', 'enthalpy', 'entropy', 'temperature', 'pressure');
            switch known_prop2
                case 1
                    disp('Input of specific volume of saturated liquid (Vf) should be multiplied by 10^3')
                    specV = input('Please input specific volume in m^3/kg: ');
                case 2
                    int_eng = input('Please input internal energy in kJ/kg: ');
                case 3
                    enth = input('Please input enthalpy in kJ/kg: ');
                case 4
                    entropy = input('Please input entropy in kJ/kg*K: ');
                case 5
                    temp = input('please input the temperature in degrees celcius ');
                case 6
                    pres = input('please input pressure in bar ');
            end
            %% Create and display table of wanted values in a gui
            cnames = {'Temp C','Press. bar','Spec. V. m^3/kg (vf*10^3)', 'Spec. V. m^3/kg (vg)','Internal Energy kJ/kg (uf)', 'Internal Energy kJ/kg (ug)','Enthalpy Sat. Liquid kJ/kg (hf)', 'Enthalpy Evap. (hfg)','Enthalpy Sat. Vapor (hg)','Entropy kJ/kg*K Sat. Liquid (sf)', 'Entropy kJ/kg*K Sat. Vapor (sg)'};
            t = uitable('Data',wanted,'ColumnName',cnames);
         %% Solid-Vapor region
         case 2
            load('sat_water_solvap.txt')
            table = sat_water_solvap;
            % Known 1
        known_prop1 = menu('First known property', 'specific volume', 'internal energy', 'enthalpy', 'entropy', 'temperature', 'pressure');
            switch known_prop1
            case 1
                disp('Input of specific volume of saturated liquid (Vf) should be multiplied by 10^3')
                specV = input('Please input specific volume in m^3/kg: ');
                case 2
                    int_eng = input('Please input internal energy in kJ/kg: ');
                case 3
                    enth = input('Please input enthalpy in kJ/kg: ');
                case 4
                    entropy = input('Please input entropy in kJ/kg*K: ');
                case 5
                    temp = input('please input the temperature in degrees celcius ');
                case 6
                    pres = input('please input pressure in kPa ');
            end
            if known_prop1 == 1
                int_eng = 0; enth = 0; entropy = 0; temp = 0; pres = 0;
            elseif known_prop1 == 2
                specV = 0; enth = 0; entropy = 0; temp = 0; pres = 0;
            elseif known_prop1 == 3
                specV = 0; int_eng = 0; entropy = 0; temp = 0; pres = 0;
            elseif known_prop1 == 4
                specV = 0; int_eng = 0; enth = 0; temp = 0; pres = 0;
            elseif known_prop1 == 5
                specV = 0; int_eng = 0; enth = 0; entropy = 0; pres = 0;
            else specV = 0; int_eng = 0; enth = 0; entropy = 0; temp = 0;
            end
            % Known 2
            known_prop2 = menu('Second known property', 'specific volume', 'internal energy', 'enthalpy', 'entropy', 'temperature', 'pressure');
            switch known_prop2
                case 1
                    disp('Input of specific volume of saturated liquid (Vf) should be multiplied by 10^3')
                    specV = input('Please input specific volume in m^3/kg: ');
                case 2
                    int_eng = input('Please input internal energy in kJ/kg: ');
                case 3
                    enth = input('Please input enthalpy in kJ/kg: ');
                case 4
                    entropy = input('Please input entropy in kJ/kg*K: ');
                case 5
                    temp = input('please input the temperature in degrees celcius ');
                case 6
                    pres = input('please input pressure in kPa ');
            end
            %% Create and display table of wanted values in a gui
            cnames = {'Temp C','Press. kPa','Spec. V. Sat. Solid m^3/kg (vi*10^3)', 'Spec. V. Sat. Vapor m^3/kg (vg)','Internal Energy kJ/kg Sat. Solid (ui)', 'Internal Energy kJ/kg Subl. (uig)', 'Internal Energy kJ/kg Sat. Vapor (ug)','Enthalpy Sat. Solid kJ/kg (hi)', 'Enthalpy Subl. (hig)','Enthalpy Sat. Vapor (hg)','Entropy kJ/kg*K Sat. Solid (si)', 'Entropy kJ/kg*K Subl. (sig)', 'Entropy kJ/kg*K Sat. Vapor (sg)'};
            t = uitable('Data',wanted,'ColumnName',cnames);
        end
        %% Super Heated Water Vapor
        case 2
            
        %% Compressed Liquid Water
        case 3
    %% Property not known
    case 4
        % Known 1
        known_prop1 = menu('First known property', 'specific volume', 'internal energy', 'enthalpy', 'entropy', 'temperature', 'pressure');
        switch known_prop1
            case 1
                disp('Input of specific volume of saturated liquid (Vf) should be multiplied by 10^3')
                specV = input('Please input specific volume in m^3/kg: ');
                case 2
                    int_eng = input('Please input internal energy in kJ/kg: ');
                case 3
                    enth = input('Please input enthalpy in kJ/kg: ');
                case 4
                    entropy = input('Please input entropy in kJ/kg*K: ');
                case 5
                    temp = input('please input the temperature in degrees celcius ');
                case 6
                    pres = input('please input pressure in bar ');
        end
            if known_prop1 == 1
                int_eng = 0; enth = 0; entropy = 0; temp = 0; pres = 0;
            elseif known_prop1 == 2
                specV = 0; enth = 0; entropy = 0; temp = 0; pres = 0;
            elseif known_prop1 == 3
                specV = 0; int_eng = 0; entropy = 0; temp = 0; pres = 0;
            elseif known_prop1 == 4
                specV = 0; int_eng = 0; enth = 0; temp = 0; pres = 0;
            elseif known_prop1 == 5
                specV = 0; int_eng = 0; enth = 0; entropy = 0; pres = 0;
            else specV = 0; int_eng = 0; enth = 0; entropy = 0; temp = 0;
            end
            % Known 2
            known_prop2 = menu('Second known property', 'specific volume', 'internal energy', 'enthalpy', 'entropy', 'temperature', 'pressure');
            switch known_prop2
                case 1
                    disp('Input of specific volume of saturated liquid (Vf) should be multiplied by 10^3')
                    specV = input('Please input specific volume in m^3/kg: ');
                case 2
                    int_eng = input('Please input internal energy in kJ/kg: ');
                case 3
                    enth = input('Please input enthalpy in kJ/kg: ');
                case 4
                    entropy = input('Please input entropy in kJ/kg*K: ');
                case 5
                    temp = input('please input the temperature in degrees celcius ');
                case 6
                    pres = input('please input pressure in bar ');
            end
    end
end
%%
tempt = table(:,1); % temperature column
prest = table(:,2); % pressure column
othert = table(:,[3,4,5,6,7,8,9]); % rest of the properties in a matrix
wanted = interp2(tempt,prest,othert,temp,pres);
%known_table = [temp, pres, specV, int_eng, enth, entropy];
%result = zeros(size(table));
%for i = 1: size(known_table,1)
%    result = result + ( table == known_table(1,i) );
%end
%[row,col] = find(result == 1);
%wanted = table(row,:);

