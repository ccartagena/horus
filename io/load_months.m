function  data  = load_months(conn,station,years)

%LOAD_MONTHS this function is used for querying all the months for oblique
%images in a station for a given year.
%
%   Input:
%   conn: Database connection which must have been previously created.
%   station: station name.
%   years: Year for the search.
%
%   Output:
%   data: cell array with the months.
%
%   Example:
%   data  = load_months(conn, 'CARTAGENA',2010);
%
%   See also LOAD_NEARESTIMAGE, LOAD_IMAGECAM, LOAD_FUSION,
%   LOAD_CALIBRATION, LOAD_roi

% Written by 
% Sebastian Munera Alvarez and 
% Cesar Augusto Cartagena Ocampo 
% for the HORUS Project
% Universidad Nacional de Colombia
%   Copyright 2011 HORUS
%   $Date: 2011/07/28 15:40 $

try
    station = upper(station);
    data = [];
    
    % query in the database
    
    %reboot connection to the database if necessary
    [conn status] = renew_connection_db(conn);
    
    if status == 1
        return
    end
    
    year_ini = datenum(years,01,01);
    year_fin = datenum(years+1,00,00);
    
    try
        query = ['SELECT DISTINCT FLOOR(timestamp) FROM image_' station ' NATURAL JOIN '...
            'obliqueimage_' station ' WHERE ismini = 0 AND station LIKE "' station '" ' ...
            'AND timestamp BETWEEN ' num2str(year_ini,17) ' AND ' ...
            num2str(year_fin,17) ' ORDER BY timestamp'];
        cursor = exec(conn, query);
        cursor = fetch(cursor);
        if strcmpi(cursor.Data{1,1}, 'No Data') || isfloat(cursor.Data)
            data = [];
            return;
        end
        timestamp = get(cursor, 'Data');
        data = cell(0);
        timestamp = cell2mat(timestamp);
        i=1;
        while i <= numel(timestamp)
            months = month(timestamp(i));
            ind = find(timestamp > datenum(years,months+1,0));
            data{end+1,1} = months;
            if isempty(ind)
                i= numel(timestamp) + 1;
            else
                i= ind(1);
            end
            
        end
        
    catch e
        disp([dberror('select') e.message]);
    end
    
catch e
    disp(e.message)
end

end