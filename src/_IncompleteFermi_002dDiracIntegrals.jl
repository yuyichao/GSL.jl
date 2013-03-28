#!/usr/bin/env julia
#GSL Julia wrapper
#(c) 2013 Jiahao Chen <jiahao@mit.edu>
###########################################
# 7.18.2 Incomplete Fermi-Dirac Integrals #
###########################################
export gsl_sf_fermi_dirac_inc_0, gsl_sf_fermi_dirac_inc_0_e


# These routines compute the incomplete Fermi-Dirac integral with an index of
# zero,  F_0(x,b) = \ln(1 + e^{b-x}) - (b-x).
# 
#   {$F_0(x,b) = \ln(1 + e^{b-x}) - (b-x)$} 
#   Exceptional Return Values: GSL_EUNDRFLW, GSL_EDOM 
#   Returns: Cdouble
function gsl_sf_fermi_dirac_inc_0 (x::Cdouble, b::Cdouble)
    ccall( (:gsl_sf_fermi_dirac_inc_0, "libgsl"), Cdouble, (Cdouble,
        Cdouble), x, b )
end


### Function uses unknown type; disabled
### # These routines compute the incomplete Fermi-Dirac integral with an index of
# zero,  F_0(x,b) = \ln(1 + e^{b-x}) - (b-x).
# 
### #   Returns: Cint
### #XXX Unknown input type result::Ptr{gsl_sf_result}
### function gsl_sf_fermi_dirac_inc_0_e (x::Cdouble, b::Cdouble, result::Ptr{gsl_sf_result})
###     ccall( (:gsl_sf_fermi_dirac_inc_0_e, "libgsl"), Cint, (Cdouble,
###         Cdouble, Ptr{gsl_sf_result}), x, b, result )
### end