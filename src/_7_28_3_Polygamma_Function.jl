#!/usr/bin/env julia
#GSL Julia wrapper
#(c) 2013 Jiahao Chen <jiahao@mit.edu>
#############################
# 7.28.3 Polygamma Function #
#############################
export gsl_sf_psi_n, gsl_sf_psi_n_e


# These routines compute the polygamma function  \psi^{(n)}(x) for  n >= 0, x >
# 0.
# 
#   Returns: Cdouble
function gsl_sf_psi_n{gsl_int<:Integer}(n::gsl_int, x::Cdouble)
    ccall( (:gsl_sf_psi_n, :libgsl), Cdouble, (Cint, Cdouble), n, x )
end


# These routines compute the polygamma function  \psi^{(n)}(x) for  n >= 0, x >
# 0.
# 
#   Returns: Cint
function gsl_sf_psi_n_e{gsl_int<:Integer}(n::gsl_int, x::Cdouble)
    result = convert(Ptr{gsl_sf_result}, Array(gsl_sf_result, 1))
    gsl_errno = ccall( (:gsl_sf_psi_n_e, :libgsl), Cint, (Cint, Cdouble,
        Ptr{gsl_sf_result}), n, x, result )
    if gsl_errno!= 0 throw(GSL_ERROR(gsl_errno)) end
    return unsafe_ref(result)
end