# task 1a
function val = f(x)
    val = x^5 + 3*x^2 - 9
endfunction

function sol = bisect(x0, x1)
    err = (x1 - x0) / 2
    tol = 10^-3
    
    while (err > tol)
        mid = (x0 + x1) / 2
        if (f(mid) == 0)
            sol = mid
            break;
        elseif f(x0) * f(mid) < 0
            x1 = mid
        else
            x0 = mid
        endif
        err = (x1 - x0) / 2
    endwhile
    
    sol = mid
endfunction

# task 1b
function val = f_prime(x)
    val = 5*x^4 + 6*x
endfunction

function sol = newton(x0)
    tol = 10^-3
    err = 3 * tol
    
    while (err > tol)
        delta_x = f(x_0) / f_prime(x_0)
        err = abs(delta_x)
        x_0 = x_0 - delta_x
    endwhile
    
    sol = x0
endfunction
    
# task 2a
function val = f(x) 
    val = x(1)^2 + x(2)^2 - 4
endfunction

function val = g(x) 
    val = x(1)^3 - x(2)
endfunction

function val = f_x(x)
    val = 2*x(1)
endfunction

function val = f_y(x)
    val = 2*x(2)
endfunction

function val = g_x(x)
    val = 3*x(1)^2
endfunction

function val = g_y(x)
    val = -1
endfunction

function sol = newton_sys(x0)
    tol = 10^-3
    err = 3 * tol
    sol = x0

    while (err > tol)
        jacob = [f_x(sol), f_y(sol); g_x(sol), g_y(sol)]
        f_val = [f(sol), g(sol)]
        delta_x = f_val * inv(jacob)
        err = sum(delta_x)
        sol = sol - delta_x
    endwhile
endfunction
