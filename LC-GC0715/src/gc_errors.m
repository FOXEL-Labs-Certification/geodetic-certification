
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
        gc_plot( gco1p1e, 'Object 1, Cloud 1', '../dev/plots/eo1p1.eps' );
        gc_plot( gco1p2e, 'Object 1, Cloud 2', '../dev/plots/eo1p2.eps' );
        gc_plot( gco1p3e, 'Object 1, Cloud 3', '../dev/plots/eo1p3.eps' );
        gc_plot( gco2p1e, 'Object 2, Cloud 1', '../dev/plots/eo2p1.eps' );
        gc_plot( gco2p2e, 'Object 2, Cloud 2', '../dev/plots/eo2p2.eps' );
        gc_plot( gco2p3e, 'Object 2, Cloud 3', '../dev/plots/eo2p3.eps' );
        gc_plot( gco3p2e, 'Object 3, Cloud 2', '../dev/plots/eo3p2.eps' );
        gc_plot( gco3p3e, 'Object 3, Cloud 3', '../dev/plots/eo3p3.eps' );
        gc_plot( gco4p3e, 'Object 4, Cloud 3', '../dev/plots/eo4p3.eps' );

    end

