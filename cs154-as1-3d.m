# x = (v, theta)

function val = f(x) 
    val = sin(x(2)) + x(1)^2 / 2
endfunction

function val = g(x) 
    val = cos(x(2)) - x(1)^2 / 2
endfunction

function val = f_x(x)
    val = x(1)
endfunction

function val = f_y(x)
    val = cos(x(2))
endfunction

function val = g_x(x)
    val = -x(1)
endfunction

function val = g_y(x)
    val = -sin(x(2))
endfunction

function sol = newton_sys(x0)
    tol = 10^-10
    err = 3 * tol
    sol = x0

    while (err > tol)
        jacob = [f_x(sol), f_y(sol); g_x(sol), g_y(sol)]
        f_val = [f(sol), g(sol)]
        delta_x = f_val * inv(jacob)'
        err = sum(delta_x)
        sol = sol - delta_x
    endwhile
endfunction


newton_sys([1, -1])
