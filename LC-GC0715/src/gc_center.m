
    % FOXEL Labs - Laboratory of Certification - Geodetic certification
    %
    % Copyright (c) 2013-2015 FOXEL SA - http://foxel.ch
    % Please read <http://foxel.ch/license> for more information.
    %
    %
    % Author(s):
    %
    %      Nils Hamel <n.hamel@foxel.ch>
    %
    %
    % This file is part of the FOXEL project <http://foxel.ch>.
    %
    % This program is free software: you can redistribute it and/or modify
    % it under the terms of the GNU Affero General Public License as published by
    % the Free Software Foundation, either version 3 of the License, or
    % (at your option) any later version.
    %
    % This program is distributed in the hope that it will be useful,
    % but WITHOUT ANY WARRANTY; without even the implied warranty of
    % MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    % GNU Affero General Public License for more details.
    %
    % You should have received a copy of the GNU Affero General Public License
    % along with this program.  If not, see <http://www.gnu.org/licenses/>.
    %
    %
    % Additional Terms:
    %
    %      You are required to preserve legal notices and author attributions in
    %      that material or in the Appropriate Legal Notices displayed by works
    %      containing it.
    %
    %      You are required to attribute the work as explained in the "Usage and
    %      Attribution" section of <http://foxel.ch/license>.

    function gcCenter = gc_center( gcFile, gcOrigin )

        % Load measure file data %
        gcDa = load( gcFile );

        % Compute rotation center %
        gcCenter(1) = 0.5 * ( max( gcDa(:,1) ) + min( gcDa(:,1) ) );
        gcCenter(2) = 0.5 * ( max( gcDa(:,2) ) + min( gcDa(:,2) ) );

        % Restor secondary origin %
        gcCenter(1) = gcCenter(1) + gcOrigin(1);
        gcCenter(2) = gcCenter(2) + gcOrigin(2);

    end
