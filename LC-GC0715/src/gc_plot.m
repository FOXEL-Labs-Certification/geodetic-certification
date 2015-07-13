
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

    function gc_plot( gcError, gcTitle, gcFile )

        % Plot figure %
        figure;

        % Plot configuration %
        grid on;
        hold on;
        box  on;

        % Plot configuration %
        set( gca, 'linewidth', 2 );
        set( gca, 'fontsize', 12 );

        % Plot configuration %
        set( gca, 'YDir', 'reverse' );

        % Display tolerence circles %
        plot( [-1:0.01:+1]*0.2, +sin(acos([-1:0.01:+1]))*0.2, 'Color', [ 0.9, 0.3, 0.1 ], 'LineWidth', 2 );
        plot( [-1:0.01:+1]*0.2, -sin(acos([-1:0.01:+1]))*0.2, 'Color', [ 0.9, 0.3, 0.1 ], 'LineWidth', 2 );
        plot( [-1:0.01:+1]*0.1, +sin(acos([-1:0.01:+1]))*0.1, 'Color', [ 0.1, 0.7, 0.4 ], 'LineWidth', 2 );
        plot( [-1:0.01:+1]*0.1, -sin(acos([-1:0.01:+1]))*0.1, 'Color', [ 0.1, 0.7, 0.4 ], 'LineWidth', 2 );

        % Display tolerence areas %
        plot( [ -0.3, +0.3 ], [ +0.2, +0.2 ], '-', 'Color', [ 0.9, 0.3, 0.1 ], 'LineWidth', 2 );
        plot( [ -0.3, +0.3 ], [ -0.2, -0.2 ], '-', 'Color', [ 0.9, 0.3, 0.1 ], 'LineWidth', 2 );
        plot( [ +0.2, +0.2 ], [ -0.3, +0.3 ], '-', 'Color', [ 0.9, 0.3, 0.1 ], 'LineWidth', 2 );
        plot( [ -0.2, -0.2 ], [ -0.3, +0.3 ], '-', 'Color', [ 0.9, 0.3, 0.1 ], 'LineWidth', 2 );
        plot( [ -0.3, +0.3 ], [ +0.1, +0.1 ], '-', 'Color', [ 0.1, 0.7, 0.4 ], 'LineWidth', 2 );
        plot( [ -0.3, +0.3 ], [ -0.1, -0.1 ], '-', 'Color', [ 0.1, 0.7, 0.4 ], 'LineWidth', 2 );
        plot( [ +0.1, +0.1 ], [ -0.3, +0.3 ], '-', 'Color', [ 0.1, 0.7, 0.4 ], 'LineWidth', 2 );
        plot( [ -0.1, -0.1 ], [ -0.3, +0.3 ], '-', 'Color', [ 0.1, 0.7, 0.4 ], 'LineWidth', 2 );

        % Display error - vector %
        plot( [ 0 gcError(1) ], [ 0 gcError(2) ], ':k', 'linewidth', 2 );

        % Display error - point %
        plot( gcError(1), gcError(2), 'ok', 'markersize', 8, 'MarkerFaceColor', 'k' );
        
        % Axis legends %
        xlabel( 'E [m]' );
        ylabel( 'N [m]' );

        % Plot intervalle %
        axis( [ -.3 .3 -.3 .3 ], 'Square' );

        % Display title %
        title( [ gcTitle ' : ' num2str( gcError(3) ) 'm' ] );

        % Export plot %
        if ( length( gcFile ) > 0 ); print( '-depsc', '-r300', '-F24', gcFile ); end

    end

