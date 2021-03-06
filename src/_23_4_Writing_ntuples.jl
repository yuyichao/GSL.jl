#!/usr/bin/env julia
#GSL Julia wrapper
#(c) 2013 Jiahao Chen <jiahao@mit.edu>
########################
# 23.4 Writing ntuples #
########################
export ntuple_write, ntuple_bookdata


# This function writes the current ntuple ntuple->ntuple_data of size
# ntuple->size to the corresponding file.
# 
#   Returns: Cint
function ntuple_write()
    ntuple = Ref{gsl_ntuple}()
    errno = ccall( (:gsl_ntuple_write, libgsl), Cint, (Ref{gsl_ntuple}, ),
        ntuple )
    if errno!= 0 throw(GSL_ERROR(errno)) end
    return ntuple[]
end


# This function is a synonym for gsl_ntuple_write.
# 
#   Returns: Cint
function ntuple_bookdata()
    ntuple = Ref{gsl_ntuple}()
    errno = ccall( (:gsl_ntuple_bookdata, libgsl), Cint, (Ref{gsl_ntuple},
        ), ntuple )
    if errno!= 0 throw(GSL_ERROR(errno)) end
    return ntuple[]
end
