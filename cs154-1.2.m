# task 1a
function poly_interp(x, y)
    vand = vander(x)
    a = y * inv(vand)'
    printf(a)
endfunction

function cube(elem)
    cube = [elem^3, elem^2, elem, 1]
endfunction

function deriv_1(elem)
    deriv_1 = [3 * elem^2, 2 * elem, 1, 0]
endfunction

function deriv_2(elem)
    deriv_2 = [6 * elem, 2 0, 0]
endfunction

function add_zeros(x)
    add_zeros = [x, 0, 0, 0, 0]
endfunctino

# task 2a
function cub_spline(x, y)
    x11 = x(1) - x(1)
    x12 = x(2) - x(1)
    x22 = x(2) - x(2)
    x23 = x(3) - x(2)

    constr = [
        # s1
        [cube(x11), 0, 0, 0, 0];
        [cube(x12), 0, 0, 0, 0];
        [0, 0, 0, 0, cube(x22)];
        [0, 0, 0, 0, cube(x23)];
        [deriv_1(x12), deriv_1(x12)];
        [deriv_2(x12), deriv_2(x12)];
        [deriv_2(x11), 0, 0, 0, 0];
        [0, 0, 0, 0, deriv_2(x33)];
    ]
    coefs = y * inv(constr)
    
endfunctionf
