(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Postiats - Unleashing the Potential of Types!
** Copyright (C) 2011-2013 Hongwei Xi, ATS Trustful Software, Inc.
** All rights reserved
**
** ATS is free software;  you can  redistribute it and/or modify it under
** the terms of  the GNU GENERAL PUBLIC LICENSE (GPL) as published by the
** Free Software Foundation; either version 3, or (at  your  option)  any
** later version.
** 
** ATS is distributed in the hope that it will be useful, but WITHOUT ANY
** WARRANTY; without  even  the  implied  warranty  of MERCHANTABILITY or
** FITNESS FOR A PARTICULAR PURPOSE.  See the  GNU General Public License
** for more details.
** 
** You  should  have  received  a  copy of the GNU General Public License
** along  with  ATS;  see the  file COPYING.  If not, please write to the
** Free Software Foundation,  51 Franklin Street, Fifth Floor, Boston, MA
** 02110-1301, USA.
*)

(* ****** ****** *)

(* Author: Hongwei Xi *)
(* Authoremail: hwxi AT cs DOT bu DOT edu *)
(* Start time: October, 2013 *)

(* ****** ****** *)
  
#define ATS_PACKNAME "ATSLIB.libats.stringbuf"
#define ATS_DYNLOADFLAG 0 // no need for dynloading at run-time
#define ATS_EXTERN_PREFIX "atslib_" // prefix for external names
  
(* ****** ****** *)

staload
UN = "prelude/SATS/unsafe.sats"

(* ****** ****** *)

staload "libats/SATS/stringbuf.sats"

(* ****** ****** *)
//
// HX:
// recapacitizing policy
// 0: manual
// 1: automatic doubling
//
implement{}
stringbuf$recapacitize () = 1 // default policy
//
(* ****** ****** *)
//
datavtype
stringbuf =
{m:nat}
STRINGBUF of (arrayptr(char, m+1), ptr(*cur*), size_t(m))
//
(* ****** ****** *)

assume stringbuf_vtype = stringbuf

(* ****** ****** *)

implement{
} stringbuf_get_size
  (sbf) = let
  val+STRINGBUF (A, p, _) = sbf
in
  $UN.cast{size_t}(p - ptrcast(A))
end // end of [stringbuf_get_size]

implement{
} stringbuf_get_capacity
  (sbf) =
  let val+STRINGBUF (_, _, cap) = sbf in cap end
// end of [stringbuf_get_capacity]

(* ****** ****** *)

implement{
} stringbuf_make_cap
  (cap) = (sbf) where
{
//
prval [m:int] EQINT() = g1uint_get_index (cap)
//
val A = arrayptr_make_uninitized<char> (succ(cap))
//
val p_A = ptrcast (A)
//
val sbf = STRINGBUF ($UN.castvwtp0{arrayptr(char,m+1)}(A), p_A, cap)
//
} // end of [stringbuf_make_cap]

(* ****** ****** *)

implement{
} stringbuf_free (sbf) =
  let val+~STRINGBUF (A, _, _) = sbf in arrayptr_free (A) end
// end of [stringbuf_free]

(* ****** ****** *)

implement{
} stringbuf_getfree_strnptr
  (sbf, n0) = let
  val+~STRINGBUF (A, p, _) = sbf
  val () = $UN.ptr0_set<char>(p, '\000')
  val [n:int] n = $UN.cast{sizeGte(0)}(p - ptrcast(A))
  val ((*void*)) = n0 := n
in
  $UN.castvwtp0{strnptr(n)}(A)
end // end of [stringbuf_getfree_strnptr]

(* ****** ****** *)

(* end of [stringbuf.dats] *)