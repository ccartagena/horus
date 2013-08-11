function [varargout] = update_camerabyfusion(conn, idfusion, camera, station, varargin)

%UPDATE_CAMERABYFUSION   Update a tuple in the table camerabyfusion
%   UPDATE_CAMERABYFUSION(conn, idfusion, camera, station, varargin) updates the
%   tuple identified by 'idfusion', 'camera' and station. Any attribute can
%   be updated and they are given by varargin.
%   The attributes are given as pairs {'AttributeName', 'AttributeValue'}.
%
%   Input:
%   conn: Database connection which must have been previously created.
%   idfusion: ID of the fusion.
%   camera: ID of the camera.
%   station: station where is the fusion.
%   varargin: The attributes are given as pairs {'AttributeName', 'AttributeValue'}.
%
%   Output:
%   varargout: The output argument might or might not be present, if it
%   is, means the status of the transaction. 0 if the insertion was
%   successful, 1 otherwise.
%
%   Example:
%       status = update_camera(conn, 18, 'C3', 'CARTAGENA', 'sequence', 1);
%

% Written by 
% Sebastian Munera Alvarez and 
% Cesar Augusto Cartagena Ocampo 
% for the HORUS Project
% Universidad Nacional de Colombia
%   Copyright 2011 HORUS
%   $Date: 2011/07/22 10:26 $

try
    station = upper(station);
    if nargout==1
        varargout(1)={1};
    end
    
    %reboot connection to the database if necessary
    [conn status] = renew_connection_db(conn);
    
    if status == 1
        return
    end
    
    try
        % Data for updating a camerabyfusion in the database
        colnames = cell(0);
        extdata = cell(0);
        whereclause = ['WHERE idfusion LIKE "' idfusion ...
            '" AND camera LIKE "' camera '" AND station LIKE "' station '"'];
        
        if ~isvalidoption('camerabyfusion', varargin{:})
            disp(dberror('args'));
            return;
        end
        
        noptargs = numel(varargin);
        
        for i = 1:2:noptargs
            arg = varargin{i};
            value = varargin{i+1};
            
            colnames{end+1} = arg;
            extdata{end+1} = value;
        end
        
        update(conn, ['camerabyfusion_' station], colnames, extdata, whereclause);
        if nargout==1
            varargout(1)={0};
        end
    catch e
        disp([dberror('update') e.message]);
    end
    
catch e
    disp(e.message)
end