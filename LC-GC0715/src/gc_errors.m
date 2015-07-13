
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

    function gc_errors( gcPath )

        % Load origin file %
        gcOr = load( [ gcPath '/origin.xyz' ] );

        % Load reference points - planimetry %
        gcR1 = load( [ gcPath '/references/refo1.dat' ] );
        gcR2 = load( [ gcPath '/references/refo2.dat' ] );
        gcR3 = load( [ gcPath '/references/refo3.dat' ] );
        gcR4 = load( [ gcPath '/references/refo4.dat' ] );

        % Load measure points - planimetry - rotation center %
        gco1p1 = gc_center( [ gcPath '/measures/obj1_pc1.dat' ], gcOr );
        gco1p2 = gc_center( [ gcPath '/measures/obj1_pc2.dat' ], gcOr );
        gco1p3 = gc_center( [ gcPath '/measures/obj1_pc3.dat' ], gcOr );
        gco2p1 = gc_center( [ gcPath '/measures/obj2_pc1.dat' ], gcOr );
        gco2p2 = gc_center( [ gcPath '/measures/obj2_pc2.dat' ], gcOr );
        gco2p3 = gc_center( [ gcPath '/measures/obj2_pc3.dat' ], gcOr );
        gco3p2 = gc_center( [ gcPath '/measures/obj3_pc2.dat' ], gcOr );
        gco3p3 = gc_center( [ gcPath '/measures/obj3_pc3.dat' ], gcOr );
        gco4p3 = gc_center( [ gcPath '/measures/obj4_pc3.dat' ], gcOr );

        % Compute errors - planimetry %
        gco1p1e = [ gco1p1(1) - gcR1(1), gco1p1(2) - gcR1(2), 1 ]; gco1p1e(3) = sqrt( gco1p1e(1) * gco1p1e(1) + gco1p1e(2) * gco1p1e(2) );
        gco1p2e = [ gco1p2(1) - gcR1(1), gco1p2(2) - gcR1(2), 1 ]; gco1p2e(3) = sqrt( gco1p2e(1) * gco1p2e(1) + gco1p2e(2) * gco1p2e(2) );
        gco1p3e = [ gco1p3(1) - gcR1(1), gco1p3(2) - gcR1(2), 1 ]; gco1p3e(3) = sqrt( gco1p3e(1) * gco1p3e(1) + gco1p3e(2) * gco1p3e(2) );
        gco2p1e = [ gco2p1(1) - gcR2(1), gco2p1(2) - gcR2(2), 1 ]; gco2p1e(3) = sqrt( gco2p1e(1) * gco2p1e(1) + gco2p1e(2) * gco2p1e(2) );
        gco2p2e = [ gco2p2(1) - gcR2(1), gco2p2(2) - gcR2(2), 1 ]; gco2p2e(3) = sqrt( gco2p2e(1) * gco2p2e(1) + gco2p2e(2) * gco2p2e(2) );
        gco2p3e = [ gco2p3(1) - gcR2(1), gco2p3(2) - gcR2(2), 1 ]; gco2p3e(3) = sqrt( gco2p3e(1) * gco2p3e(1) + gco2p3e(2) * gco2p3e(2) );
        gco3p2e = [ gco3p2(1) - gcR3(1), gco3p2(2) - gcR3(2), 1 ]; gco3p2e(3) = sqrt( gco3p2e(1) * gco3p2e(1) + gco3p2e(2) * gco3p2e(2) );
        gco3p3e = [ gco3p3(1) - gcR3(1), gco3p3(2) - gcR3(2), 1 ]; gco3p3e(3) = sqrt( gco3p3e(1) * gco3p3e(1) + gco3p3e(2) * gco3p3e(2) );
        gco4p3e = [ gco4p3(1) - gcR4(1), gco4p3(2) - gcR4(2), 1 ]; gco4p3e(3) = sqrt( gco4p3e(1) * gco4p3e(1) + gco4p3e(2) * gco4p3e(2) );

        % Display errors - planimetry %
        printf( 'o1p1 = ( %f, %f ) : %f\n', gco1p1e(1), gco1p1e(2), gco1p1e(3) );
        printf( 'o1p2 = ( %f, %f ) : %f\n', gco1p2e(1), gco1p2e(2), gco1p2e(3) );
        printf( 'o1p3 = ( %f, %f ) : %f\n', gco1p3e(1), gco1p3e(2), gco1p3e(3) );
        printf( 'o2p1 = ( %f, %f ) : %f\n', gco2p1e(1), gco2p1e(2), gco2p1e(3) );
        printf( 'o2p2 = ( %f, %f ) : %f\n', gco2p2e(1), gco2p2e(2), gco2p2e(3) );
        printf( 'o2p3 = ( %f, %f ) : %f\n', gco2p3e(1), gco2p3e(2), gco2p3e(3) );
        printf( 'o3p2 = ( %f, %f ) : %f\n', gco3p2e(1), gco3p2e(2), gco3p2e(3) );
        printf( 'o3p3 = ( %f, %f ) : %f\n', gco3p3e(1), gco3p3e(2), gco3p3e(3) );
        printf( 'o4p3 = ( %f, %f ) : %f\n', gco4p3e(1), gco4p3e(2), gco4p3e(3) );

        % Export graphics - planimetry %
        errors_plot( gco1p1e, 'Objet 1, Nuage 1 - Absolute error', '../dev/plots/eo1p1.eps' );
        errors_plot( gco1p2e, 'Objet 1, Nuage 2 - Absolute error', '../dev/plots/eo1p2.eps' );
        errors_plot( gco1p3e, 'Objet 1, Nuage 3 - Absolute error', '../dev/plots/eo1p3.eps' );
        errors_plot( gco2p1e, 'Objet 2, Nuage 1 - Absolute error', '../dev/plots/eo2p1.eps' );
        errors_plot( gco2p2e, 'Objet 2, Nuage 2 - Absolute error', '../dev/plots/eo2p2.eps' );
        errors_plot( gco2p3e, 'Objet 2, Nuage 3 - Absolute error', '../dev/plots/eo2p3.eps' );
        errors_plot( gco3p2e, 'Objet 3, Nuage 2 - Absolute error', '../dev/plots/eo3p2.eps' );
        errors_plot( gco3p3e, 'Objet 3, Nuage 3 - Absolute error', '../dev/plots/eo3p3.eps' );
        errors_plot( gco4p3e, 'Objet 4, Nuage 3 - Absolute error', '../dev/plots/eo4p3.eps' );

    end

    function errors_plot( gcErr, title_, name_ )

        % Figure %
        figure;

        % Configuration %
        grid on;
        hold on;
        box  on;

        % Configuration %
        set( gca, 'linewidth', 2 );
        set( gca, 'fontsize', 12 );

        % Configuration %
        set( gca, 'YDir', 'reverse' );

        errors_target(0.1);

        % Display error %
        plot( [ 0 gcErr(1) ], [ 0 gcErr(2) ], ':k', 'linewidth', 2 );

        % Display error %
        plot( gcErr(1), gcErr(2), 'ok', 'markersize', 8, 'MarkerFaceColor', 'k' );
        

        % Axis legends %
        xlabel( 'E [m]' );
        ylabel( 'N [m]' );

        % Plot intervalle %
        axis( [ -.5 .5 -.5 .5 ], 'Square' );

        % Display title %
        title( [ title_ ' : ' num2str( gcErr(3) ) 'm' ] );

        % Export figure %
        if ( length( name_ ) > 0 ); print( '-depsc', '-r300', '-F24', name_ ); end

    end

    function errors_target( gcTol )

        % Create area plot %
        gcx = [-1:0.01:1] * gcTol * 2;
        gcu = [ ...
              + zeros( 1, length( gcx ) ); ...
              - sin( acos( [-1:0.01:1] ) ) * gcTol * 2, ...
              ];
        gcd = [ ...
              + zeros( 1, length( gcx ) ); ...
              + sin( acos( [-1:0.01:1] ) ) * gcTol * 2, ...
              ];

        % Display target circle %
        gcHU = area( gcx, gcu', 'EdgeColor', 'None', 'LineStyle', ':', 'Linewidth', 2 );
        gcHD = area( gcx, gcd', 'EdgeColor', 'None', 'LineStyle', ':', 'Linewidth', 2 );

        % Configuration %
        set( gcHU(2), 'FaceColor', [ 0.9 0.9 0.9 ] );
        set( gcHD(2), 'FaceColor', [ 0.9 0.9 0.9 ] );

        % Create area plot %
        gcx = [-1:0.01:1] * gcTol;
        gcu = [ ...
              + zeros( 1, length( gcx ) ); ...
              - sin( acos( [-1:0.01:1] ) ) * gcTol, ...
              ];
        gcd = [ ...
              + zeros( 1, length( gcx ) ); ...
              + sin( acos( [-1:0.01:1] ) ) * gcTol, ...
              ];

        % Display target circle %
        gcHU = area( gcx, gcu', 'EdgeColor', 'None', 'LineStyle', ':', 'Linewidth', 2 );
        gcHD = area( gcx, gcd', 'EdgeColor', 'None', 'LineStyle', ':', 'Linewidth', 2 );

        % Configuration %
        set( gcHU(2), 'FaceColor', [ 0.6 0.6 0.6 ] );
        set( gcHD(2), 'FaceColor', [ 0.6 0.6 0.6 ] );

        % Display borders %
        plot( [-1:0.01:+1]*0.2, +sin(acos([-1:0.01:+1]))*0.2, 'Color', [ 0.9, 0.3, 0.1 ], 'LineWidth', 2 );
        plot( [-1:0.01:+1]*0.2, -sin(acos([-1:0.01:+1]))*0.2, 'Color', [ 0.9, 0.3, 0.1 ], 'LineWidth', 2 );
        plot( [-1:0.01:+1]*0.1, +sin(acos([-1:0.01:+1]))*0.1, 'Color', [ 0.1, 0.7, 0.4 ], 'LineWidth', 2 );
        plot( [-1:0.01:+1]*0.1, -sin(acos([-1:0.01:+1]))*0.1, 'Color', [ 0.1, 0.7, 0.4 ], 'LineWidth', 2 );

    end

