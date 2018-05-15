# R ~#PROJECT#~


#' Computes the real roots of a quadratic function f(x) = ax^2 + bx + c
#' @param a coefficient of x^2
#' @param b coefficient of x
#' @param c coefficient
#' @export
real.roots <- function(a, b, c)
{
    if (a == 0.)
        stop("Leading term cannot be zero")

    d = b*b - 4*a*c # discriminant

    if (d < 0)
       rr = c()
    else if (d == 0)
       rr = c( -b/(2*a) )
    else
        rr = c( (-b - sqrt(d))/(2*a), (-b + sqrt(d))/(2*a) )

    return(rr)
}
